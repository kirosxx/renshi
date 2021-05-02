<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/index.css?v=<%= System.currentTimeMillis()%>"/>

</head>
<body style="background:url(images/show.jpg) 0 / cover fixed;">

    <div style="text-align: center"><br><br>
        <a class="title2">ADMIN LOGIN</a><br><br>
        <botton class="button" style="vertical-align:middle" onclick="javascript:window.location.href='user/findAllUser'">
            <span>进入权限管理</span>
        </botton>
    </div>
</body>
</html>
