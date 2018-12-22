
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<script type="text/javascript" >

    var list =JSON.stringify(${newArtcles.list});
    $.ajax({
         type :"post",
         url:"<%=request.getContextPath()%>/Artcle.html?act=info",
         dataType:"json",
         contentType:'application/json;charset=UTF-8',
         data:JSON.stringify(list),
         success : function(data) {
        }
    })
</script>--%>
<!DOCTYPE HTML>

<jsp:include page="../../common/header.jsp"></jsp:include>
<div class="dangq">当前位置：<a href="<%=request.getContextPath()%>/index.html">网站首页</a> >> <a href="<%=request.getContextPath()%>/Artcle.html?act=list&pageNum=1&lableId=${thislable.label.labelId}">${thislable.label.labelName}</a></div>
<div class="main">
    <div class="listl">
        <ul class="jthumb">
            <c:forEach items="${newArtcles.list}" var="article" varStatus="thisart">
                <li>
                    <div class="viewimg"><a href="<%=request.getContextPath()%>/Artcle.html?act=info&thisart=${thisart.count}&labeltag=1&label=${article.label.labelId}&articleId=${article.artcleId}" target="_blank" class="preview"><img
                            src="/pet/image/${article.cover}"></a>
                        <div class="standpoint">${article.label.labelName}</div>
                    </div>
                    <h3><a href="<%=request.getContextPath()%>/Artcle.html?act=info&thisart=${thisart.count}&labeltag=1&label=${article.label.labelId}&articleId=${article.artcleId}" target="_blank"><b>${article.artcleTitle}</b></a></h3><span
                        class="zzsj">来源：${article.artcleSource}</span><span class="zzsj"> <fmt:formatDate type="both" dateStyle="long" timeStyle="long" value="${article.artcleReleaseDate}" /></span>
                    <div class="articalContext">
                            ${article.artcleContent}</div>
                    <div class="tags"></div>
                </li>
            </c:forEach>

        </ul>
        <div class="pager">
            <a href="/Artcle.html?act=list&lableId=${html}&pageNum=1">首页</a>
            <a href="/Artcle.html?act=list&lableId=${html}&pageNum=${newArtcles.prePage}">上一页</a>
            <a href="/Artcle.html?act=list&lableId=${html}&pageNum=${newArtcles.nextPage}">下一页</a>
            <a href="/Artcle.html?act=list&lableId=${html}&pageNum=${newArtcles.pages}">尾页</a></div>
        </div>
    <jsp:include page="../../common/lright.jsp"></jsp:include>
</div>
<jsp:include page="../../common/footer.jsp"></jsp:include>

</body>
</html>