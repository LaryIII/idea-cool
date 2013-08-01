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
    <table class="table table-striped table-bordered table-condensed table-hover">
        <thead>
            <tr>
                <th style="width: 5%">产品id</th>
                <th style="width: 10%">产品名称</th>
                <th style="width: 40%">产品标签</th>
                <th style="width: 25%">图片路径</th>
                <th style="width: 5%">编编</th>
                <th style="width: 5%">删除</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td>${product['uid']}</td>
                    <td>${product['name']}</td>
                    <td>
                        <button class="btn btn-mini btn-primary" type="button">编辑</button>
                    </td>
                    <td>${product['defaultPic']}</td>
                    <td style="vertical-align: middle;padding-left: 0;text-align: center">
                        <a href="edit.do?uid=${product['uid']}">
                            <i class="icon-tag" alt="编辑"></i>
                        </a>
                    </td>
                    <td style="vertical-align: middle;padding-left: 0;text-align: center">
                        <a class="delLink" href="#" uid="${product['uid']}"d>
                            <i class="icon-trash" alt="删除"></i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>