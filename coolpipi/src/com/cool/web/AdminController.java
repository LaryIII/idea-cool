package com.cool.web;

import com.cool.dao.ProductDAO;
import net.sf.json.JSONArray;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * @author zorro
 * 后台页面控制器
 */
public class AdminController extends AbstractController {
    Logger log = Logger.getLogger(AdminController.class);
    private ProductDAO productDAO;

    public void setProductDAO(ProductDAO productDAO){
        this.productDAO = productDAO;
    }

    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        Map model = new HashMap();
        model.put("products", productDAO.getAllProduct());
        model.put("tags", JSONArray.fromObject(productDAO.getTags().values()));
        return new ModelAndView("admin/admin", model);
    }
}
