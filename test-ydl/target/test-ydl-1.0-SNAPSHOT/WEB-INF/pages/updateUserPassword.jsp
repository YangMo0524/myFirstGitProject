<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<body>
<form class="layui-form" action="/updateUserPassword.html?uid=${USER_SESSION.userId}" method="post">
    <input type="hidden" value="1" name="uid" >

    <div class="layui-form-item">
        <label class="layui-form-label">当前密码</label>
        <div class="layui-input-inline">
            <input type="password" name="oldpassword" required lay-verify="required" placeholder="请输入当前密码" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">不得少于六位</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">新密码</label>
        <div class="layui-input-inline">
            <input type="password" name="newpassword" required lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">不得少于六位</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">重复密码</label>
        <div class="layui-input-inline">
            <input type="password" name="repassword" required lay-verify="required" placeholder="重复新密码" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">不得少于六位</div>
    </div>
    ${msg}
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;
        form.render();//手动渲染form表单
        //监听提交
        form.on('submit("formDemo")', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });

</script>
</body>
</html>
