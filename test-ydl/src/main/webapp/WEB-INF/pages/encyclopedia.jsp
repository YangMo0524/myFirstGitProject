<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/12
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<jsp:include page="../../common/header.jsp"></jsp:include>
<head>
    <title>宠物大全</title>
</head>
<body>
<div class="dangq">当前位置：<a href="<%=request.getContextPath()%>/index.html">网站首页</a> >> <a
        href=<%=request.getContextPath()%>/index.html>宠物大全</a> >> <a
        href=<%=request.getContextPath()%>/index.html>所有宠物</a></div>
<div style="width: 1200px;height: auto;margin:0 auto;overflow:hidden;margin-top:15px;">
    <hr/>
    <div class="cwbk" id="cwbk">
        <c:forEach items="${petCategories}" var="petc" varStatus="petcs">
            <li><span class="img"><a href="<%=request.getContextPath()%>/petinfo.html?petId=${petc.petId}"><img
                    src="http://localhost:8080/pet/image/${petc.petImg}" style="border-radius: 100%"></a></span>
                <p class="title"><a
                        href="<%=request.getContextPath()%>/petinfo.html?petId=${petc.petId}" >${petc.petName}</a></p>
                <p class="info">${petc.petDiscription}<a
                        href="<%=request.getContextPath()%>/petinfo.html?petId=${petc.petId}" class="more">更多>></a></p>
            </li>
        </c:forEach>
    </div>
</div>
<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>
