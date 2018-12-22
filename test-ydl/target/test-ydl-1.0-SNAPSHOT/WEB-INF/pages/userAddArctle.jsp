<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/9
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css">
<link href="${pageContext.request.contextPath}/kindeditor-4.1.10/themes/default/default.css" type="text/css"
      rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script type="text/javascript">
    var kingEditorParams = {
        filePostName: "cover",//指定上传文件参数名称
        uploadJson: 'Artcle.html?act=coverUpload',//指定上传文件请求的url。
        dir: "image"//上传类型，分别为image、flash、media、file
    }
    var editor;
    $(function () {
        editor = KindEditor.create($("#editor"), kingEditorParams);
    })

    function addContent() {
        editor.sync();
        $("form").submit();
    }
</script>
<jsp:include page="/common/header.jsp"></jsp:include>
<div class="dangq">当前位置：<a href="/">网站首页</a> >> <a href="${pageContext.request.contextPath}/addArtcle.html">用户投稿</a>
</div>
<div class="main">
    <form class="layui-form" action="${pageContext.request.contextPath}/Artcle.html?act=addArtcle" method="post">
        <div class="layui-form-item" id="div1">
            <label class="layui-form-label">封面</label>
            <div class="layui-input-block">
                <input type="file"  id="fm">
                <input type="hidden" name="cover" id="cover">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-inline">
                <input type="text" name="artcleTitle" required lay-verify="required" placeholder="请输入标题"
                       autocomplete="off"
                       class="layui-input" style="width:280px;">
            </div>
            <label class="layui-form-label" style="margin-left: 30px">专题</label>
            <div class="layui-input-inline">
                <select name="labelId" lay-verify="required" style="width:280px;">
                    <option value="1">宠物新闻</option>
                    <option value="3">宠物饮食</option>
                    <option value="4">宠物健康</option>
                    <option value="5">宠物养护</option>
                    <option value="6">宠物百科</option>
                    <option value="7">宠物图库</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">内容</label>
            <div class="layui-input-block">
                <textarea style="width:800px;height:420px;visibility:hidden;" name="artcleContent"
                          id="editor"></textarea>
            </div>
        </div>
        <input type="hidden" name="artcleSource" value="用户投稿"/>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</div>
<jsp:include page="/common/footer.jsp"></jsp:include>
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
    })
    $("#fm").live("change", function () {
        var formData = new FormData();
        formData.append("cover", $("#fm")[0].files[0]);
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/Artcle.html?act=coverUpload",//url
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            data: formData,
            success: function (result) {
                var url = result.url;
                var str = "";
                str += "<div class=\"layui-form-item\">\n" + "<div class=\"layui-input-block\">";
                str += "<img src='" + result.url + "' alt=\"\" id=\"fmimg\" style=\"width:300px;height: 200px;border-radius: 10px;\" >";
                str += " </div>\n" + "</div>";
                $("#div1").after(str);
                $("#cover").val(url.substr(url.lastIndexOf("/") + 1, url.length));
            },
            error: function () {
                alert("异常！");
            }
        });
    })
</script>
</body>
</html>