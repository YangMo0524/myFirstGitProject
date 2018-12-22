<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-1.10.2.min.js"></script>
<script src="/date-format.js" type="text/javascript" charset="utf-8"></script>

<jsp:include page="../../common/header.jsp"></jsp:include>
<div class="dangq">当前位置：<a href="/">网站首页</a> >> <a href="/myPetHouse.html">我的宠舍</a></div>
<div class="main" style="height: auto">
    <div style="">
        <ul class="layui-nav layui-nav-tree" lay-filter="test" style="font-size:large;background-color:#e2e2e2;">
            <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
            <img src="http://localhost:8080/pet/image/${url}" alt="" style="width: 200px;height: 200px; border-radius: 50px;">
            <li class="layui-nav-item"><a href="javascript:;"
                                          onclick="$('#main-content').load('<%=request.getContextPath()%>/go_updateUserImg.html')">
                <span style="color: #0C0C0C">修改头像</span></a></li>
            <li class="layui-nav-item"><a href="javascript:;"
                                          onclick="$('#main-content').load('<%=request.getContextPath()%>/go_updateUserPassword.html')">
                <span style="color: #0C0C0C">修改密码</span></a></li>
            <li class="layui-nav-item"><a href="javascript:;"
                                          onclick="$('#main-content').load('<%=request.getContextPath()%>/go_myImg.html')">
                <span style="color: #0C0C0C">我的相册</span></a></li>
            <li class="layui-nav-item"><a href="javascript:;"
                                          onclick="$('#main-content').load('<%=request.getContextPath()%>/go_myArtcle.html?uid=${USER_SESSION.userId}')">
                <span style="color: #0C0C0C">我的文章</span></a></li>
            <li class="layui-nav-item"><a href="javascript:;"
                                          onclick="$('#main-content').load('<%=request.getContextPath()%>/go_myComm.html?uid=${USER_SESSION.userId}')">
                <span style="color: #0C0C0C">我的帖子</span></a></li>
            <li class="layui-nav-item"><a href="/logout.html">
                <span style="color: #0C0C0C">退出</span></a></li>
        </ul>
    </div>
</div>
<div class="layui-body" style="left: 550px; top:250px;height:auto;">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;" id="main-content">
        内容主体区域1111111
    </div>
</div>
<jsp:include page="../../common/footer.jsp"></jsp:include>
<script src="<%=request.getContextPath()%>/layui/layui.js"></script>
</body>
</html>