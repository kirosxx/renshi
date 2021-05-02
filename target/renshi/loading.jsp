<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/loading.css?v=<%= System.currentTimeMillis()%>">
    <title>加载页面</title>

    <script type="text/javascript">
        window.onload = function () {
                window.setTimeout("window.location='homepage.jsp'",1000);
        }
    </script>


</head>

<body>
<div class="container">
    <div class="trans">
        <span>&nbsp;&nbsp;登录成功<br/>系统加载中...</span>
    </div>
</div>
</body>

</html>