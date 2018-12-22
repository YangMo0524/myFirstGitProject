<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<body>
<input type="file" name="file" id="file"/>
<input type="button" id="updateBtn" value="上传" onclick="upload()"/>

<script type="text/javascript">
    function upload(){
        var formdata=new FormData( );
        if(!$("#file").val()){
            return;
        }
        formdata.append("key1","efg");
        formdata.append("file" , $("#file")[0].files[0]);//获取文件法
        $.ajax({
            url: '/updateUserImg.html?uid='+${USER_SESSION.userId},
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

                alert("修改成功");
            }
        });
    }
</script>
</body>
</html>
