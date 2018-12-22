<!DOCTYPE HTML>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Cache-Control" content="no-transform" />
    <meta http-equiv="mobile-agent" content="format=html5; url=https://m.chongshe.cn/">
    <meta http-equiv="mobile-agent" content="format=xhtml; url=https://m.chongshe.cn/">
    <script src="../../static/js/mobile.js" type="text/javascript"></script>
    <script type="text/javascript">uaredirect("https://m.chongshe.cn/");</script>
    <title>宠舍(chongshe.cn)-专业的宠物及宠物用品网购商城！</title>
    <meta name="keywords" content="宠舍,宠物,宠物商城,宠物用品商城,网上宠物商城,宠物网上商城" />
    <meta name="description" content="宠舍(chongshe.cn)国内唯一一家专注于宠物及宠物周边用品的网上商城，涵盖上百种宠物，官方直营直售免费配送，完美体验网上淘宠。" />
    <link rel="stylesheet" href="../../static/css/css.css" />
    <link rel="stylesheet" href="../../static/css/icon.css" />
    <script type="text/javascript" src="../../static/js/ow.js"></script>
    <script type="text/javascript" src="../../static/js/com.js"></script>
    <script type="text/javascript" src="../../static/js/jquery.js"></script>
    <script type="text/javascript" src="../../static/js/superslide.js"></script>
</head>
<body>
<div class="come">
    <div class="mainbox">
        <div class="fl"><span>HELLO！</span>欢迎热爱养宠的宠友来到宠舍，这里将是宠友最喜爱的养宠交流平台。</div>
        <div class="fr">您好,
            <c:choose>
                <c:when test="${USER_SESSION == null}"><span>匿名游客</span></c:when>
                <c:when test="${USER_SESSION != null}"><span>${USER_SESSION.userName}</span></c:when>
            </c:choose>

            <em></em>
            <c:choose>
                <c:when test="${USER_SESSION == null}"><a href="${pageContext.request.contextPath}/login.html">登录账户</a></c:when>
                <c:when test="${USER_SESSION != null}"></c:when>
            </c:choose>
            <a href="${pageContext.request.contextPath}/register.html">免费注册</a>
            <c:choose>
                <c:when test="${USER_SESSION == null}"></c:when>
                <c:when test="${USER_SESSION != null}"><a href="${pageContext.request.contextPath}/logout.html">退出</a></c:when>
            </c:choose>
        </div>
    </div>
</div>
<div class="head mainbox">
    <a href="/" title="宠舍" class="logo fl"><img src="/static/picture/logo.png"></a>
    <div class="search fr">
        <div class="search-form">
            <div class="search-text"><input type="text" class="text-search" name="keywords" value="" placeholder="请输入你想要搜索的关键词..."></div>
            <button type="button" class="btn-search" name="btn_search" onclick="OW.search.run(1)">搜索</button>
        </div>
        <div class="search-keywords" name="search_keywords"></div>
    </div>
</div>
<div class="index-nav">
    <div class="mainbox">
        <a class="nav-index current" href="/" style="${html == 0?"background-color: #468824":""}">网站首页</a>
        <a href="/Artcle.html?act=list&lableId=1"  style="${html == 1?"background-color: #468824":""}">宠物新闻</a>
        <a href="/Artcle.html?act=list&lableId=5" style="${html == 5?"background-color: #468824":""}">宠物养护</a>
        <a href="/communicate.html?act=communite" style="${html == 22?"background-color: #468824":""}">交流社区</a>
        <a href="<%=request.getContextPath()%>/petcategories.html" style="${html == 99?"background-color: #468824":""}">宠物大全</a>
        <a href="/go_myPetHouse.html?uid=${USER_SESSION.userId}">我的宠舍</a>
        <a href="${pageContext.request.contextPath}/addArtcle.html" style="${html == 7?"background-color: #468824":""}">用户投稿</a>
    </div>
</div>
<div class="bannerbox" id="allcates">
    <div class="banner">
        <div id="ow_ad_1" type="image" data='[{"url":"/static/picture/wb1.jpg","name":"wb1","link":""},{"url":"/static/picture/wb2.jpg","name":"2","link":""},{"url":"/static/picture/wb3.jpg","name":"3","link":""}]' style="display:none; height:400px; width:1920px; margin:auto;" ad_height="400px" ad_width="1920px" full_screen="1" switch_time="6"></div><script type="text/javascript">$(document).ready(function(){OW.ad.parse(1);});</script><script type="text/javascript">$(document).ready(function(){OW.ad.count(1);});</script>
    </div>

