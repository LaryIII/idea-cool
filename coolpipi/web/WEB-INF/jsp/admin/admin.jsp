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
                                <button class="btn btn-mini btn-primary editTagBtn" type="button" uid="${product['uid']}"
                                        name="${product['name']}">编辑</button>
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
    <div class="modal-body">
        <ul id="tag_ul" class="alias_ul">
            <li style="overflow:hidden;padding:2px 5px">
                <input id="addAliasInput" type="text" class="alias_new_input"
                       style="display: none"/>
                <img id="addTag" title="点击添加标签" alt="点击添加标签" style="cursor:pointer"/>
                <span style="color:gray">(点击添加标签)</span>
            </li>
        </ul>
    </div>
    <div class="modal-footer">
        <button class="btn btn-primary">保存</button>
        <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    (function ($) {
        $(".editTagBtn").click(function (){
            var uid = $(this).attr("uid");
            $("#tagEdit").modal({uid: $(this).attr("uid"), name: $(this).attr("name")}).modal("show");
        })
        function initSpanEvent() {
            $("#alias_ul li.alias_li span").each(function (index, span) {
                bindClickEventOnSpan(span);
            });
        }

        function bindClickEventOnA(a) {
            $(a).on("click", function () {
                $(this).parent().remove();
                if ($("#alias_ul li.alias_li").length == 0) {
                    var userAliasEmptyHidden = $("<input>").attr("id", "userAlias")
                            .attr("type", "hidden").attr("value", "")
                            .attr("name", "map['attributes']['alias']");
                    $("#alias_ul").append(userAliasEmptyHidden);
                }
            });
        }

        function bindClickEventOnSpan(span) {
            $(span).on("click", function () {
                var text = $(this).text();
                var input = $("<input>").attr("type", "text").attr("class", "alias_input").attr("value", text);
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
        $("#alias_ul li.alias_li a").each(function (index, a) {
            bindClickEventOnA(a);
        });
        $("#addTag").on("click", function () {
            var input = $("#addAliasInput");
            var addA = $(this);
            input.show();
            input.focus();
            input.on("blur", function () {
                addA.show();
                $(this).hide();
                var inputValue = $(this).val();
                if (inputValue != null && inputValue.trim() != "") {
                    var newLi = $("<li>").attr("class", "alias_li");
                    var newSpan = $("<span>").text(inputValue);
                    newLi.append(newSpan);
                    var newHidden = $("<input>").attr("type", "hidden").attr("name", "map['attributes']['alias']").attr("value", inputValue);
                    newLi.append(newHidden);
                    var newA = $("<a>").attr("class", "deleteAlias").attr("title", "删除").append("&nbsp;&nbsp;&nbsp;");
                    newLi.append(newA);
                    if ($("#alias_ul .alias_li").length == 0) {
                        $("#alias_ul").prepend(newLi);
                    } else {
                        newLi.insertAfter($("#alias_ul .alias_li:last"));
                    }
                    bindClickEventOnSpan(newSpan);
                    bindClickEventOnA(newA);
                }
                $(this).val("");
                $("#userAlias").remove();
            });
            $(this).hide();
        });
    })(jQuery);
</script>