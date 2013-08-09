package com.cool.web;

import com.cool.dao.ProductDAO;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author <a href="mailto:pengzhao@wisedu.com">pengzhao</a>
 */
public class EditTagController extends AbstractController {
    Logger log = Logger.getLogger(EditTagController.class);
    private ProductDAO productDAO;

    public void setProductDAO(ProductDAO productDAO){
        this.productDAO = productDAO;
    }

    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        httpServletRequest.setCharacterEncoding("utf-8");
        String[] tags = httpServletRequest.getParameterValues("tags");
        int uid = Integer.parseInt(httpServletRequest.getParameter("uid"));
        productDAO.editTag(uid, tags);
        httpServletResponse.sendRedirect("admin.do");
        return null;
    }
}
