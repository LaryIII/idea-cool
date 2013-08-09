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
    <div class="container-fluid">
        <div class="row-fluid">
            <input type="button" class="btn" onclick="window.location.href='edit.do'" value="新 增"/>
        </div>
        <div class="row-fluid">
            <table class="table table-striped table-bordered table-condensed table-hover">
                <thead>
                    <tr>
                        <th style="width: 5%">产品id</th>
                        <th style="width: 10%">产品名称</th>
                        <th style="width: 40%">产品标签</th>
                        <th style="width: 25%">图片路径</th>
                        <th style="width: 5%">编辑</th>
                        <th style="width: 5%">删除</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td>${product['uid']}</td>
                            <td>${product['name']}</td>
                            <td>
                                <button class="btn btn-mini btn-primary editTagBtn" type="button" uid="${product['uid']}"
                                        name="${product['name']}">编辑</button>
                                ${product['tag']}
                            </td>
                            <td>${product['defaultPic']}</td>
                            <td style="vertical-align: middle;padding-left: 0;text-align: center">
                                <a href="edit.do?uid=${product['uid']}">
                                    <i class="icon-tag"></i>
                                </a>
                            </td>
                            <td style="vertical-align: middle;padding-left: 0;text-align: center">
                                <a class="delLink" href="#" uid="${product['uid']}">
                                    <i class="icon-trash"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div id="tagEdit" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">编辑标签</h3>
    </div>
    <form action="editTag.do" method="post">
    <div class="modal-body" style="height: 500px">
        <input id="uid" name="uid" style="display: none"/>
        <p>产品名称：</p><input id="name" name="name" type="text" disabled="true"/>
        <ul id="tag_ul" class="tag_ul">
            <li style="overflow:hidden;padding:2px 5px">
                <input id="addTagInput" type="text" class="tag_new_input"
                       style="display: none" data-provide="typeahead"/>
                <img id="addTag" class="icon-plus" alt="点击添加标签" style="cursor:pointer"/>
                <span style="color:gray">(点击添加标签)</span>
            </li>
        </ul>
    </div>
    <div class="modal-footer">
        <button class="btn btn-primary" type="submit">保存</button>
        <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
    </div>
    </form>
</div>
</body>
</html>
<script type="text/javascript">
    (function ($) {
        $(".editTagBtn").click(function (){
            var uid = $(this).attr("uid");
            var name = $(this).attr("name");
            $("#name").val(name);
            $("#uid").val(uid);
            $("#tagEdit").modal("show");
        });

        $('#addTagInput').typeahead({
            source: ${tags}
        })

        function initSpanEvent() {
            $("#tag_ul li.tag_li span").each(function (index, span) {
                bindClickEventOnSpan(span);
            });
        }

        function bindClickEventOnA(a) {
            $(a).on("click", function () {
                $(this).parent().remove();
                if ($("#tag_ul li.tag_li").length == 0) {
                    var userTagEmptyHidden = $("<input>").attr("id", "userTag")
                            .attr("type", "hidden").attr("value", "")
                            .attr("name", "tags").attr("data-provide", "typeahead");
                        $("#tag_ul").append(userTagEmptyHidden);
                }
            });
        }

        function bindClickEventOnSpan(span) {
            $(span).on("click", function () {
                var text = $(this).text();
                var input = $("<input>").attr("type", "text").attr("class", "tag_input").attr("value", text)
                        .attr("data-provide", "typeahead");
                $(this).replaceWith(input);
                input.focus();
                bindBlurEventOnInput(input);
            });
        }

        function bindBlurEventOnInput(input) {
            var hidden = input.next("input:hidden");
            input.on("blur", function () {
                var newSpan = $("<span>").text($(this).val());
                bindClickEventOnSpan(newSpan);
                $(this).replaceWith(newSpan);
                hidden.val($(this).val());
            });
        }

        initSpanEvent();
        $("#tag_ul li.tag_li a").each(function (index, a) {
            bindClickEventOnA(a);
        });
        $("#addTag").on("click", function () {
            var input = $("#addTagInput");
            var addA = $(this);
            input.show();
            input.focus();
            input.on("blur", function () {
                addA.show();
                $(this).hide();
                var inputValue = $(this).val();
                if (inputValue != null && inputValue.trim() != "") {
                    var newLi = $("<li>").attr("class", "tag_li");
                    var newSpan = $("<span>").text(inputValue);
                    newLi.append(newSpan);
                    var newHidden = $("<input>").attr("type", "hidden").attr("name", "tags").attr("value", inputValue)
                            .attr("data-provide", "typeahead");
                    newLi.append(newHidden);
                    var newA = $("<a>").attr("class", "icon-remove").attr("title", "删除").append("&nbsp;&nbsp;&nbsp;");
                    newLi.append(newA);
                    if ($("#tag_ul .tag_li").length == 0) {
                        $("#tag_ul").prepend(newLi);
                    } else {
                        newLi.insertAfter($("#tag_ul .tag_li:last"));
                    }
                    bindClickEventOnSpan(newSpan);
                    bindClickEventOnA(newA);
                }
                $(this).val("");
                $("#userTag").remove();
            });
            $(this).hide();
        });
    })(jQuery);
</script>