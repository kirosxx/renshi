<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" type="text/css" href="../css/show.css?v=<%= System.currentTimeMillis()%>"/>

    <script  type="text/javascript">
        function deleteuser(id) {
            //删除时安全提示
            if (confirm("是否确认删除？")){
                location.href="deleteUser?id="+id
        }
        }
    </script>


</head>
<body>

    <center>
        <table border="1" class="hovertable">

            <caption class="title">信息查看</caption><br>
            <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                <th class="th2">id</th>
                <th class="th2">username</th>
                <th class="th2">password</th>
                <th class="th2">post</th>
                <th class="th1">操作</th>
            </tr>

            <c:forEach var="user" items="${users}" varStatus="s">
                <%-- 用EL访问作用域变量的成员 --%>
                <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>${user.post}</td>
                    <td><a class="button1" href="findByName?name=${user.username}">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a class="button2" href="javascript:deleteuser(&quot;${user.id}&quot;)">删除</a>
                    </td>
                </tr>
            </c:forEach>

        </table>
        <br><br>
        <a class="button1" onclick="javascript:window.location.href='../adduser.jsp'" >添加用户</a>
    </center>
</body>
</html>
