package com.cool.web;

import com.cool.dao.ProductDAO;
import com.cool.model.Product;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.mvc.SimpleFormController;
import javax.servlet.http.HttpServletRequest;

/**
 * @author Zorro
 * 后台编译页面控制器
 */
public class EditController extends SimpleFormController {
    Logger log = Logger.getLogger(EditController.class);
    private ProductDAO productDAO;

    public void setProductDAO(ProductDAO productDAO){
        this.productDAO = productDAO;
    }

    public EditController(){
        this.setCommandClass(Product.class);
    }

    protected Object formBackingObject(HttpServletRequest request) throws Exception {
        String uid = request.getParameter("uid");
        if(uid == null || uid.equals("")){
            Product product = new Product();
            return product;
        }else {
            Product product = productDAO.getProductByUid(Integer.parseInt(uid));
            return product;
        }
    }
}
