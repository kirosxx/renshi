<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/add.css?v=<%= System.currentTimeMillis()%>"/>


</head>

<body style="overflow-y: hidden">
    <div class="center">
        <form action="updateleaveifo" method="post"  autocomplete="off">
            <div calss="form-group">
                <input value="${leaveifo.id}" name="id" type="hidden">
            </div><br>

            <div class="title1">绩效信息修改</div><br>
            <div calss="form-group" style="margin-left: 30px;">
                <lable>工号：</lable>
                <input class="inputs" name="eno" id="eno" value="${leaveifo.eno}" style="width: 100px;" readonly="readonly">
            </div><br>

            <div calss="form-group" style="margin-left: 30px;">
                <lable>姓名：</lable>
                <input class="inputs" name="ename" id="ename" value="${leaveifo.ename}" style="width: 100px;"  readonly="readonly">
            </div>

            <div calss="form-group"><br>
                <lable>&nbsp;请假日期：</lable>
                <input type="text" class="inputs" id="startdate" name="startdate" value="${leaveifo.startdate}" placeholder="&nbsp;点击选择日期" style="padding-left: 5px;width:100px;height: 30px;">
            </div>
            <div calss="form-group" style="margin-left: 55px;"><br>
                <lable>至&nbsp;&nbsp;</lable>
                <input type="text" class="inputs" id="enddate" name="enddate"  value="${leaveifo.enddate}" placeholder="&nbsp;点击选择日期" style="padding-left: 5px;width:100px;height: 30px;">
            </div><br>

            <div calss="form-group" style="margin-left: 10px;">
                <lable>请假类型：</lable>
                <c:if test="${leaveifo.type =='病假'}">
                    <select name="type" id="type" style="padding-bottom: 5px;">
                        <option value="病假" selected>病假</option>
                        <option value="事假">事假</option>
                        <option value="产假">产假</option>
                        <option value="其他特殊情况">其他特殊情况</option>
                    </select>
                </c:if>
                <c:if test="${leaveifo.type =='事假'}">
                    <select name="type" id="type" style="padding-bottom: 5px;">
                        <option value="病假" >病假</option>
                        <option value="事假" selected>事假</option>
                        <option value="产假" >产假</option>
                        <option value="其他特殊情况">其他特殊情况</option>
                    </select>
                </c:if>
                <c:if test="${leaveifo.type =='产假'}">
                    <select name="type" id="type" style="padding-bottom: 5px;">
                        <option value="病假" >病假</option>
                        <option value="事假">事假</option>
                        <option value="产假" selected>产假</option>
                        <option value="其他特殊情况">其他特殊情况</option>
                    </select>
                </c:if>
                <c:if test="${leaveifo.type =='其他特殊情况'}">
                    <select name="type" id="type" style="padding-bottom: 5px;">
                        <option value="病假" >病假</option>
                        <option value="事假">事假</option>
                        <option value="产假">产假</option>
                        <option value="其他特殊情况" selected>其他特殊情况</option>
                    </select>
                </c:if>
            </div>
            <br>

            <div calss="form-group" style="margin-left: 20px;">
                <lable>批复人：</lable>
                <input class="inputs" name="agreer" id="agreer" value="${leaveifo.agreer}" style="width: 100px;">
            </div>
            <br><br>

            <div calss="form-group">
                <input class="button" type="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input class="button" type="button" value="返回"
                       onclick="javascript:window.location.href='findAll'">
            </div>

        </form>
    </div>



    <script src="js/jquery-3.4.1.js"></script>
    <script src="../js/laydate/laydate.js" type="text/javascript"></script>
    <script type="text/javascript">

        // 日期框
        laydate.render({
            elem: '#startdate'
        });
        laydate.render({
            elem: '#enddate'
        });
    </script>

</body>
</html>
