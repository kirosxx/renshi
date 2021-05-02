<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>人事管理系统</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="css/layui.css"></c:url>"/>

    <%
        PrintWriter sout=response.getWriter();
        if (request.getSession().getAttribute("loginuser") == null){
            sout.print("<script language='javascript'>alert('请先登录！'); " +
                    "window.setTimeout(\"window.location='login.jsp'\",0);</script>");
            return;
        }
    %>

</head>
<body class="layui-layout-body" style="height: 100%;overflow-y: hidden">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">©人事管理系统</div>
        <!-- 头部区域（可配合已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item">
                <a href="logo.jsp" target="my-iframe" id="show">首页</a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a onclick="javascript:window.alert('功能开发中，敬请期待~')">问题反馈</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="<c:url value="images/person.png"></c:url>" class="layui-nav-img">
                    <%--拿到用户名--%>
                    <%=request.getSession().getAttribute("uname") %>
                </a>
                <dl class="layui-nav-child">
                    <dd><a onclick="javascript:window.alert('用户级别：员工')" style="color: Green;">用户级别：员工</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a onclick="javascript:window.location.href='login.jsp'">退出系统</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">员工信息查看</a>
                    <dl class="layui-nav-child">
                        <dd><a href="employee/ygFindAll" target="my-iframe">查看员工列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">绩效信息查看</a>
                    <dl class="layui-nav-child">
                        <dd><a href="meritsifo/ygFindAll" target="my-iframe">查看绩效信息</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">请假信息查看</a>
                    <dl class="layui-nav-child">
                        <dd><a href="leaveifo/ygFindAll" target="my-iframe">查看请假申请</a></dd>
                        <dd><a href="ygleaveappli.jsp" target="my-iframe">提交请假申请</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">岗位信息查看</a>
                    <dl class="layui-nav-child">
                        <dd><a href="job/findAll" target="my-iframe">岗位列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="fileload.jsp" target="my-iframe">其他</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body" style="background: #efefef;overflow-y: hidden;">
        <!-- 内容主体区域 -->
        <iframe name="my-iframe" id="my-iframe" frameborder="0" width="1336" height=100%></iframe>
    </div>

    <div class="layui-footer" style="text-align: center;background: #efefef;">
        <!-- 底部固定区域 -->
        ©Jb人事管理系统
    </div>
</div>
<script src="js/layui.js" type="text/javascript"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });

    window.onload = function() {
        document.getElementById("show").click();
    }
</script>
</body>
</html>

