<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/add.css?v=<%= System.currentTimeMillis()%>"/>



</head>
<body>
    <div class="center">
        <form action="updatemeritsifo" method="post"  autocomplete="off">
            <div class="title1">绩效信息修改</div><br>

            <div calss="form-group">
                <input value="${meritsifo.id}" name="id" type="hidden">
            </div><br>

            <div calss="form-group">
                <lable>工号：</lable>
                <input class="inputs" name="eno" readonly="readonly" value="${meritsifo.eno}">
            </div><br>

            <div calss="form-group">
                <lable>姓名：</lable>
                <input class="inputs" name="ename" value="${meritsifo.ename}" readonly="readonly">
            </div><br>

            <div calss="form-group"><br>
                <lable>&nbsp;奖惩日期：</lable>
                <input type="text" class="inputs" id="date" name="date" value="${meritsifo.date}" placeholder="&nbsp;点击选择日期" style="padding-left: 5px;width:100px;height: 30px;">
            </div><br>

            <div calss="form-group">
                <lable>岗位：</lable>
                <c:if test="${meritsifo.type =='上班摸鱼'}">
                <select name="type" id="type" style="padding-bottom: 5px;">
                    <option value="上班摸鱼" selected>上班摸鱼</option>
                    <option value="表现优异">表现优异</option>
                    <option value="违反纪律">违反纪律</option>
                    <option value="顶撞上司">顶撞上司</option>
                </select>
                </c:if>
                <c:if test="${meritsifo.type =='表现优异'}">
                    <select name="type" id="type" style="padding-bottom: 5px;">
                        <option value="上班摸鱼" >上班摸鱼</option>
                        <option value="表现优异" selected>表现优异</option>
                        <option value="违反纪律">违反纪律</option>
                        <option value="顶撞上司">顶撞上司</option>
                    </select>
                </c:if>
                <c:if test="${meritsifo.type =='违反纪律'}">
                    <select name="type" id="type" style="padding-bottom: 5px;">
                        <option value="上班摸鱼">上班摸鱼</option>
                        <option value="表现优异">表现优异</option>
                        <option value="违反纪律" selected>违反纪律</option>
                        <option value="顶撞上司">顶撞上司</option>
                    </select>
                </c:if>
                <c:if test="${meritsifo.type =='顶撞上司'}">
                    <select name="type" id="type" style="padding-bottom: 5px;">
                        <option value="上班摸鱼" >上班摸鱼</option>
                        <option value="表现优异">表现优异</option>
                        <option value="违反纪律">违反纪律</option>
                        <option value="顶撞上司" selected>顶撞上司</option>
                    </select>
                </c:if>
            </div><br>

            <div calss="form-group">
                <lable>奖惩原因：</lable>
                <textarea  class="inputs" name="reason" id="reason"
                           style="width: 200px;height: 100px;white-space: pre-wrap; word-wrap: break-word; word-break: break-all;resize: none;vertical-align: top;">
                ${meritsifo.reason}
                </textarea>
            </div>
            <br><br>

            <div calss="form-group">
                <input class="button" type="submit" value="提交">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input class="button" type="button" value="返回"
                       onclick="javascript:window.location.href='findAll'">
            </div>

        </form>
    </div>



    <script src="../js/laydate/laydate.js" type="text/javascript"></script>
    <script type="text/javascript">

        // 日期框
        laydate.render({
            elem: '#date'
        });

    </script>

</body>
</html>
