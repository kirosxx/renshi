<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/register.css?v=<%= System.currentTimeMillis()%>"/>

    <title>注册</title>

    <script src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        function checkUsername() {
            var username = $("#username").val();
            var reg_username = /^\w{4,20}$/;
            var flag = reg_username.test(username);
            if (flag) {
                $.post("${pageContext.request.contextPath}/user/ishava", {
                    "username" : username
                }, function(data) {

                    if(data.indexOf("不") == -1){
                        $("#nameDiv1").html("");  //清空有可能存在的div
                        $("#nameDiv2").html(data);
                        $("#username").css("border", "1px solid green")
                    }else{
                        $("#nameDiv2").html("");  //清空有可能存在的div
                        $("#nameDiv1").html(data);
                        $("#username").css("border", "1px solid red")
                    }
                }, "text");
            } else {
                $("#nameDiv2").html("");  //清空有可能存在的div
                $("#nameDiv1").html("请输入4-20位用户名");
                $("#username").css("border", "1px solid red")
            }

            return flag;
        }
        function checkPassword() {
            var password = $("#password").val();
            var reg_password = /^\w{4,20}$/;
            var flag = reg_password.test(password);
            if (flag) {
                $("#password").css("border", "1px solid green")
                $("#pswDiv1").html("");
            } else {
                $("#password").css("border", "1px solid red")
                $("#pswDiv1").html("请输入4-20位密码");
            }
            return flag;
        }
        function checkPassword1() {
            var password = $("#password").val();
            var password1 = $("#password1").val();
            var flag = password==password1;
            if (flag) {
                $("#password1").css("border", "1px solid green")
                $("#pswDiv3").html("");
            } else {
                $("#password1").css("border", "1px solid red")
                $("#pswDiv3").html("两次输入密码不一致！");
            }
            return flag;
        }
        $(function () {
            $("#registerForm").submit(function () {
                if (checkUsername() && checkPassword() && checkPassword1()) {
                    $.post("RegisterServlet", $(this).serialize(), function (data) {
                        $("#reg").show();
                    });
                }
                return false;
            })
            $("#username").blur(checkUsername);
            $("#password").blur(checkPassword);
            $("#password1").blur(checkPassword1);
        })


        // 切换验证码
        function refreshCode() {
          var vcode = document.getElementById("vcode");
          vcode.src = "${pageContext.request.contextPath}/checkCodeServlet?time="+new Date().getTime();
        }

    </script>

</head>
<body>
    <div class="center" style="text-align: center;">
        <a class="title1">人事管理系统</a><br>
        <a class="title2">ADMIN REGISTER</a><br><br>
        <form action="user/register" method="post">
        <c:catch var = "myexception">

        用户名：&nbsp;&nbsp;&nbsp;
            <input  type="text" name="username" id="username" class="inputs" />
            <span id="nameDiv1" style="color: red; font-size: 13px;position:absolute;margin-top: 5px;"></span>
            <span id="nameDiv2" style="color: green; font-size: 13px;position:absolute;margin-top: 5px;"></span>
            <br><br>
        密&nbsp;&nbsp;&nbsp;码：&nbsp;&nbsp;&nbsp;
            <input  type="password" name="password" id="password" class="inputs"/>
            <span id="pswDiv1" style="color: red; font-size: 13px;position:absolute;margin-top: 5px;"></span>
            <span id="pswDiv2" style="color: green; font-size: 13px;position:absolute;margin-top: 5px;"></span>
            <br><br>
        确认密码：<input type="password" name="password1" id="password1" class="inputs"/>
            <span id="pswDiv3" style="color: red; font-size: 13px;position:absolute;margin-top: 5px;"></span>
            <span id="pswDiv4" style="color: green; font-size: 13px;position:absolute;margin-top: 5px;"></span>
            <br><br>
        <div style="display: inline-block">
            验证码：<input  type="text" name="inputcode" class="check"/><br><br>
        </div>
        &nbsp;&nbsp;
        <div style="display: inline-block"><a href="javascript:refreshCode();">
        <img src="${pageContext.request.contextPath}/checkCodeServlet" id="vcode"/></a><br><br>
        </div><br><br>

        <input value="去登录" class="button" onclick="javascript:window.location.href='login.jsp'"/>&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" class="button"  value="确认注册"><br>
        </c:catch>
        <c:out value="${myexception.message}" />

        </form>
    </div>

</body>
</html>
