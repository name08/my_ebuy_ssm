package com.lyh.my_ebuy_ssm.controller.admin.producttypemanager;

import com.lyh.my_ebuy_ssm.model.Admin;
import com.lyh.my_ebuy_ssm.model.ProductType;
import com.lyh.my_ebuy_ssm.service.ProductTypeService;
import com.lyh.my_ebuy_ssm.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("/admin/product/producttypemanage")
@Controller
public class ProductTypeManageController {
    @Resource
    private ProductTypeService productTypeService;

    /**
     * 分页查询产品类
     * @param page
     * @param request
     * @return
     */
    @RequestMapping(value = "/productTypemanage",method = RequestMethod.GET)
    public String queryProductTypePage(Page<ProductType> page, HttpServletRequest request){
        Page<ProductType> productTypes = productTypeService.queryProductTypesPage(page);
        request.setAttribute("productTypes",productTypes);
        return "/jsp/admin/product/producttypemanage/producttypemanage.jsp";
    }

    /**
     * 删除产品类别
     * @param id
     * @param request
     * @return
     */
    @RequestMapping(value = "/doDeleteProductType",method = RequestMethod.GET)
    public String doDeleteProductType(Integer id,HttpServletRequest request){
        int ProductCount = productTypeService.deleteProductType(id);
        if (ProductCount > 0){
            request.setAttribute("msg","删除产品类别失败，请先删除产品分类下的产品！");
        }else if (productTypeService.getProductType(id) == null){
            request.setAttribute("msg","删除失败，该产品类型不存在！");
        }else {
            request.setAttribute("msg","删除产品分类成功！");
        }
        return "/admin/product/producttypemanage/productTypemanage";
    }

    /**
     * 跳转到创建产品分类
     * @param request
     * @return
     */
    @RequestMapping(value = "/toAddProductType",method = RequestMethod.GET)
    public String toAddProductType(HttpServletRequest request){
        ProductType productType = new ProductType();
        productType.setPt_orderNum(100);
        productType.setPt_linkUrl("http://");
        request.setAttribute("productType",productType);
        return "/jsp/admin/product/producttypemanage/producttypemanage.jsp";
    }

    /**
     * 添加产品分类
     * @param productType
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/doAddProductType",method = RequestMethod.POST)
    public Map<String,Object> doAddProductType(ProductType productType, HttpSession session){

        Map<String, Object> map = new HashMap<String,Object>();
        Admin admin = (Admin) session.getAttribute("admin");    //获取session的adminId
        if (productType.getPt_name()==null){
            map.put("Message","添加失败：产品分类名称不能为空!");
        }else if (productType.getPt_orderNum()==null){
            map.put("Message","添加失败：产品分类优先级不能为空!");
        }else if (productTypeService.existProductType(productType)>0){
            map.put("Message","添加失败：产品分类已存在!");
        }else {
            productType.getPt_name();
            productType.getPt_linkUrl();
            productType.getPt_orderNum();
            productType.getPt_imageUrl();
            productType.getPt_intro();
            productType.setPt_createTime(Calendar.getInstance().getTime());
            productType.setPt_creatorId(admin.getId());
            productTypeService.addProductType(productType);
            map.put("Message","添加产品分类成功！");
            map.put("status",1);
        }
        return map;
    }

    /**
     * 跳转到产品分类更新页面
     * @param id
     * @param request
     * @return
     */
    @RequestMapping(value = "/toUpdateProductType",method = RequestMethod.GET)
    public String toUpdateProductType(Integer id, HttpServletRequest request){
        ProductType productType = productTypeService.getProductType(id);
        request.setAttribute("productType",productType);
        return "/jsp/admin/product/producttypemanage/producttypeupdate.jsp";
    }

    /**
     * 编辑产品分类
     * @param productType
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/doUpdateProductType")
    public Map<String,Object> doUpdateProductType(ProductType productType,HttpSession session){

        Map<String,Object> map = new HashMap<String, Object>();
        Admin admin = (Admin) session.getAttribute("'admin");
        if (productType.getPt_name()==null){
            map.put("Message","编辑失败：产品分类名称不能为空！");
        }else if (productTypeService.existProductType(productType)>0){
            map.put("Message","编辑失败：产品分类名称已经存在！");
        }else {
            productType.getPt_name();
            productType.getPt_intro();
            productType.getPt_linkUrl();
            productType.getPt_imageUrl();
            productType.getPt_orderNum();
            productType.setPt_updateTime(Calendar.getInstance().getTime());
            productType.setPt_finalEditorId(admin.getId());
            productTypeService.updateProductType(productType);
            map.put("Message","编辑产品分类成功！");
            map.put("status",1);
        }
        return map;
    }

    /**
     * 根据输入的产品分类名称或者创建管理员查询产品分类
     * @param request
     * @param page
     * @return
     */
    @RequestMapping(value = "/productTypeSearchResult",method = RequestMethod.GET)
    public String productTypeSearchResult(HttpServletRequest request,Page<ProductType> page){
        try {
            String keyWord = new String(request.getParameter("keyWord").getBytes("iso8859-1"),"utf-8"); //转换编码
            if (keyWord.equals("")){
                request.setAttribute("msg","请输入搜索产品名称！");
                return "/jsp/admin/product/producttypemanage/productTypemanage";
            }else {
                page.setKeyWord(keyWord);
            }
            Page<ProductType> productTypes = productTypeService.LikeProductType(page);
            request.setAttribute("productTypes",productTypes);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "/jsp/admin/product/producttypemanage/producttypeSearchResult.jsp";
    }
}
