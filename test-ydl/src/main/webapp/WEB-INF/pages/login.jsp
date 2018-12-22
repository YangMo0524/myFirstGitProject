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
    <title>用户登录</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.js"></script>
    <script type="text/javascript">
        var kingEditorParams = {
            filePostName: "file",//指定上传文件参数名称
            uploadJson: 'upload.html',//指定上传文件请求的url。
            dir: "image"//上传类型，分别为image、flash、media、file
        }
        var editor;
        $(function () {
            editor = KindEditor.create($("#editor"), kingEditorParams);
        })
        function addContent(){
            editor.sync();
            $("form").submit();
        }
    </script>
</head>
<body class="layui-container"
      style=" background: url(${pageContext.request.contextPath}/static/picture/dog33.jpg) no-repeat ;background-size:2000px 1250px;">
<div class="layui-row"
     style="margin-top:6%;border-radius: 10px;background-color:rgba(252,252,252,0.4);margin-left: 340px;width:460px;height: 210px;padding-top: 60px;margin-top: 200px;">
    <div class="layui-col-xs4">
        <form class="layui-form" action="${pageContext.request.contextPath}/user.html?act=login" method="post">
            <div class="layui-form-item" style="width:100px">
                <span style="color: red;margin-left: 6px">${message}</span>
                <label class="layui-form-label">用户名:</label>
                <div class="layui-input-block">
                    <input name="userName" lay-verify="required" autocomplete="off" placeholder="请输入用户名"
                           class="layui-input"
                           type="text" value="${userName}"
                           style="width: 230px;height: 40px;border-radius: 10px;background-color:rgba(252,252,252,0.4)">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码:</label>
                <div class="layui-input-block">
                    <input name="userPassword" lay-verify="required" placeholder="请输入密码" autocomplete="off"
                           class="layui-input" type="password"
                           style="width: 230px;height: 40px;border-radius: 10px;background-color:rgba(252,252,252,0.4)">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 10px;width: 230px;margin-left: 100px">
                <button class="layui-btn" lay-submit="" lay-filter="demo2"
                        style="background-color: pink;margin-left: 15px;">登陆
                </button>
                <input type="button" value="注册" class="layui-btn" onclick="goRegister()"
                       style="margin-left: 70px;background-color:lightcyan;color: #C9C9C9">
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
    function goRegister(){
        location.href="${pageContext.request.contextPath}/register.html";
    }
</script>
</body>
</html>
