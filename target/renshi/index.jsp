<%@ page import="java.time.LocalDateTime" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>


    <link rel="stylesheet" type="text/css" href="css/index.css?v=<%= System.currentTimeMillis()%>"/>


  </head>
  <body>
    <div class="center" style="text-align: center;">
       欢迎来到人事管理系统<br><br>
      <botton class="button" style="vertical-align:middle" onclick="javascript:window.location.href='login.jsp'">
        <span>点击进入系统 </span>
      </botton><br><br>
      <%
        LocalDateTime today  = LocalDateTime.now();
      %>
        访问时间：<%=today%>
    </div>
  </body>
</html>
