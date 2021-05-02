<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/add.css?v=<%= System.currentTimeMillis()%>"/>
</head>
<body>
    <div class="center">
        <form action="updateemployee" method="post"  autocomplete="off">
            <div class="title1">员工信息修改</div><br>
            <div calss="form-group">
                <lable>工号：</lable>
                <input class="inputs" name="eno" readonly="readonly" value="${employee.eno}">
            </div><br>

            <div calss="form-group">
                <lable>姓名：</lable>
                <input class="inputs" name="ename" value="${employee.ename}">
            </div><br>

            <div calss="form-group">
                <c:if test="${employee.sex =='男'}">
                <lable>性别：</lable>
                <input type="radio" name="sex" value="男" checked="checked"/>男
                <input type="radio" name="sex" value="女"/>女&nbsp;&nbsp;&nbsp;&nbsp;
                </c:if>
                <c:if test="${employee.sex =='女'}">
                    <lable>性别：</lable>
                    <input type="radio" name="sex" value="男"/>男
                    <input type="radio" name="sex" value="女" checked="checked"/>女&nbsp;&nbsp;&nbsp;&nbsp;
                </c:if>
                <lable>工龄：</lable>
                <input class="inputs" name="wyear" style="width: 60px;" value="${employee.wyear}"> 年
            </div><br>

            <div calss="form-group">
                <lable>工资：</lable>
                <input class="inputs" name="wages" style="width: 80px;" value="${employee.wages}"> 元/月
            </div><br>

            <div calss="form-group">
                <lable>岗位：</lable>
                <c:if test="${employee.job =='程序员'}">
                <select name="job" id="job" style="padding-bottom: 5px;">
                    <option value="程序员" selected>程序员</option>
                    <option value="保安">保安</option>
                    <option value="前台">前台</option>
                    <option value="产品经理">产品经理</option>
                </select>
                </c:if>
                <c:if test="${employee.job =='保安'}">
                    <select name="job" id="job" style="padding-bottom: 5px;">
                        <option value="程序员">程序员</option>
                        <option value="保安" selected>保安</option>
                        <option value="前台">前台</option>
                        <option value="产品经理">产品经理</option>
                    </select>
                </c:if>
                <c:if test="${employee.job =='前台'}">
                    <select name="job" id="job" style="padding-bottom: 5px;">
                        <option value="程序员" >程序员</option>
                        <option value="保安">保安</option>
                        <option value="前台" selected>前台</option>
                        <option value="产品经理">产品经理</option>
                    </select>
                </c:if>
                <c:if test="${employee.job =='产品经理'}">
                    <select name="job" id="job" style="padding-bottom: 5px;">
                        <option value="程序员" >程序员</option>
                        <option value="保安">保安</option>
                        <option value="前台">前台</option>
                        <option value="产品经理" selected>产品经理</option>
                    </select>
                </c:if>
            </div><br>

            <div calss="form-group">
                <lable>绩效：</lable>
                <input class="inputs" name="merits" value="${employee.merits}">
            </div><br><br>

            <div calss="form-group">
                <input class="button" type="submit" value="提交">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input class="button" type="button" value="返回"
                       onclick="javascript:window.location.href='findAll'">
            </div>

        </form>
    </div>
</body>
</html>
