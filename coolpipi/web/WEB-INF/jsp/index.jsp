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
<body>
<div class="header">
    <c:forEach var="product" items="${products}">
        ${product['name']}
    </c:forEach>
    <div class="logo-box"><a href="#" class="logo"></a></div>
    <div class="home-btn"><button id="homeBtn" class="btn btn-large" type="button">Home</button></div>
    <div class="login">
        <button id="loginbtn" class="btn dropdown-toggle" data-toggle="modal" data-target="#myModal"><i class="icon-user"></i> 登录</button>
    </div>
</div>
<div class="content">
    <div class="layoutbox"></div>
    <div class="slide-down-box">
    </div>
    <ul class="gallery">
        <li style="left:0px;">
            <div class="gallery-item bgcolor1">
                <div class="gallery-box"></div>
                <img src="assets/images-list/001.jpg" />
                <div class="gallery-info">
                    <div class="gallery-title">Google眼镜</div>
                    <div class="gallery-label"><span class="label label-inverse">极品</span><span class="label">炫酷</span><span class="label label-info">穿戴式</span></div>
                    <div class="gallery-detail">谷歌于2012年4月4日在其社交网络Google+上公布了命名为“Project Glass”的电子眼镜产品计划，此款眼镜正处在调整和测试过程中 ，还未在店铺中推出。谷歌眼镜包括了一条可横置于鼻梁上方的平行框架、一个位于镜框右侧的宽条状电脑...</div>
                </div>
            </div>
        </li>
        <li style="left:320px;">
            <div class="gallery-item bgcolor2">
                <div class="gallery-box"></div>
                <img src="assets/images-list/002.jpg"/>
                <div class="gallery-info" style="top:350px;">
                    <div class="gallery-title">iWatch</div>
                    <div class="gallery-label"><span class="label">炫酷</span><span class="label label-info">穿戴式</span></div>
                    <div class="gallery-detail">谷歌于2012年4月4日在其社交网络Google+上公布了命名为“Project Glass”的电子眼镜产品计划，此款眼镜正处在调整和测试过程中 ，还未在店铺中推出。</div>
                </div>
            </div>
        </li>
        <li style="left:640px;">
            <div class="gallery-item bgcolor3">
                <div class="gallery-box"></div>
                <img src="assets/images-list/003.jpg">
                <div class="gallery-info">
                    <div class="gallery-title">Padfone2</div>
                    <div class="gallery-label"><span class="label">炫酷</span><span class="label label-info">穿戴式</span></div>
                    <div class="gallery-detail">谷歌于2012年4月4日在其社交网络Google+上公布了命名为“Project Glass”的电子眼镜产品计划，此款眼镜正处在调整和测试过程中 ，还未在店铺中推出。</div>
                </div>
            </div>
        </li>
        <li style="left:960px;">
            <div class="gallery-item bgcolor4">
                <div class="gallery-box"></div>
                <img src="assets/images-list/004.jpg">
                <div class="gallery-info" style="top:380px;">
                    <div class="gallery-title">Lytro</div>
                    <div class="gallery-label"><span class="label">炫酷</span><span class="label label-info">穿戴式</span></div>
                    <div class="gallery-detail">谷歌于2012年4月4日在其社交网络Google+上公布了命名为“Project Glass”的电子眼镜产品计划，此款眼镜正处在调整和测试过程中 ，还未在店铺中推出。</div>
                </div>
            </div>
        </li>
        <li style="left:1280px;">
            <div class="gallery-item bgcolor5">
                <div class="gallery-box"></div>
                <img src="assets/images-list/005.jpg">
                <div class="gallery-info">
                    <div class="gallery-title">iWatch</div>
                    <div class="gallery-label"><span class="label">炫酷</span><span class="label label-info">穿戴式</span></div>
                    <div class="gallery-detail">谷歌于2012年4月4日在其社交网络Google+上公布了命名为“Project Glass”的电子眼镜产品计划，此款眼镜正处在调整和测试过程中 ，还未在店铺中推出。</div>
                </div>
            </div>
        </li>
        <li style="left:1600px;">
            <div class="gallery-item bgcolor1">
                <div class="gallery-box"></div>
                <img src="assets/images-list/006.jpg">
                <div class="gallery-info">
                    <div class="gallery-title">iWatch</div>
                    <div class="gallery-label"><span class="label">炫酷</span><span class="label label-info">穿戴式</span></div>
                    <div class="gallery-detail">谷歌于2012年4月4日在其社交网络Google+上公布了命名为“Project Glass”的电子眼镜产品计划，此款眼镜正处在调整和测试过程中 ，还未在店铺中推出。</div>
                </div>
            </div>
        </li>
        <li style="left:1920px;">
            <div class="gallery-item bgcolor3">
                <div class="gallery-box"></div>
                <img src="assets/images-list/007.jpg">
                <div class="gallery-info" style="top:150px;">
                    <div class="gallery-title">iWatch</div>
                    <div class="gallery-label"><span class="label">炫酷</span><span class="label label-info">穿戴式</span></div>
                    <div class="gallery-detail">谷歌于2012年4月4日在其社交网络Google+上公布了命名为“Project Glass”的电子眼镜产品计划，此款眼镜正处在调整和测试过程中 ，还未在店铺中推出。</div>
                </div>
            </div>
        </li>
        <li style="left:2240px;">
            <div class="gallery-item bgcolor1">
                <div class="gallery-box"></div>
                <img src="assets/images-list/008.jpg">
                <div class="gallery-info">
                    <div class="gallery-title">iWatch</div>
                    <div class="gallery-label"><span class="label">炫酷</span><span class="label label-info">穿戴式</span></div>
                    <div class="gallery-detail">谷歌于2012年4月4日在其社交网络Google+上公布了命名为“Project Glass”的电子眼镜产品计划，此款眼镜正处在调整和测试过程中 ，还未在店铺中推出。</div>
                </div>
            </div>
        </li>
        <li style="left:2560px;">
            <div class="gallery-item bgcolor3">
                <div class="gallery-box"></div>
                <img src="assets/images-list/009.jpg">
                <div class="gallery-info" style="top:180px;">
                    <div class="gallery-title">iWatch</div>
                    <div class="gallery-label"><span class="label">炫酷</span><span class="label label-info">穿戴式</span></div>
                    <div class="gallery-detail">谷歌于2012年4月4日在其社交网络Google+上公布了命名为“Project Glass”的电子眼镜产品计划，此款眼镜正处在调整和测试过程中 ，还未在店铺中推出。</div>
                </div>
            </div>
        </li>
        <li style="left:2880px;">
            <div class="gallery-item bgcolor4">
                <div class="gallery-box"></div>
                <img src="assets/images-list/010.jpg">
                <div class="gallery-info" style="top:120px;">
                    <div class="gallery-title">iWatch</div>
                    <div class="gallery-label"><span class="label">炫酷</span><span class="label label-info">穿戴式</span></div>
                    <div class="gallery-detail">谷歌于2012年4月4日在其社交网络Google+上公布了命名为“Project Glass”的电子眼镜产品计划，此款眼镜正处在调整和测试过程中 ，还未在店铺中推出。</div>
                </div>
            </div>
        </li>
    </ul>
</div>
<div id="mask"></div>
<div class="modal hide fade" id="myModal">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3>对话框标题</h3>
    </div>
    <div class="modal-body">
        <p>One fine body…</p>
    </div>
    <div class="modal-footer">
        <a href="#" class="btn">关闭</a>
        <a href="#" class="btn btn-primary">Save changes</a>
    </div>
</div>
<script src="assets/sea-modules/seajs/2.0.0/sea.js" data-config="home-page/index-config" data-main="home-page/index"></script>
</body>
</html>