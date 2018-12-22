<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/10
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="../../common/header.jsp"></jsp:include>
<head>
    <title>Title</title>
</head>
<body>
<div class="dangq">当前位置：<a href="<%=request.getContextPath()%>/index.html">网站首页</a> >> <a href=<%=request.getContextPath()%>/index.html>宠物百科</a> >> <a
        href=<%=request.getContextPath()%>/index.html>${petDescription.petName}</a></div>
<div style="width: 1200px;height: auto;margin:0 auto;overflow:hidden;margin-top:15px;">
    <div style="width: 850px;height: auto;float: left" >
        <h1 style="color: black">学名：${petDescription.petName}</h1>
        <h2 style="color: black">别名：${petInfo.alias}</h2>
        <hr>
        <div style="text-align: left;display:inline-block;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            ${petDescription.petDiscription}
        </div>
        <div>
            <div style="font-size: 18px;color: sandybrown"><span style="color: dimgray">饲养难度：</span>${petInfo.feedingGrade}星</div>
            <div style="font-size: 18px;color: sandybrown"><span style="color: dimgray">原产地：</span>${petInfo.origin}</div>
            <div style="font-size: 18px;color: sandybrown"><span style="color: dimgray">宠物体型：</span>${petInfo.petShape}</div>
        </div>
        <div style="float:left; clear: both;">
            <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${petInfo.petInfoContent}</span>
        </div>
    </div>
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
</div>
<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>

</html>
