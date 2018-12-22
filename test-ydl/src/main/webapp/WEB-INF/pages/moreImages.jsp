<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/12
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>宠友晒图</title>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/common/header.jsp"></jsp:include>
<div class="piclist" style="margin-top: 30px;width: 1400px;margin-left:250px;">
    <c:forEach items="${imgs}" var="i">
        <li style="height:210px;width:280px;overflow: hidden;border-radius: 10px;text-align: center;">
            <div  style="height:200px;width:260px;border-radius: 10px;">
                <img src="http://localhost:8080/petblog/image/${i.petImgUrl}"
                     style="height:200px;width: 260px;border-radius: 10px;"/>
            </div>
        </li>
    </c:forEach>
</div>
<jsp:include page="${pageContext.request.contextPath}/common/footer.jsp"></jsp:include>
</body>
</html>