</div>
<div class="idx-hero-sub">
    <div class="wrapper">
        <div class="idx-service4">
            <ul>
                <li class="li1"><a href="/Artcle.html?act=list&lableId=1"><i class="glyphicon glyphicon-list-alt"></i><span>宠物新闻</span></a></li>
                <li class="li2"><a href="/Artcle.html?act=list&lableId=3"><i class="glyphicon glyphicon-barcode"></i><span>宠物饮食</span></a></li>
                <li class="li3"><a href="/Artcle.html?act=list&lableId=4"><i class="glyphicon glyphicon-user"></i><span>宠物健康</span></a></li>
                <li class="li1"><a href="/Artcle.html?act=list&lableId=5"><i class="glyphicon glyphicon-barcode"></i><span>宠物养护</span></a></li>
                <li class="li3"><a href="/Artcle.html?act=list&lableId=6"><i class="glyphicon glyphicon-copyright-mark"></i><span>宠物百科</span></a></li>
                <li class="li2"><a href="/Artcle.html?act=list&lableId=7"><i class="glyphicon glyphicon-envelope"></i><span>宠物图库</span></a></li>
            </ul>
        </div>
        <div class="idx-hero-promo">
            <ul>
                <li i="1"><a href="#" target="_blank"><img src="/static/picture/promo1.jpg" alt="promo1" title="promo1"></a></li>
                <li i="2"><a href="#" target="_blank"><img src="/static/picture/promo2.jpg" alt="promo2" title="promo2"></a></li>
                <li i="3"><a href="#" target="_blank"><img src="/static/picture/promo3.jpg" alt="promo3" title="promo3"></a></li>
            </ul>
        </div>
    </div>
</div>
<div class="main">
    <div class="section-title">
        <ul class="title-left">
            <li><a href="/Artcle.html?act=list&lableId=1" target="_blank">宠物新闻</a></li>
            <li><a href="/Artcle.html?act=list&lableId=3" target="_blank">宠物饮食</a></li>
            <li><a href="/Artcle.html?act=list&lableId=4" target="_blank">宠物健康</a></li>
        </ul>
        <div class="title-c"> <a href="/Artcle.html?act=list&lableId=2" target="_blank">养宠<b>知识</b></a></div>
        <ul class="title-right">
            <li><a href="/Artcle.html?act=list&lableId=7" target="_blank">宠物图库</a></li>
            <li><a href="/Artcle.html?act=list&lableId=5" target="_blank">宠物养护</a></li>
            <li><a href="/Artcle.html?act=list&lableId=6" target="_blank">宠物百科</a></li>
        </ul>
    </div>
    <div class="focus-detail-1">
        <div class="artical">
            <ul>
                <c:forEach  items="${threadartcle}" var="artcle" begin="0" end="2" step="1" varStatus="thisart">
                    <li><a href="<%=request.getContextPath()%>/Artcle.html?act=info&thisart=${thisart.count}&labeltag=3&label=${artcle.label.labelId}&articleId=${artcle.artcleId}" target="_blank"><h2><span></span><em>${artcle.artcleTitle}</em></h2><div class="indexArticalContext">${artcle.artcleContent}</div></a></li>
                </c:forEach>
            </ul>
        </div>
        <div id="focus-slide">
            <div class="hd">
                <ul>
                    <li></li>
                    <li></li>
                </ul>
            </div>
            <div class="bd">
                <ul>
                    <li><a href="" target="_blank"><img src="/static/picture/mb2.jpg" alt=""/></a></li>
                    <li><a href="" target="_blank"><img src="/static/picture/mb1.jpg" alt=""/></a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="focus-detail-2">
        <div class="wrap">
            <div class="artical">
                <ul>
                    <c:forEach items="${threadartcle}" var="artcle" begin="3" end="17" step="1" varStatus="thisart">
                        <li><s></s><a href="<%=request.getContextPath()%>/Artcle.html?act=info&thisart=${thisart.count}&labeltag=3&label=${artcle.label.labelId}&articleId=${artcle.artcleId}" target="_blank">${artcle.artcleTitle}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="focus-show-2"><a href="" target="_blank"><img src="/static/picture/nd1.jpg" alt=""/></a></div>
        </div>
    </div>
