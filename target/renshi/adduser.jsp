<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/add.css?v=<%= System.currentTimeMillis()%>"/>
</head>
<body style="overflow-y: hidden">
    <center style="margin-top: 50px;">
        <form action="user/addUser" method="post"  autocomplete="off">
            <div class="title1">添加用户</div><br>

            <div calss="form-group">
                <lable>username：</lable>
                <input class="inputs" name="username">
            </div><br>

            <div calss="form-group">
                <lable>password：</lable>
                <input class="inputs" name="password" style="width: 80px;" >
            </div><br>

            <div calss="form-group">
                <lable>post：</lable>
                    <select name="post" id="post" style="padding-bottom: 5px;">
                        <option value="员工">员工</option>
                        <option value="经理">经理</option>
                        <option value="董事">董事</option>
                    </select>
            </div><br>

            <div calss="form-group">
                <input class="button" type="submit" value="添加">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input class="button" type="button" value="返回"
                       onclick="javascript:window.location.href='user/findAllUser'">
            </div>

        </form>
    </center>
</body>
</html>
