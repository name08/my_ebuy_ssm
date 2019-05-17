package com.lyh.my_ebuy_ssm.controller.admin.productmanager;

import com.lyh.my_ebuy_ssm.model.Admin;
import com.lyh.my_ebuy_ssm.model.Product;
import com.lyh.my_ebuy_ssm.model.ProductType;
import com.lyh.my_ebuy_ssm.service.ProductService;
import com.lyh.my_ebuy_ssm.service.ProductTypeService;
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
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin/product/productmanage")
public class ProductManageController {

    @Resource
    private ProductService productService;
    @Resource
    private ProductTypeService productTypeService;

    /*
     * @author blank
     * @Description 分页查询产品
     * @Date 23:12 2018/5/31
     * @Param [page, product, request]
     * @return java.lang.String
     **/
    @RequestMapping(value = "/productManage", method = RequestMethod.GET)
    public String productManage(Page<Product> page, Product product, HttpServletRequest request) {
        Page<Product> products = productService.queryProductsPage(page);
        List<ProductType> productTypes = productTypeService.queryProductType();
        request.setAttribute("productTypes", productTypes);
        request.setAttribute("products", products);
        return "/jsp/admin/product/productmanage/productmanage.jsp";
    }

    /*
     * @author blank
     * @Description 跳转产品添加页面
     * @Date 23:12 2018/5/31
     * @Param
     * @return
     **/
    @RequestMapping(value = "/toAddProduct",method = RequestMethod.GET)
    public String toAddProduct(HttpServletRequest request) {
        Product product = new Product();
        List<ProductType> productTypes = productTypeService.queryProductType();
        product.setP_orderNum(100);
        product.setP_onSale(0);
        product.setP_click(0);
        product.setP_number(0);
        request.setAttribute("productTypes", productTypes);
        request.setAttribute("product", product);
        return "/jsp/admin/product/productmanage/productadd.jsp";
    }

    /*
     * @author blank
     * @Description 跳转更新产品页面
     * @Date 23:13 2018/5/31
     * @Param [request, id]
     * @return java.lang.String
     **/
    @RequestMapping(value = "/toUpdateProduct", method = RequestMethod.GET)
    public String toUpdateProduct(HttpServletRequest request, Integer id) {
        if (id != null) {
            Product product = productService.getProduct(id);
            List<ProductType> productTypes = productTypeService.queryProductType();
            request.setAttribute("productTypes", productTypes);
            request.setAttribute("product", product);
        }

        return "/jsp/admin/product/productmanage/productupdate.jsp";
    }

    /*
     * @author blank
     * @Description 编辑产品信息
     * @Date 23:13 2018/5/31
     * @Param [request, product, session, redirectAttributes]
     * @return java.lang.String
     **/
    @ResponseBody
    @RequestMapping(value = "/doUpdateProduct", method = RequestMethod.POST)
    public Map<String, Object> doUpdateProduct( Product product, HttpSession session) {
        Admin adminSession = (Admin) session.getAttribute("admin");
        Map<String, Object> map = new HashMap<String, Object>();
        if(product.getProductTypeId()==0&&product.getProductTypeId()==null){
            map.put("Message","必须选择产品分类");
            if(product.getProductTypeId()!=0&&product.getProductTypeId()!=null){
                ProductType productType = productTypeService.getProductType(product.getProductTypeId());
                if(productType==null){
                    map.put("Message","产品分类不存在");
                }
            }
        }else if (product.getP_name().length()==0){
            map.put("Message","产品名称不能为空");
        }else if(productService.existProduct(product)>0){
            map.put("Message","产品已存在,请重新编辑");
        }else if (product.getP_picUrl().length()==0){
            map.put("Message","产品图片不能为空");
        }else if (product.getP_originalPrice()==null){
            map.put("Message","产品原价不能为空");
        } else if (product.getP_price()==null){
            map.put("Message","产品现价不能为空");
        }else if (product.getP_number()==null){
            map.put("Message","产品数量不能为空");
        }else if (product.getP_orderNum()==null){
            map.put("Message","产品优先级不能为空");
        }else if (product.getP_description().length()==0){
            map.put("Message","产品介绍不能为空");
        }else if (product.getP_content().length()==0){
            map.put("Message","产品内容不能为空");
        }else{
            product.setP_updateTime(Calendar.getInstance().getTime());
            product.setP_finalEditorId(adminSession.getId());
            int Update = productService.updateProduct(product);
            if(Update>0){
                map.put("status", 1);
                map.put("Message","产品编辑成功");
            }
        }
        return map;
    }

