<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<body>
<input type="file" name="file" id="file"/>
<input type="button" id="updateBtn" value="上传" onclick="upload()"/>
<div id="imgBox" style="height: auto;">
    <c:forEach items="${myImgs}" var="myImg" varStatus="vs">
            <img id="${vs.count}" src="http://localhost:8080/pet/image/${myImg}" style="width: 200px; height: 200px;" />
    </c:forEach>

</div>

<script type="text/javascript">
    function upload(){
        var formdata=new FormData( );
        if(!$("#file").val()){
            return;
        }
        formdata.append("key1","efg");
        formdata.append("file" , $("#file")[0].files[0]);//获取文件法
        $.ajax({
            url: '/upload.html?uid='+1,
            type: 'POST',
            data: formdata,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if(result==null){
                    alert("上传失败");
                    return;
                }
                //alert(result.url);
                //alert(result.imgCount);
                var num=result.imgCount;
                //$("img").after('<img id="'+(result.imgCount+1)+'" src="http://localhost:8080/pet/image/'+result.url+'" style="width: 200px; height: 200px;" />');
                //$("img[num]").after('<img id="'+(result.imgCount+1)+'" src="http://localhost:8080/pet/image/'+result.url+'" style="width: 200px; height: 200px;" />');
                //$("#"+num).appendTo('<img id="\'+(result.imgCount+1)+\'" src="http://localhost:8080/pet/image/\'+result.url+\'" style="width: 200px; height: 200px;" />');
                $("#imgBox").append('<img id="'+(result.imgCount+1)+'" src="http://localhost:8080/pet/image/'+result.url+'" style="width: 200px; height: 200px;" />');

            }
        });
    }
</script>
</body>
</html>
