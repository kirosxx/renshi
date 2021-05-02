<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
   <link rel="stylesheet" type="text/css" href="css/login.css?v=<%= System.currentTimeMillis()%>"/>

   <title>登录页面</title>
      <%
      String username = "";
      String password = "";
      Cookie [] cookie =request.getCookies();
      if(cookie!=null){
         for(int i=0;i<cookie.length;i++){

            String name = cookie[i].getName();
   //         System.out.println("每个cookie的名字"+name);
   //         System.out.println("每个cookie的值"+cookie[i].getValue());

            if("username".equals(name)){
               username = URLDecoder.decode(cookie[i].getValue(), "utf-8");

            }else if("password".equals(name)){

               password = cookie[i].getValue();
            }

         }
      }

      %>

</head>
<body>
<div class="center" style="text-align: center;">
   <a class="title1">人事管理系统</a><br>
   <a class="title2">ADMIN LOGIN</a><br>
   <form action="user/login" method="post"><br>
   账号：<input type="text" name="username" size="15" class="inputs" value="<%= username %>"/><br><br>
   密码：<input type="password" name="password" size="15" class="inputs" value="<%= password %>"/>
    <section>
       <div style="display: inline-block;font-weight:bold;">&nbsp;记住我</div>
       <div style="display: inline-block;">
        <div class="checkbox">
            <input type="checkbox" id="checkboxInput" name="checkbox" value="selected"/>
            <label for="checkboxInput"></label>
        </div>
       </div>
    </section><br>
   <input value="注册" class="button" onclick="javascript:window.location.href='register.jsp'"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input type="submit" value="登陆" class="button"/>
   </form>

</div>
</body>
</html>


