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
    <div class="layoutbox"></div>
    <div class="slide-down-box"></div>
    <input type="button" onclick="window.location.href='edit.do'" value="�� ��"/>
    <table style="width:100%">
        <tr>
            <th style="width: 5%">��Ʒid</th>
            <th style="width: 20%">��Ʒ����</th>
            <th style="width: 50%">��Ʒ����</th>
            <th style="width: 12%">��Ʒ��ǩ</th>
            <th style="width: 7%">ͼƬ·��</th>
            <th style="width: 3%">���</th>
            <th style="width: 3%">ɾ��</th>
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
                        <img src="${pageContext.request.contextPath}/images/edit_icon.gif" alt="�༭"/>
                    </a>
                </td>
                <td style="vertical-align: middle;padding-left: 0;text-align: center">
                    <a class="delLink" href="#" uid="${product['uid']}">
                        <img src="${pageContext.request.contextPath}/images/delete.gif" alt="ɾ��"/>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>