package com.cool.web;

import com.cool.dao.ProductDAO;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zorro
 * 首页内容的控制器
 */
public class IndexController extends AbstractController {
    Logger log = Logger.getLogger(IndexController.class);
    private ProductDAO productDAO;

    public void setProductDAO(ProductDAO productDAO){
        this.productDAO = productDAO;
    }

    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        Map model = new HashMap();
        model.put("products", productDAO.getProduct());
        return new ModelAndView("index", model);
    }
}
