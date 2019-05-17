package com.lyh.my_ebuy_ssm.controller.admin.adminmanager;

import com.lyh.my_ebuy_ssm.model.Admin;
import com.lyh.my_ebuy_ssm.service.AdminService;
import com.lyh.my_ebuy_ssm.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin/adminmanage")
public class AdminManageController {

    @Resource
    private AdminService adminService;

    /**
     * 跳转到管理员添加页面
     * @param request
     * @return
     */
    @RequestMapping(value = "/toAddAdmin",method = RequestMethod.GET)
    public String toAddAdmin(HttpServletRequest request){
        return "/jsp/admin/adminmanage/adminadd.jsp";
    }

    /**
     * 添加管理员账户
     * @param admin
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/doAddAdmin",method = RequestMethod.POST)
    public Map<String,Object> doAddAdmin(Admin admin){
        Map<String,Object> map = new HashMap<String,Object>();

        //开始执行添加
        if (admin.getUsername().equals("")){    //如果没有输入账户名
            map.put("Message","添加失败：账户名不能为空");
        }else if (admin.getNickname().equals("")){
            map.put("Message","添加失败：网名不能为空");
        }else if (adminService.existAdmin(admin) > 0 ){
            map.put("Message","添加失败：账户名存在同名");
        }else {
            String passWord = "123456";
            admin.getUsername();
            admin.getNickname();
            admin.setCreateTime(Calendar.getInstance().getTime());
            admin.setPassword(passWord);
            adminService.addAdmin(admin);
            map.put("Message","添加账户成功");
            map.put("status",1);
        }
        return map;
    }

    //管理员列表
    @RequestMapping(value = "/toManageAdmin",method = RequestMethod.GET)
    public String toManageAdmin(HttpServletRequest request, Page<Admin> page){
        Page<Admin> Admins=adminService.listAdmin(page);
        request.setAttribute("Admins",Admins);
        return "jsp/admin/adminmanage/adminmanage.jsp";
    }

    /**
     * 跳转到管理员编辑页面
     * @param request
     * @param session
     * @param id
     * @return
     */
    @RequestMapping(value = "/toUpdateAdmin",method = RequestMethod.GET)
    public String toUpdateAdmin(HttpServletRequest request, HttpSession session, Integer id){
        Admin adminSession = (Admin) session.getAttribute("admin");
        if (id != adminSession.getId().intValue()){  //如果操作管理员不是当前管理员
            //
            Admin admin = adminService.selectAdmin(id);
            request.setAttribute("admin", admin);
            return "/jsp/admin/adminmanage/adminupdate.jsp";
        }else {
            request.setAttribute("msg", "编辑失败：不能编辑当前账户");
            return "/admin/adminmanage/toManageAdmin";
        }
    }

    /**
     * 修改管理账户信息
     * 编辑时间
     * @param admin
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/doUpdateAdmin",method = RequestMethod.POST)
    public Map<String, Object> toUpdateAdmin(Admin admin){
        Map<String,Object> map = new HashMap<String,Object>();

        //把jsp页面的数据传入数据库进行更新- -更新数据表内的指定账户信息
        if (admin.getNickname().equals("")){    //如果没有输入账户名
            map.put("Message","编辑失败：账户名不能为空");
        }else if (adminService.selectAdmin(admin.getId()) == null){
            map.put("Message","编辑失败：该账户不存在");
        }else {     //如果验证通过
            admin.getId();
            admin.getNickname();
            admin.setUpdateTime(Calendar.getInstance().getTime());
            int updateAdmin = adminService.updateAdmin(admin);
            if (updateAdmin>0){
                map.put("Message","账户编辑成功");
                map.put("status",1);
            }
        }
        return map;
    }

    /**
     * 管理员删除
     * @param request
     * @param session
     * @param id
     * @return
     */
    @RequestMapping(value = "/doDeleteAdmin",method = RequestMethod.GET)
    public String doDeleteAdmin(HttpServletRequest request, HttpSession session, Integer id){
        Admin adminSession = (Admin) session.getAttribute("admin");
        Admin admin = adminService.selectAdmin(id);
        if (admin == null){
            request.setAttribute("msg","删除失败：该用户不存在");
        }else if (id != adminSession.getId().intValue()){   //如果删除的不是当前用户
            adminService.deleteAdmin(id);
            request.setAttribute("msg","删除成功");
        }else {
            request.setAttribute("msg","删除失败：不能删除自己的账户");
        }
        return "/admin/adminmanage/toManageAdmin";
    }

    /**
     * 重置管理员密码，默认重置密码为：123456
     * @param request
     * @param admin
     * @param resetPassword
     * @param session
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/doResetPassword",method = RequestMethod.GET)
    public Map<String, Object> updateResetPassword(HttpServletRequest request, Admin admin, String resetPassword, HttpSession session, Integer id){

        Map<String, Object> map = new HashMap<String, Object>();
        Admin adminSession = (Admin) session.getAttribute("admin");

        if (admin.getId()!=adminSession.getId().intValue()){    //如果不是当前账户
            map.put("Message","重置密码失败：不能重置当前账户");
        }else {
            resetPassword = "123456";
            admin.setPassword(resetPassword);
            admin.getId();
            adminService.updateAdmin(admin);
            map.put("Message","重置密码成功,默认密码为：123456");
            map.put("status",1);
        }
        return map;
    }
}
