<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
</head>
<body style="background:url(./images/show.jpg) 0 / cover fixed;">
    <center>
    <div  style="margin-top: 150px;">文件上传下载(上传已限制文件大小2M以内)</div><br>
    <form action="file/upload" method="post" enctype="multipart/form-data"><br>
        选择文件:<input type="file" name="file" width="120px">
        <input type="submit" value="上传">
    </form>

    <hr>
    <form action="file/down" method="get">
        <input type="submit" value="下载">
    </form>
    </center>
</body>
</html>
