package com.cool.web;

import com.cool.dao.AccountDAO;
import com.cool.model.User;
import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;

/**
 * @author zorro
 * 注册页面控制器
 */
public class RegisterController extends SimpleFormController {
    Logger log = Logger.getLogger(RegisterController.class);
    private AccountDAO accountDAO;

    public void setAccountDAO(AccountDAO accountDAO){
        this.accountDAO = accountDAO;
    }

    public RegisterController(){
        this.setCommandClass(User.class);
    }

    protected Object formBackingObject(HttpServletRequest request) throws Exception {
        return new User();
    }

    protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response,
            Object command, BindException errors) throws Exception {
        User user = (User) command;
        user.setLastIp(request.getRemoteAddr());
        user.setToken(UUID.randomUUID().toString());
        accountDAO.addUser(user);
        return new ModelAndView("index", null);
    }
}
