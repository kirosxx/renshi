<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/loading.css?v=<%= System.currentTimeMillis()%>">
    <title>加载页面</title>

    <script type="text/javascript">
        window.onload = function () {
            window.setTimeout("window.location='findAll'",1000);
        }
    </script>

</head>

<body>
<div class="container">
    <div class="trans">
        <span>&nbsp;&nbsp;&nbsp;操作成功<br/>正在返回列表...</span>
    </div>
</div>
</body>

</html>