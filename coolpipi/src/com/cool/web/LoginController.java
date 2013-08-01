package com.cool.web;

import com.cool.common.Constants;
import com.cool.dao.AccountDAO;
import com.cool.model.LoginForm;
import org.apache.log4j.Logger;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * @author <a href="mailto:pengzhao@wisedu.com">pengzhao</a>
 */
public class LoginController extends SimpleFormController {
    Logger log = Logger.getLogger(LoginController.class);
    private AccountDAO accountDAO;

    public void setAccountDAO(AccountDAO accountDAO){
        this.accountDAO = accountDAO;
    }

    protected ModelAndView onSubmit(HttpServletRequest request,
                                    HttpServletResponse response, Object command, BindException errors)
            throws Exception {
        LoginForm loginForm = (LoginForm) command;
        if (isValid(loginForm)) {
            request.getSession().setAttribute(Constants.USERNAME_KEY, loginForm.getUsername());
            return new ModelAndView(getSuccessView());
        } else {
            Map modle = errors.getModel();
            modle.put("loginForm", loginForm);
            return new ModelAndView(getFormView(), modle);
        }
    }

    public boolean isValid(LoginForm loginForm) {
        if (loginForm.getUsername().equals("admin")
                || loginForm.getPassword().equals("admin")) {
            return true;
        } else {
            return false;
        }
    }
}