    /*
     * @author blank
     * @Description 添加产品
     * @Date 23:03 2018/5/31
     * @Param [request, product, session]
     * @return java.lang.String
     **/
    @ResponseBody
    @RequestMapping(value = "/doAddProduct", method = RequestMethod.POST)
    public Map<String, Object> doAddProduct(Product product, HttpSession session) {
        Admin adminSession = (Admin) session.getAttribute("admin");
        Map<String, Object> map = new HashMap<String, Object>();
        if(product.getProductTypeId()==0&&product.getProductTypeId()==null){
            map.put("Message","必须选择产品分类");
            if(product.getProductTypeId()!=0&&product.getProductTypeId()!=null){
                ProductType productType = productTypeService.getProductType(product.getProductTypeId());
                if(productType==null){
                    map.put("Message","产品分类不存在");
                }
            }
        }else if (product.getP_name().length()==0){
            map.put("Message","产品名称不能为空");
        }else if(productService.existProduct(product)>0){
            map.put("Message","产品已存在,请重新编辑");
        }else if (product.getP_picUrl().length()==0){
            map.put("Message","产品图片不能为空");
        }else if (product.getP_originalPrice()==null){
            map.put("Message","产品原价不能为空");
        } else if (product.getP_price()==null){
            map.put("Message","产品现价不能为空");
        }else if (product.getP_number()==null){
            map.put("Message","产品数量不能为空");
        }else if (product.getP_orderNum()==null){
            map.put("Message","产品优先级不能为空");
        }else if (product.getP_description().length()==0){
            map.put("Message","产品介绍不能为空");
        }else if (product.getP_content().length()==0){
            map.put("Message","产品内容不能为空");
        }else{
            product.setP_creatorId(adminSession.getId());
            product.setP_createTime(Calendar.getInstance().getTime());
            productService.addProduct(product);
            map.put("status", 1);
            map.put("Message","产品添加成功");
        }
        return map;
    }


    /*
     * @author blank
     * @Description 模糊查询商品并分页
     * @Date 22:59 2018/5/31
     * @Param [request, page]
     * @return java.lang.String
     **/
    @RequestMapping(value = "/productSearchResult", method = RequestMethod.GET)
    public String productSearchResult(HttpServletRequest request, Page<Product> page) {
        try {
            String strProductTypeId = request.getParameter("productTypeId");
            Integer ProductTypeId = Integer.parseInt(strProductTypeId);
            String keyWord = new String(request.getParameter("keyWord").getBytes("iso8859-1"), "utf-8");//转换编码
            ProductType productType = new ProductType();
            if (ProductTypeId == 0 && keyWord.equals("")) {
                request.setAttribute("msg", "请选择产品分类或输入搜索产品名称!");
                return "/admin/product/productmanage/productManage";
            } else if (ProductTypeId != 0 && keyWord.equals("")) {
                page.setProductTypeId(ProductTypeId);
                productType = productTypeService.getProductType(page.getProductTypeId());
            } else if (keyWord != null && keyWord != "" && ProductTypeId == 0) {
                page.setKeyWord(keyWord);
            } else {
                page.setProductTypeId(ProductTypeId);
                productType = productTypeService.getProductType(page.getProductTypeId());
                page.setKeyWord(keyWord);
            }

            List<ProductType> productTypes = productTypeService.queryProductType();
            Page<Product> products = productService.LikeProduct(page);
            request.setAttribute("productType", productType);
            request.setAttribute("productTypes", productTypes);
            request.setAttribute("products", products);
        } catch (Exception e) {

            e.printStackTrace();
        }

        return "/jsp/admin/product/productmanage/productSearchResult.jsp";
    }

    /*
     * @author blank
     * @Description 根据id删除产品
     * @Date 0:11 2018/6/1
     * @Param [request, id]
     * @return java.lang.String
     **/
    @RequestMapping(value = "/doDeleteProduct", method = RequestMethod.GET)
    public String doDeleteProduct(HttpServletRequest request, Integer id) {
        Product product = productService.getProduct(id);
        if(product==null){
           request.setAttribute("Message","该产品不存在");
        }else {
            productService.deleteProduct(id);
            request.setAttribute("Message", "产品删除成功!");
        }

        return "/admin/product/productmanage/productManage";
    }


}
