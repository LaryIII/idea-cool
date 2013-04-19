package com.cool.web;

import com.cool.dao.AccountDAO;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * @author <a href="mailto:pengzhao@wisedu.com">pengzhao</a>
 */
public class LoginController extends AbstractController {
    Logger log = Logger.getLogger(LoginController.class);
    private AccountDAO accountDAO;

    public void setAccountDAO(AccountDAO accountDAO){
        this.accountDAO = accountDAO;
    }

    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        Map model = new HashMap();
        return new ModelAndView("register", model);
    }
}
