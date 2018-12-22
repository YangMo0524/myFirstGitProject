<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/5
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.js"></script>
</head>
<body class="layui-container"
      style="background: url(${pageContext.request.contextPath}/static/picture/dog222.jpg) no-repeat;background-size:2000px 1250px;">
<div style="margin-top:6%;border-radius: 10px;background-color:rgba(252,252,252,0.4);margin-left: 300px;width:40%;height: 400px;padding-top: 20px;margin-top: 100px;">
    <span id="span1" style="color:red;"></span>
    <div class="layui-col-xs4">
        <form class="layui-form" action="${pageContext.request.contextPath}/user.html?act=register" method="post">
            <div class="layui-form-item" style="margin-left: 130px;margin-top: 30px;">
                <div class="layui-input-inline">
                    <img src="" id="icon" alt="您的头像为空~记得上传~" style="width: 100px;height: 100px;border-radius: 10px;">
                    <input type="file" id="upload">
                    <input type="hidden" value="" id="iconname" name="userIcon">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 10px">
                <label class="layui-form-label">用户名:</label>
                <div class="layui-input-block">
                    <input name="userName" lay-verify="required" autocomplete="off" placeholder="请输入用户名"
                           class="layui-input"
                           type="text" value="${adminEmail}"
                           onblur="findUserName(this)"
                           style="width: 230px;height: 40px;border-radius: 10px;background-color:rgba(252,252,252,0.4)">
                </div>
            </div>

            <div class="layui-form-item" style="margin-left: 10px">
                <label class="layui-form-label">密码:</label>
                <div class="layui-input-block">
                    <input name="userPassword" lay-verify="required" placeholder="请输入密码" autocomplete="off"
                           class="layui-input" type="password"
                           style="width: 230px;height: 40px;border-radius: 10px;background-color:rgba(252,252,252,0.4)">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 10px;width: 230px;margin-left: 100px">
                <button class="layui-btn" lay-submit="" lay-filter="demo2"
                        style="background-color: pink;margin-left: 20px">注册
                </button>
                <input type="button" value="返回" class="layui-btn" onclick="gologin()"
                       style="margin-left: 70px;background-color: #C9C9C9">
            </div>
        </form>
    </div>
</div>

<script src="<%=request.getContextPath()%>/layui/layui.js"></script>
<script>
    layui.config({
        base: '/layui/' //静态资源所在路径
    }).extend({
        index: '/lib/index' //主入口模块
    }).use('index');
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
    });
    layui.use('form', function () {
        var form = layui.form;
        form.render();
    });
    $("#upload").live("change", function () {
        var formData = new FormData();
        formData.append("icon", $("#upload")[0].files[0]);
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/user.html?act=iconUpload",//url
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            data: formData,
            success: function (result) {
                var url = result.url;
                $("#icon").attr("src", result.url);
                $("#iconname").val(url.substr(url.lastIndexOf("/") + 1, url.length));
            },
            error: function () {
                alert("异常！");
            }
        });
    })

    function gologin() {
        location.href = "${pageContext.request.contextPath}/login.html";
    }

    function findUserName(userName) {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/user.html?act=ajaxGetUserByUsername",//url
            data: {"userName": userName.value},
            success: function (result) {
                if (result != null) {
                    $("#span1").html("用户名已存在");
                }
            },
        });
    }
</script>
</body>
</html>
