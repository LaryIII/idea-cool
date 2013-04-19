package com.cool.dao.impl;

import com.cool.common.EncryptUtils;
import com.cool.dao.AccountDAO;
import com.cool.model.User;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import java.util.Date;

/**
 * @author Zorro
 * 帐号数据库层实现类
 */
public class AccountDAOImpl extends JdbcDaoSupport implements AccountDAO {
    private static final String INSERT_USER = "insert into c_account(mail,password,nickname,date,lastip,token) values(?,?,?,?,?,?)";

    public int addUser(User user) {
        String password = EncryptUtils.MD5(user.getPassword());     //密码进行MD5加密
        return getJdbcTemplate().update(INSERT_USER, new Object[]{user.getMail(), password, user.getNickname(), new Date(),
                user.getLastIp(), user.getToken()});
    }
}
