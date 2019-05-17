package com.lyh.my_ebuy_ssm.controller.admin.admin;

import com.lyh.my_ebuy_ssm.model.Admin;
import com.lyh.my_ebuy_ssm.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin/admin")
public class AdminController {

    @Resource
    private AdminService adminService;


    /**
     * 管理员个人密码
     * @param oidPassword   旧密码
     * @param newPassword   新密码
     * @param confirmPassword   确认密码
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/updatePassword")
    public Map<String, Object> updatePassword(String oidPassword, String newPassword, String confirmPassword, HttpSession session){
        Map<String, Object> map = new HashMap<String, Object>();

        //首先判断旧密码是正确的 - - 从数据库里面确认
        Admin admin = (Admin) session.getAttribute("admin");
        if (adminService.login(admin.getUsername(),oidPassword)!= null){    //如果登录成功，即原密码正确
            //判断新密码和确认密码是否一致
            if (newPassword.equals(confirmPassword)){       //如果新密码和确定密码一致
                admin.getId();
                admin.setPassword(newPassword);
                //将新密码写入数据库
                adminService.updatePassword(admin);
                map.put("status",1);
                map.put("Message","密码修改成功！，请重新登录");
                session.removeAttribute("admin");
            }
        }
        return map;
    }

    /**
     * 管理员个人网名
     * @param admin
     * @param request
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/updateAdmin",method = RequestMethod.POST)
    public Map<String, Object> updateAdmin(Admin admin, HttpServletRequest request, HttpSession session){
        Map<String, Object> map = new HashMap<String, Object>();
        if (admin.getNickname().equals("")){
            map.put("Message","编辑失败：网名不能为空！");
        }else {     //如果验证通过
            Admin adminSession = (Admin) session.getAttribute("admin");
            admin.getNickname();
            admin.setId(adminSession.getId());
            int Update = adminService.updateAdmin(admin);
            if (Update>0){      //如果编辑成功
                adminSession.setNickname(admin.getNickname());
                adminSession.setUsername(admin.getUsername());
                map.put("status", 1);
                map.put("Message", "编辑成功");
            }
        }
        return map;
    }
}
