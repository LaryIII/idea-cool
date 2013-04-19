package com.cool.dao;

import com.cool.model.User;

/**
 * @author Zorro
 * 帐号数据库层
 */
public interface AccountDAO {
    int addUser(User user);
}
