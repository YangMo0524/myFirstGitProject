<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="lright">
    <div class="lmain"><div class="bd"><h2 class="title">养宠知识</h2></div></div>
    <div class="lbox">
        <a href="/Artcle.html?act=list&lableId=1" target="_blank">宠物新闻</a>
        <a href="/Artcle.html?act=list&lableId=3" target="_blank">宠物饮食</a>
        <a href="/Artcle.html?act=list&lableId=4" target="_blank">宠物健康</a>
        <a href="/Artcle.html?act=list&lableId=5" target="_blank">宠物养护</a>
        <a href="/Artcle.html?act=list&lableId=6" target="_blank">宠物百科</a>
        <a href="/Artcle.html?act=list&lableId=7" target="_blank">宠物图库</a>
    </div>
    <div class="lmain mt15"><div class="bd"><h2 class="title">栏目最热</h2></div></div>
    <div class="section">
        <ul>
            <c:forEach items="${hotArtcles}" var="article" step="1" begin="0" end="4" varStatus="thisart">
            <li><a target="_blank" href="<%=request.getContextPath()%>/Artcle.html?act=info&thisart=${thisart.count}&labeltag=2&label=${article.label.labelId}&articleId=${article.artcleId}"><img alt="${article.artcleTitle}" src="/pet/image/${article.cover}"></a><h3><a target="_blank" href="<%=request.getContextPath()%>/Artcle.html?act=info&thisart=${thisart.count}&labeltag=2&label=${article.label.labelId}&articleId=${article.artcleId}">${article.artcleTitle}</a></h3><div class="summary">${article.artcleContent}</div></li>
            </c:forEach>
        </ul>
    </div>
    <div class="lmain mt15"><div class="bd"><h2 class="title">热点推荐</h2></div></div>
    <ul class="ribox">
        <li><a href="<%=request.getContextPath()%>/Artcle.html?act=info&thisart=1&labeltag=3&label=${firstArtcle.label.labelId}&articleId=${firstArtcle.artcleId}" target="_blank"><img src="/pet/image/${firstArtcle.cover}" alt="${firstArtcle.artcleTitle}"></a><span></span><p><a href="<%=request.getContextPath()%>/Artcle.html?act=info&thisart=1&labeltag=3&label=${firstArtcle.label.labelId}&articleId=${firstArtcle.artcleId}" target="_blank">${firstArtcle.artcleTitle}</a></p></li>
    </ul>
    <div class="viewpoint">
        <ul>
            <c:forEach items="${AllArtcles}" var="artcle" begin="0" end="9" step="1" varStatus="thisart">
                <li><a href="<%=request.getContextPath()%>/Artcle.html?act=info&thisart=${thisart.count}&labeltag=3&label=${firstArtcle.label.labelId}&articleId=${firstArtcle.artcleId}" target="_blank">${artcle.artcleTitle}</a></li>
            </c:forEach>
        </ul>
    </div>
</div>
</body>
</html>
