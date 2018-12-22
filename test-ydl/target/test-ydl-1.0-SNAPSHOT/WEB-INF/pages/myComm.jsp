<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>

<body>
<table id="comm-table"  lay-filter="comm-table" class="layui-table"></table>
<script type="text/html" id="comm-row-bar">
    <a class="layui-btn layui-btn-xs" lay-event="edit-comm">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del-comm">删除</a>
</script>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            id:"comm-table",
            elem: '#comm-table'
            ,url: '<%=request.getContextPath()%>/myComm.html?uid=${USER_SESSION.userId}' //数据接口
            ,page: {
                layout:['prev','page','next','count','skip','limit']
                ,groups:5
                ,first:true
                ,last:true
                ,limits:[5,10,15,20,25,30]
                ,limit:5
            } //开启分页
            ,cols: [[ //表头
                {field: 'title', title: '帖子标题'}
                ,{field: 'replyCount', title: '回复数',sort:true}
                ,{field: 'seeCount', title: '点击量',sort:true}
                ,{field: 'createDate', title: '发布时间'}
                ,{field: 'lastDate', title: '最新回复时间'}
                ,{field:'right',title:'操作',toolbar:'#comm-row-bar'}
            ]]
        });

        //监听事件
        table.on('tool(comm-table)',function (obj) {
            var data=obj.data;
            switch(obj.event){
                case 'edit-comm':{
                    layui.use('form',function(){
                        openEditWindow();
                        var form=layui.form;
                        form.val("comm-edit-form",{
                            "id":data.id,
                            "title":data.title,
                            "info":data.info
                        });
                    });
                    break;
                }

                case 'del-comm':{
                    layer.confirm("是否删除该文章",function (index) {
                        $.ajax({
                            url:'delMyComm.html?'
                            ,data:"commId="+data.id
                            ,method:'post'
                            ,success:function (result) {
                                if(result){
                                    table.reload("comm-table",{});
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

         /*layui.use('form',function () {
             var from=layui.form;
             from.render();
             from.on('submit()')
         })*/


    function openEditWindow() {
        layer.open({
            type:1,
            offset:'50px',
            content:$('#comm-edit-layer').html(),
            title:'编辑',
            area:['700px','720px'],
            btn:['提交','取消'],
            yes:function (index,layero) {
                //alert(index);
                $.ajax({
                    url:'/updateMyComm.html',
                    data:$("#comm-edit-form").serialize(),
                    method:'post',
                    success:function (result) {
                        if (result){
                            table.reload('comm-table', {});
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
<script type="text/html" id="comm-edit-layer">
    <form id="comm-edit-form" style="width: 80%" class="layui-form" lay-filter="comm-edit-form">
        <input type="hidden" name="id" id="commId" required lay-verify="required" autocomplete="off">

        <div class="layui-form-item">
            <label class="layui-form-label">帖子题目</label>
            <div class="layui-input-block">
                <input type="text" name="title" required lay-verify="required" placeholder="请输入帖子题目" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">帖子内容</label>
            <div class="layui-input-block">
                <textarea style="width:500px;height:480px;" name="info" required lay-verify="required"
                          autocomplete="off" id="commContent"></textarea>
            </div>
        </div>
    </form>
</script>
</body>
</html>
