<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<script type="text/javascript">
</script>
<html>
<body style="background-color: white;">
<%@ include file="/WEB-INF/jsp/head.jsp" %>
<div class="content">
    <div class="layoutbox"></div>
    <div class="slide-down-box">
    </div>
    <form:form action="register.do" method="post">
        注册邮箱：<form:input path="mail"/>
        </br>
        创建密码：<form:password path="password"/>
        </br>
        昵称：<form:input path="nickname"/>
        </br>
        <input type="submit" value="提 交">
    </form:form>
</div>
</body>
</html>