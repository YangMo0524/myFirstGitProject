<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/9
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Cache-Control" content="no-transform" />
    <meta http-equiv="mobile-agent" content="format=html5; url=https://m.chongshe.cn/news/cwxw/">
    <meta http-equiv="mobile-agent" content="format=xhtml; url=https://m.chongshe.cn/news/cwxw/">
    <script src="static/js/mobile.js" type="text/javascript"></script>
    <script type="text/javascript">uaredirect("https://m.chongshe.cn/news/cwxw/");</script>
    <title>宠物狗新闻,宠物界新闻,宠物新闻头条,关于宠物新闻-宠舍</title>
    <meta name="keywords" content="宠物狗新闻,宠物界新闻,宠物新闻头条,关于宠物新闻" />
    <meta name="description" content="宠物狗新闻,宠物界新闻,宠物新闻头条,关于宠物新闻，宠舍商城最新最全的宠物新闻帮你快速了解宠物，在与宠物的日常中能狗更好的享受到养宠的乐趣。" />
    <link rel="stylesheet" href="/static/css/css.css" />
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

            <em></em> <c:choose>
                <c:when test="${USER_SESSION == null}"><a href="${pageContext.request.contextPath}/login.html">登录账户</a></c:when>
                <c:when test="${USER_SESSION != null}"></c:when>
            </c:choose>
            <a href="${pageContext.request.contextPath}/register.html">免费注册</a>
            <c:choose>
                <c:when test="${USER_SESSION == null}"></c:when>
                <c:when test="${USER_SESSION != null}"><a
                        href="${pageContext.request.contextPath}/logout.html">退出</a></c:when>
            </c:choose>
        </div>
    </div>
</div>
<div class="head mainbox">
    <a href="/" title="宠舍" class="logo fl"><img src="static/picture/logo.png"></a>
    <div class="search fr">
        <div class="search-form">
            <div class="search-text"><input class="text-search" name="keywords" value="" placeholder="请输入你想要搜索的关键词..." type="text"/></div>
            <button type="button" class="btn-search" name="btn_search" onclick="OW.search.run(1)">搜索</button>
        </div>
        <div class="search-keywords" name="search_keywords"></div>
    </div>
</div>
<div class="index-nav">
    <div class="mainbox">
        <a class="nav-index current" href="/index.html" style="${html == 0?"background-color: #468824":""}">网站首页</a>
        <a href="/Artcle.html?act=list&lableId=1" style="${html == 1?"background-color: #468824":""}">宠物新闻</a>
        <a href="/Artcle.html?act=list&lableId=5" style="${html == 5?"background-color: #468824":""}">宠物养护</a>
        <a href="/communicate.html?act=communite" style="${html == 22?"background-color: #468824":""}">交流社区</a>
        <a href="<%=request.getContextPath()%>/petcategories.html" style="${html == 99?"background-color: #468824":""}">宠物大全</a>
        <a href="/go_myPetHouse.html?uid=${USER_SESSION.userId}">我的宠舍</a>
        <a href="${pageContext.request.contextPath}/addArtcle.html" style="${html == 7?"background-color: #468824":""}">用户投稿</a>
    </div>
</div>
</body>
</html>
