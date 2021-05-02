<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/add.css?v=<%= System.currentTimeMillis()%>"/>
</head>
<body style="overflow-y: hidden">
    <center style="margin-top: 50px;">
        <form action="updateUser" method="post"  autocomplete="off">
            <div class="title1">信息修改</div><br>
            <div calss="form-group">
                <lable>id：</lable>
                <input class="inputs" name="id" readonly="readonly" value="${user.id}">
            </div><br>

            <div calss="form-group">
                <lable>username：</lable>
                <input class="inputs" name="username" readonly="readonly" value="${user.username}">
            </div><br>

            <div calss="form-group">
                <lable>password：</lable>
                <input class="inputs" name="password" style="width: 80px;" value="${user.password}">
            </div><br>

            <div calss="form-group">
                <lable>岗位：</lable>
                <c:if test="${user.post =='员工'}">
                    <select name="post" id="post" style="padding-bottom: 5px;">
                        <option value="员工" selected>员工</option>
                        <option value="经理">经理</option>
                        <option value="董事">董事</option>
                    </select>
                </c:if>
                <c:if test="${user.post =='经理'}">
                    <select name="post" id="post" style="padding-bottom: 5px;">
                        <option value="员工" >员工</option>
                        <option value="经理" selected>经理</option>
                        <option value="董事">董事</option>
                    </select>
                </c:if>
                <c:if test="${user.post =='董事'}">
                    <select name="post" id="post" style="padding-bottom: 5px;">
                        <option value="员工">员工</option>
                        <option value="经理">经理</option>
                        <option value="董事" selected>董事</option>
                    </select>
                </c:if>
            </div><br>

            <div calss="form-group">
                <input class="button" type="submit" value="提交">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input class="button" type="button" value="返回"
                       onclick="javascript:window.location.href='findAllUser'">
            </div>

        </form>
    </center>
</body>
</html>
