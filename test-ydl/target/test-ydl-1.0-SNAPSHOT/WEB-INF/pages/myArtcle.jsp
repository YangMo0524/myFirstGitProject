<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE HTML>
<html>

<body>
<table id="artcle" lay-filter="artcle-table"></table>
<script type="text/html" id="article-row-bar">
    <a class="layui-btn layui-btn-xs" lay-event="edit-article">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del-article">删除</a>
</script>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            id:"artcle",
            elem: '#artcle'
            ,url: '<%=request.getContextPath()%>/myArtcle.html?uid=${USER_SESSION.userId}' //数据接口
            ,page: {
                layout:['prev','page','next','count','skip','limit']
                ,groups:5
                ,first:true
                ,last:true
                ,limits:[5,10,15,20,25,30]
                ,limit:5
            } //开启分页
            ,cols: [[ //表头
                {field: 'artcleTitle', title: '文章标题'}
                ,{field: 'artcleReleaseDate', title: '文章发布时间',cellMinWidth: 100}
                ,{field: 'artcleReadNum', title: '点击量',sort:true}
                ,{
                    field: 'review', title: '审核状态', templet:function (data) {
                        return (data.review==-1)?'<span class="layui-badge layui-bg-red">未通过</span>':(data.review==0)?'<span class="layui-badge layui-bg-red">审核中</span>':'<span class="layui-badge layui-bg-red">审核通过</span>'
                    }
                }
                ,{field:'right',title:'操作',toolbar:'#article-row-bar'}
            ]]
        });

        //监听事件
        table.on('tool(artcle-table)',function (obj) {
            var data=obj.data;
            switch(obj.event){
                case 'edit-article':{
                    layui.use('form',function(){
                        openEditWindow();
                        var form=layui.form;
                        form.val("article-edit-form",{
                            "artcleId":data.artcleId,
                            "artcleTitle":data.artcleTitle,
                            "artcleContent":data.artcleContent
                        });
                    });
                    break;
                }

                case 'del-article':{
                    layer.confirm("是否删除该文章",function (index) {
                        $.ajax({
                            url:'delMyArtcle.html'
                            ,data:"artcleId="+data.artcleId
                            ,menthod:'post'
                            ,success:function (result) {
                                if(result){
                                    table.reload('artcle',{});
                                    obj.update({
                                        status:0
                                    })
                                }else{
                                    layer.open({
                                        type:1,
                                        area:['160px','140px'],
                                        content:"删除失败"
                                    })
                                }
                                layer.close(index);
                            }
                        })
                    })
                    break;
                }
            }
        });

       /* layui.use('form',function () {
            var from=layui.form;
            from.render();
            from.on('')
        })*/
        function openEditWindow() {
            layer.open({
                type:1,
                offset:'50px',
                content:$('#article-edit-layer').html(),
                title:'编辑',
                area:['700px','720px'],
                btn:['提交','修改'],
                yes:function (index,layero) {
                    $.ajax({
                        url:'updateMyArtcle.html',
                        data:$("#article-edit-form").serialize(),
                        method:'post',
                        success:function (result) {
                            if (result){
                                table.reload('artcle',{});
                                layer.close(index);
                            }else{
                                layer.open({
                                    type:1,
                                    area:['160px','140px'],
                                    content:"修改失败"
                                })
                            }
                        }
                    })
                }
            })
        }
    });

</script>
<script type="text/html" id="article-edit-layer">
    <form id="article-edit-form" style="width: 80%" class="layui-form" lay-filter="article-edit-form">
        <input type="hidden" name="artcleId" id="artcleId" required lay-verify="required" autocomplete="off">

        <div class="layui-form-item">
            <label class="layui-form-label">文章题目</label>
            <div class="layui-input-block">
                <input type="text" name="artcleTitle" required lay-verify="required" placeholder="请输入文章题目" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">文章内容</label>
            <div class="layui-input-block">
                <textarea style="width:500px;height:480px;" name="artcleContent" required lay-verify="required"
                          autocomplete="off" id="articleContent"></textarea>
            </div>
        </div>
    </form>
</script>

<!--时间格式化-->

<script id="createTime" type="textml">
    {{#
    var date = new Date();
    date.setTime(d.articleReleaseDate);
    return date.Format("yyyy年MM月dd日 hh:mm:ss");
    }}
</script>
</body>
</html>
