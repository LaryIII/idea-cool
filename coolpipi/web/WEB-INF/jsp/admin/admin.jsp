<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<script type="text/javascript">
</script>
<html>
<body style="background-color: white;">
<%@ include file="/WEB-INF/jsp/head.jsp" %>
<div class="content">
    <div class="layoutbox"></div>
    <div class="slide-down-box"></div>
    <input type="button" onclick="window.location.href='edit.do'" value="新 增"/>
    <table style="width:100%">
        <tr>
            <th style="width: 5%">产品id</th>
            <th style="width: 20%">产品名称</th>
            <th style="width: 50%">产品描述</th>
            <th style="width: 12%">产品标签</th>
            <th style="width: 7%">图片路径</th>
            <th style="width: 3%">编编</th>
            <th style="width: 3%">删除</th>
        </tr>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product['uid']}</td>
                <td>${product['name']}</td>
                <td>${product['summary']}</td>
                <td></td>
                <td>${product['defaultPic']}</td>
                <td style="vertical-align: middle;padding-left: 0;text-align: center">
                    <a href="edit.do?uid=${product['uid']}">
                        <img src="${pageContext.request.contextPath}/images/edit_icon.gif" alt="编辑"/>
                    </a>
                </td>
                <td style="vertical-align: middle;padding-left: 0;text-align: center">
                    <a class="delLink" href="#" uid="${product['uid']}">
                        <img src="${pageContext.request.contextPath}/images/delete.gif" alt="删除"/>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>