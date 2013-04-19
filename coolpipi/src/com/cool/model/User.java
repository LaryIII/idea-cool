package com.cool.model;

/**
 * @author <a href="mailto:pengzhao@wisedu.com">pengzhao</a>
 */
public class User {
    String mail;        //邮箱，也作为uid
    String password;    //密码
    String nickname;    //昵称
    String lastIp;      //上次访问IP地址
    String token;       //uuid，用于邮箱激活认证

    public String getMail() {
        return mail;
    }

    public String getPassword() {
        return password;
    }

    public String getNickname() {
        return nickname;
    }

    public String getLastIp() {
        return lastIp;
    }

    public String getToken() {
        return token;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public void setLastIp(String lastIp) {
        this.lastIp = lastIp;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