</div>
<div class="main">
    <div class="bd">
        <h2 class="title">宠物百科</h2>
        <div class="flist">
            <a href="javascript:;" class="dog" onclick="changeCategory(1)"><span></span>宠物狗</a>
            <a href="javascript:;" class="cat" onclick="changeCategory(2)"><span></span>宠物猫</a>
            <a href="javascript:;" class="tu" onclick="changeCategory(3)"><span></span>宠物兔</a>
        </div>
    </div>
    <div class="cwbk" id="cwbk">
        <c:forEach items="${petCategory}" var="petc">
            <li><span class="img"><a href="<%=request.getContextPath()%>/petinfo.html?petId=${petc.petId}"><img
                    src="http://localhost:8080/pet/image/${petc.petImg}" style="border-radius:10px;"></a></span>
                <p class="title"><a
                        href="<%=request.getContextPath()%>/petinfo.html?petId=${petc.petId}">${petc.petName}</a></p>
                <p class="info">${petc.petDiscription}<a
                        href="<%=request.getContextPath()%>/petinfo.html?petId=${petc.petId}" class="more">更多>></a></p>
            </li>
        </c:forEach>
    </div>
</div>
<div class="main">
    <div class="bd"><h2 class="title">宠友晒图</h2><a href="${pageContext.request.contextPath}/userPetImg.html?act=getImages
" class="more">更多>></a></div>
    <div class="piclist">
        <c:forEach items="${imgs}" var="i">
            <li class="dpic" style="width: 33%;"><a href="#" target="_blank"><img
                    src="http://localhost:8080/pet/image/${i.petImgUrl}"
                    alt="" style="width:380px;height:250px;border-radius: 10px;border-radius-bottom-right:10px;"/></a></li>
        </c:forEach>
    </div>
    </div>
</div>
<div class="hezuo">
    <div class="title">合作伙伴</div>
    <div class="himg">
        <li><img src="/static/picture/index_partner1.jpg"></li>
        <li><img src="/static/picture/index_partner2.jpg"></li>
        <li><img src="/static/picture/index_partner3.jpg"></li>
        <li><img src="/static/picture/index_partner4.jpg"></li>
        <li><img src="/static/picture/index_partner5.jpg"></li>
        <li><img src="/static/picture/index_partner6.jpg"></li>
        <li><img src="/static/picture/index_partner7.jpg"></li>
        <li><img src="/static/picture/index_partner8.jpg"></li>
        <li><img src="/static/picture/index_partner9.jpg"></li>
        <li><img src="/static/picture/index_partner10.jpg"></li>
        <li><img src="/static/picture/index_partner11.jpg"></li>
        <li><img src="/static/picture/index_partner12.jpg"></li>
    </div>
</div>
<div class="yqlink">
    <div class="yqtop">友情链接<span>宠舍友链交换专用QQ：229435202</span></div>
    <a href="http://gz.leju.com/" target="_blank">广州房产</a>
</div>
<script type="text/javascript">
    jQuery("#focus-slide").slide({ mainCell: ".bd ul", autoPlay: true, effect: "left" });
//动态加载宠物百科  纪文广
    function changeCategory(petCategoryId) {
        //alert(petCategoryId);
        var pcId = petCategoryId;
        //alert(pcId)
        $.ajax({
            url: "petcategory.html",
            data: {"petCategoryId": pcId},
            method: "post",
            success: function (result) {
                //alert(result)
                $("#cwbk").html("");
                var str = "";
                for (var i = 0; i < result.length; i++) {
                    str+='<li><span class="img"><a href="<%=request.getContextPath()%>/petinfo.html?petId='+result[i].petId+'"><img src="http://localhost:8080/pet/image/'+result[i].petImg+'"></a></span><p class="title"><a href="<%=request.getContextPath()%>/petinfo.html?petId='+result[i].petId+'">'+result[i].petName+'</a></p><p class="info">'+result[i].petDiscription+'<a href="<%=request.getContextPath()%>/petinfo.html?petId='+result[i].petId+'" class="more">更多>></a></p></li>\n'
                }
                $("#cwbk").html(str)
            }, error: function () {
                $("#cwbk").html("查询无果");
            }

        })
    }


</script>
<jsp:include page="../../common/footer.jsp"></jsp:include>

</body>
</html>