<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/loading.css?v=<%= System.currentTimeMillis()%>">
    <title>加载页面</title>
    <script type="text/javascript">
        window.onload = function () {
            window.setTimeout("window.location='homepage.jsp'",1500);
        }
    </script>
</head>

<body>
<div class="container">
    <div class="trans">
        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注册成功<br/>已为您自动登录</span>
    </div>
</div>
</body>

</html>