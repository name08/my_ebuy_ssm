package com.lyh.my_ebuy_ssm.controller.filter;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginForShopInterceptor extends HandlerInterceptorAdapter {
    /*
     * 在执行Controller的请求以前将会调用的方法
     * 如果返回true则通过拦截器验证继续执行请求的Controller，如果返回false则不再执行Controller
     */
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        boolean status=false;//默认验证不通过
        HttpSession session=request.getSession();
        if(session.getAttribute("customer")!=null){//如果登录
            status=true;
        }else{//如果没有登录
            //跳转到登录页面
            String path = request.getContextPath();
            String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
            response.sendRedirect(basePath+"jsp/shop/login.jsp");
        }
        return status;
    }
}
