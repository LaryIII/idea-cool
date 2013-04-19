<%@ page contentType="text/html;charset=UTF-8" pageEncoding="gb2312" %>
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
    <div class="login">
        <button id="loginbtn" class="btn dropdown-toggle" data-toggle="modal" data-target="#myModal"><i class="icon-user"></i> ��¼</button>
    </div>
</div>
<div id="mask"></div>
<div class="modal hide fade" id="myModal">
    <form action="login.do" method="post">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h3>��¼</h3>
        </div>
        <div class="modal-body">
            �û�����<input type="text" name="username" size="10"></br>
            �ܡ��룺<input type="password" name="password" size="10">
        </div>
        <div class="modal-footer">
            <a type="submit" class="btn">��¼</a>
            <a onclick="window.location.href='register.do'" class="btn btn-primary">ע�����û�</a>
        </div>
    </form>
</div>
<script src="assets/sea-modules/seajs/2.0.0/sea.js" data-config="home-page/index-config" data-main="home-page/index"></script>
