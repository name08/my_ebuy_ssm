package com.lyh.my_ebuy_ssm.controller.admin.ordersmanager;

import com.lyh.my_ebuy_ssm.model.Orders;
import com.lyh.my_ebuy_ssm.service.OrdersService;
import com.lyh.my_ebuy_ssm.service.ProductService;
import com.lyh.my_ebuy_ssm.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@RequestMapping(value = "/admin/orders/ordersManage")
@Controller
public class OrdersManageController {
    @Resource
    private OrdersService ordersService;
    @Resource
    private ProductService productService;

    /**
     * 显示订单
     * @param page
     * @param request
     * @return
     */
    @RequestMapping(value = "/queryOrdersPage",method = RequestMethod.GET)
    public String queryOrdersPage(Page<Orders> page, HttpServletRequest request){
        Page<Orders> orders= ordersService.queryOrdersPage(page);
        request.setAttribute("orders",orders);
        return "/jsp/admin/orders/ordersmanage.jsp";
    }

    /**
     * 根据订单号搜索相关订单
     * @param request
     * @param page
     * @return
     */
    @RequestMapping(value = "/LikeOrders", method = RequestMethod.GET)
    public String LikeOrders(HttpServletRequest request,Page<Orders> page){
        String keyWord = request.getParameter("keyWord");
        if (keyWord.equals("")){
            request.setAttribute("Message","请输入订单号！");
            return "/admin/orders/ordersManage/queryOrdersPage";
        }else {
            page.setKeyWord(keyWord);
            Page<Orders> orders = ordersService.LikeOrders(page);
            request.setAttribute("orders",orders);
        }
        return "/jsp/admin/orders/ordersSearchResult.jsp";
    }

}
