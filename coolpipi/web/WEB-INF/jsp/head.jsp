<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <title>idea cool!</title>
    <meta charset="UTF-8">
    <!--     <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <link href="assets/css/ideacool.css" rel="stylesheet" media="screen" />
</head>

<div class="header">
    <div class="logo-box"><a href="#" class="logo"></a></div>
    <div class="home-btn"><button id="homeBtn" class="btn btn-large" type="button">Home</button></div>
    <%if(null == session.getAttribute("username")){%>
    <div class="login">
        <button id="loginbtn" class="btn dropdown-toggle" data-toggle="modal" data-target="#myModal"><i class="icon-user"></i> 登录</button>
    </div>
    <%}else {%>
    <div class="login">
        <div class="dropdown-toggle" data-toggle="modal" data-target="#myModal"><i class="icon-user"></i> 欢迎您：<%=session.getAttribute("username")%></div>
    </div>
    <%}%>
</div>
<div id="mask"></div>
<div class="modal hide fade" id="myModal">
    <form action="login.do" method="post">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h3>登录</h3>
        </div>
        <div class="modal-body">
            用户名：<input type="text" name="username" size="10"></br>
            密　码：<input type="password" name="password" size="10">
        </div>
        <div class="modal-footer">
            <button type="submit" class="btn">登录</button>
            <a onclick="window.location.href='register.do'" class="btn btn-primary">注册新用户</a>
        </div>
    </form>
</div>
<script src="assets/sea-modules/seajs/2.0.0/sea.js" data-config="home-page/index-config" data-main="home-page/index"></script>
