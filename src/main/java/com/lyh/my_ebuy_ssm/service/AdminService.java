package com.lyh.my_ebuy_ssm.service;

import com.lyh.my_ebuy_ssm.model.Admin;
import com.lyh.my_ebuy_ssm.util.Page;


public interface AdminService {

    //用户登陆方法
    public Admin login(String username, String password);
    //查询用户方法
    public Admin selectAdmin(Integer id);
    //添加用户方法
    public int addAdmin(Admin admin);
    //更新用户网名方法
    public int updateAdmin(Admin admin);
    //删除用户方法
    public int deleteAdmin(Integer id);
    //更新用户密码方法
    public int updatePassword(Admin admin);
    //查询是否存在用户方法
    public int existAdmin(Admin admin);
    //查询用户列表方法
    public Page<Admin> listAdmin(Page<Admin> page);

}
