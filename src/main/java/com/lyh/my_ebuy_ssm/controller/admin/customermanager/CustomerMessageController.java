package com.lyh.my_ebuy_ssm.controller.admin.customermanager;

import com.lyh.my_ebuy_ssm.model.Customer;
import com.lyh.my_ebuy_ssm.service.CustomerService;
import com.lyh.my_ebuy_ssm.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

@RequestMapping(value = "/admin/CustomerManage")
@Controller
public class CustomerMessageController {

    @Resource
    private CustomerService customerService;

    /**
     * 普通用户列表
     * @param request
     * @param page
     * @return  String
     */
    @RequestMapping(value = "/queryCustomersPage",method = RequestMethod.GET)
    public String queryCustomerPage(HttpServletRequest request, Page<Customer> page){
        Page<Customer> customers = customerService.queryCustomersPage(page);
        request.setAttribute("customers",customers);
        return "/jsp/admin/customer/customermanage.jsp";
    }

    /**
     * 跳转到添加用户页面
     * @return  String
     */
    @RequestMapping(value = "/toAddCustomer")
    public String toAddCustomer(){
        return "/jsp/admin/customer/customeradd.jsp";
    }

    /**
     * 添加普通用户
     * @param customer
     * @return map
     */
    @ResponseBody
    @RequestMapping(value = "/doAddCustomer" ,method = RequestMethod.POST)
    public Map<String,Object> doAddCustomer(Customer customer){
        Map<String,Object> map = new HashMap<String ,Object>();
        if (customer.getC_username() == null || customer.getC_username() == ""){
            map.put("Message","用户名不能为空");
        }else if (customer.getC_nickName()==null || customer.getC_nickName()==""){
            map.put("Message","昵称不能为空");
        }else if (customer.getC_sex()==null){
            map.put("Message","性别不能为空");
        }else if (customer.getC_telephone()==null || customer.getC_telephone()==""){
            map.put("Message","电话号码不能为空");
        }else if (customer.getC_address()==null || customer.getC_address()==""){
            map.put("Message","地址不能为空");
        }else if (customer.getC_email()==null || customer.getC_email()==""){
            map.put("Message","电子邮件不能为空");
        } else if (customer.getC_zipCode() == null || customer.getC_zipCode() == "") {
            map.put("Message","邮编不能为空");
        }else {
            customer.getC_intro();
            customer.setC_password("123456");   //默认密码
            customer.setC_createTime(Calendar.getInstance().getTime()); //获取当前时间到C_createTime
            customerService.addCustomer(customer);  //保存到数据库
            map.put("Message","添加成功:用户添加成功！");
            map.put("status","1");
        }
        return map;
    }

    /**
     * 跳转到用户更新页面
     * @return String
     */
    @RequestMapping(value = "/toUpdateCustomer",method = RequestMethod.GET)
    public String toUpdateCustomer(HttpServletRequest request, Integer id){
        Customer customer = customerService.queryCustomer(id);
        request.setAttribute("customer",customer);
        return "/jsp/admin/customer/customerupdate.jsp";
    }

    /**
     * 编辑普通用户
     * @param customer
     * @return map
     */
    @ResponseBody
    @RequestMapping(value = "/doUpdateCustomer",method = RequestMethod.POST)
    public Map<String,Object> doUpdateCustomer(Customer customer){
        Map<String, Object> map = new HashMap<String, Object>();
        if (customer.getC_username() == null || customer.getC_username() == ""){
            map.put("Message","用户名不能为空");
        }else if (customer.getC_nickName()==null || customer.getC_nickName()==""){
            map.put("Message","昵称不能为空");
        }else if (customer.getC_sex()==null){
            map.put("Message","性别不能为空");
        }else if (customer.getC_telephone()==null || customer.getC_telephone()==""){
            map.put("Message","电话号码不能为空");
        }else if (customer.getC_address()==null || customer.getC_address()==""){
            map.put("Message","地址不能为空");
        }else if (customer.getC_email()==null || customer.getC_email()==""){
            map.put("Message","电子邮件不能为空");
        } else if (customer.getC_zipCode() == null || customer.getC_zipCode() == "") {
            map.put("Message", "邮编不能为空");
        }else {
            customer.getC_intro();
            customerService.updateCustomer(customer);
            map.put("Message","编辑成功！");
            map.put("status","1");
        }
        return map;
    }

    /**
     * 根据用户id删除用户
     * @param id
     * @param request
     * @return String
     */
    @RequestMapping(value = "/doDeleteCustomer", method = RequestMethod.GET)
    public String doDeleteCustomer(Integer id, HttpServletRequest request){
        Customer customer = customerService.queryCustomer(id);
        int customerOrderNumber = customerService.getOrderNumber(id);
        if (customer==null){
            request.setAttribute("msg","删除失败：当前用户不存在！");
        }else if (customerOrderNumber>0){
            request.setAttribute("msg","删除失败：当前用户订单不为空，请先删除当前用户订单");
        }else {
            customerService.deleteCustomer(id);
            request.setAttribute("msg","删除成功:顾客删除成功!");
        }
        return "/admin/CustomerManage/queryCustomersPage";
    }

    /**
     * 用户重置密码
     * @param defaultPassword
     * @param customer
     * @param id
     * @return  map
     */
    @ResponseBody
    @RequestMapping(value = "/doResetCustomerPassword",method = RequestMethod.GET)
    public Map<String, Object> doResetCustomerPassword(String defaultPassword, Customer customer, Integer id){
        Map<String,Object> map = new HashMap<String, Object>();
        if (customerService.queryCustomer(id) == null){
            map.put("Message","密码重置失败：用户不存在");
        }else {
            defaultPassword = "123456";
            customer.setC_password(defaultPassword);
            customer.getId();
            customerService.updateCustomer(customer);
            map.put("Message","重置密码成功：默认密码为123456");
            map.put("status","1");
        }
        return map;
    }

    /**
     * 根据用户信息搜索
     * @param request
     * @param page
     * @return String
     */
    @RequestMapping(value = "/productSearchResult",method = RequestMethod.GET)
    public String productSearchResult(HttpServletRequest request, Page<Customer> page){
        try {
            String strC_sex = request.getParameter("c_sex");
            Integer c_sex = Integer.parseInt(strC_sex);
            String keyWord = new String(request.getParameter("keyWord").getBytes("iso8859-1"),"utf-8"); //转换编码
            if (c_sex == -1 && keyWord.equals("")){
                request.setAttribute("msg","请选择性别或输入搜索用户账号！");
                return "/admin/CustomerManage/queryCustomerPage";
            }else if (c_sex != -1 && keyWord.equals("")){
                page.setC_sex(c_sex);
            }else if (keyWord != null && keyWord != "" && c_sex == -1){
                page.setKeyWord(keyWord);
            }else {
                page.setKeyWord(keyWord);
                page.setC_sex(c_sex);
            }
            Page<Customer> customers = customerService.LikeCustomer(page);
            request.setAttribute("customers",customers);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/jsp/admin/customer/customerSearchResult.jsp";
    }
}
