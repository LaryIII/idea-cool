<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="gb2312" %>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<script type="text/javascript">
</script>
<html>
<head>
    <title>idea cool!</title>
    <meta charset="UTF-8">
    <!--     <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <link href="assets/css/ideacool.css" rel="stylesheet" media="screen" />
</head>
<%@ include file="/WEB-INF/jsp/head.jsp" %>
<body style="background-color: white;">
<div class="content">
    <div class="layoutbox"></div>
    <div class="slide-down-box">
    </div>
    <form:form action="submit.do" method="post" enctype="multipart/form-data">
        ��Ʒ���ƣ�<form:input path="name"></form:input>
        </br>
        ��Ʒ������<form:textarea path="summary" rows="5"/>
        </br>
        �ϴ�ͼƬ1��<input path="file" name="file" type="file"/>
        </br>
        <input type="submit" value="�� ��">
    </form:form>
</div>
</body>
</html>