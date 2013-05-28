<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<script type="text/javascript">
</script>
<script type="text/javascript" src="js/editor_config.js"></script>
<script type="text/javascript" src="js/editor_all_min.js"></script>
<html>
<body style="background-color: white;">
<%@ include file="/WEB-INF/jsp/head.jsp" %>
<div class="content">
    <div class="layoutbox"></div>
    <div class="slide-down-box">
    </div>
    <form:form action="submit.do" method="post" enctype="multipart/form-data" >
        物品名称：<form:input path="name"></form:input>
        <form:input path="uid" cssStyle="display: none"></form:input>
        </br>
        物品描述：<form:textarea path="summary" rows="8" cssStyle="width:500px"/>
        </br>
        上传图片：<input path="file" name="file" type="file"/>
        </br>
        图片路径：<form:input path="defaultPic"></form:input>
        详细内容：<form:textarea id="editor" path="editorValue"/>
        <input type="submit" value="提 交">
        <input type="button" value="返 回" onclick="window.location.href='admin.do'">
    </form:form>
</div>
</body>
<script type="text/javascript">
    //实例化编辑器
    var ue = UE.getEditor('editor');
    ue.addListener('ready',function(){
        this.focus()
    });
</script>
</html>
