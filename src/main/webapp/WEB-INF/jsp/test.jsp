<%--
  Created by IntelliJ IDEA.
  User: 26096
  Date: 2017/8/12
  Time: 23:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>上传图片</title>
</head>
<body>
<form action="upload.do" method="post" enctype="multipart/form-data">
    <input id="file" type="file" name="file" /> <input type="submit" value="Submit" />
    <img id="fileXS" src="">
</form>
</body>
</html>
<script type="text/javascript">
    function upload(){
        $("#file").click();
    }
    function preview(){

        var img = document.getElementById('fileXS');
        img.width  =  155;
        img.height =  155;
        var reader = new FileReader();
        reader.onload = function(evt){img.src = evt.target.result;}
        reader.readAsDataURL(file.files[0]);
    }
</script>
