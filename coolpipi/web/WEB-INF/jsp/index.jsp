<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<script type="text/javascript">
</script>
<html>
<body>
<%@ include file="/WEB-INF/jsp/head.jsp" %>
<div class="content">
    <div class="layoutbox"></div>
    <div class="slide-down-box">
    </div>
    <ul class="gallery">
        <c:forEach var="product" items="${products}" varStatus="status">
            <li style="left:${status.index*320}px;">
                <div class="gallery-item bgcolor${status.index+1}">
                    <div class="gallery-box"></div>
                    <img class="indexImg${status.index+1}" src="indexPic/${product['defaultPic']}" width="330px"/>
                    <div class="gallery-info${status.index+1}">
                        <div class="gallery-title">${product['name']}${index}</div>
                        <div class="gallery-label">
                            <c:forEach var="tag" items="${product['tag']}" varStatus="ts">
                                <c:choose>
                                    <c:when test="${(ts.index+status.index)%6 eq 0}">
                                        <span class="label label-inverse">${tag}</span>
                                    </c:when>
                                    <c:when test="${(ts.index+status.index)%6 eq 1}">
                                        <span class="label">${tag}</span>
                                    </c:when>
                                    <c:when test="${(ts.index+status.index)%6 eq 2}">
                                        <span class="label label-info">${tag}</span>
                                    </c:when>
                                    <c:when test="${(ts.index+status.index)%6 eq 3}">
                                        <span class="label label-warning">${tag}</span>
                                    </c:when>
                                    <c:when test="${(ts.index+status.index)%6 eq 4}">
                                        <span class="label label-success">${tag}</span>
                                    </c:when>
                                    <c:when test="${(ts.index+status.index)%6 eq 5}">
                                        <span class="label label-important">${tag}</span>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        <div class="gallery-detail">${product['summary']}</div>
                    </div>
                </div>
                </div>
            </li>
        </c:forEach>
    </ul>
</div>
</body>
</html>