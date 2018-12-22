
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Title</title>
    <link href="kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="kindeditor-4.1.10/kindeditor-all-min.js"></script>
    <script type="text/javascript" charset="utf-8" src="kindeditor-4.1.10/lang/zh_CN.js"></script>

</head>
<body>
<jsp:include page="../../common/header.jsp"></jsp:include>
<div class="dangq">当前位置：<a href="<%=request.getContextPath()%>/index.html">网站首页</a> >> <a href="/communicate.html?act=communite">交流社区</a> >><a href="">发表帖子</a></div>
<div class="main">
<form action="/communicate.html?act=add" method="post">
    <input name="title" id="title" type="text" onfocus="if(this.value=='请填写标题(*^__^*)') {this.value='';}" onblur="if(this.value=='') {this.value='请填写标题(*^__^*)';}" value="请填写标题(*^__^*)" style="width: 400px;height: 40px;">
    <textarea name="info" id="myeditor" style="width: 1100px;height: 500px;"></textarea>
    <input type="button" value="提交" onclick="addContent()" style="width: 100px;height: 40px;">
    <input type="button" value="取消" onclick="window.location.href='/communicate.html?act=communite'" style="width: 100px;height:40px;">
</form>
</div>
<jsp:include page="../../common/footer.jsp"></jsp:include>
<script>
    var kingEditorParams={
        filePostName:"file",
        uploadJson:'/communicate.html?act=upload3.html',
        dir:"image"
    }
    var editor;
    $(function () {
        editor=KindEditor.create($("#myeditor"),kingEditorParams);
    })
    function addContent(){
        editor.sync();
        $("form").submit();
    }
</script>

</body>
</html>
