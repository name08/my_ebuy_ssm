package com.lyh.my_ebuy_ssm.dao;

import com.lyh.my_ebuy_ssm.model.Admin;
import com.lyh.my_ebuy_ssm.util.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminDao {
    //用户登陆
    Admin login(@Param(value = "username") String username, @Param(value = "password") String password);
    //查询用户
    Admin selectAdmin(Integer id);
    //添加用户
    int addAdmin(Admin admin);
    //更新用户名,网名
    int updateAdmin(Admin admin);
    //删除用户
    int deleteAdmin(Integer id);
    //判断用户是否存在
    int existAdmin(Admin admin);
    //updatePassword
    int updatePassword(Admin admin);
    //所有用户
    List<Admin> listAdmin(Page<Admin> page);
    //所有用户数量
    int AdminCount();
}
