<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/add.css?v=<%= System.currentTimeMillis()%>"/>
</head>
<body>
    <center style="margin-top: 50px;">
        <form action="updateJob" method="post"  autocomplete="off">
            <div class="title1">信息修改</div><br>
            <div calss="form-group">
                <lable>岗位名称：</lable>
                <input class="inputs" name="jobname" readonly="readonly" value="${job.jobname}">
            </div><br>

            <div calss="form-group">
                <lable>岗位人数：</lable>
                <input class="inputs" name="jobnum" style="width: 80px;" value="${job.jobnum}">
            </div><br>

            <div calss="form-group">
                <lable>岗位描述：</lable>
                <textarea  class="inputs" name="jobdescri" id="jobdescri"
                           style="width: 200px;height: 100px;white-space: pre-wrap; word-wrap: break-word; word-break: break-all;resize: none;vertical-align: top;">${job.jobdescri}
                </textarea>
            </div><br>

            <div calss="form-group">
                <input class="button" type="submit" value="提交">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input class="button" type="button" value="返回"
                       onclick="javascript:window.location.href='dsFindAll'">
            </div>

        </form>
    </center>
</body>
</html>
