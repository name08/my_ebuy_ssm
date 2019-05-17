package com.lyh.my_ebuy_ssm.service.impl;

import com.lyh.my_ebuy_ssm.dao.AdminDao;
import com.lyh.my_ebuy_ssm.model.Admin;
import com.lyh.my_ebuy_ssm.service.AdminService;
import com.lyh.my_ebuy_ssm.util.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminDao adminDao;
    /*
    * @author blank
    * @Description 登陆
    * @Date 23:15 2018/5/31
    * @Param [username, password]
    * @return com.lcvc.ebuy_shop.model.Admin
    **/
    public Admin login(String username , String password){
        return this.adminDao.login(username,password);
    }
    /*
    * @author blank
    * @Description 根据id查询用户
    * @Date 23:15 2018/5/31
    * @Param [id]
    * @return com.lcvc.ebuy_shop.model.Admin
    **/
    public Admin selectAdmin(Integer id){
        return this.adminDao.selectAdmin(id);
    }
    /*
    * @author blank
    * @Description 添加用户
    * @Date 23:15 2018/5/31
    * @Param [admin]
    * @return int
    **/
    public int addAdmin(Admin admin){
        return this.adminDao.addAdmin(admin);
    }
    /*
    * @author blank
    * @Description 更新用户
    * @Date 23:15 2018/5/31
    * @Param [admin]
    * @return int
    **/
    public int updateAdmin(Admin admin){
        return this.adminDao.updateAdmin(admin);
    }
    /*
    * @author blank
    * @Description 根据id删除用户
    * @Date 23:16 2018/5/31
    * @Param [id]
    * @return int
    **/
    public int deleteAdmin(Integer id){
        return this.adminDao.deleteAdmin(id);
    }
    /*
    * @author blank
    * @Description 判断是否存在用户
    * @Date 23:16 2018/5/31
    * @Param [admin]
    * @return int
    **/
    public int existAdmin(Admin admin){
        return this.adminDao.existAdmin(admin);
    }
    /*
    * @author blank
    * @Description 更新用户密码
    * @Date 23:16 2018/5/31
    * @Param [admin]
    * @return int
    **/
    public int updatePassword(Admin admin){
        return this.adminDao.updatePassword(admin);
    }
    /*
    * @author blank
    * @Description 分页查询用户列表
    * @Date 23:16 2018/5/31
    * @Param [page]
    * @return com.lcvc.ebuy_shop.util.Page<com.lcvc.ebuy_shop.model.Admin>
    **/
    public Page<Admin> listAdmin(Page<Admin> page){
        List<Admin> list = adminDao.listAdmin(page); //存放在list
        int AdminCount = adminDao.AdminCount(); //计算总记录数
        page.setTotalDataCount(AdminCount); //page类添加总记录数
        page.setList(list); //把查询到的所有记录放入page类
        return page;
    }

}
