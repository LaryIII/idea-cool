<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="gb2312" %>
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
        ע�����䣺<form:input path="mail"/>
        </br>
        �������룺<form:password path="password"/>
        </br>
        �ǳƣ�<form:input path="nickname"/>
        </br>
        <input type="submit" value="�� ��">
    </form:form>
</div>
</body>
</html>