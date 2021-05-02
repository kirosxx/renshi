<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" type="text/css" href="../css/show.css?v=<%= System.currentTimeMillis()%>"/>

    <script  type="text/javascript">

    </script>
</head>
<body>
    <div style="margin-top: 30px;text-align: center">
        <a class="title1">岗位列表</a><br>
        <a class="title2">JOBLIST</a>
    </div>

    <div class="box">

        <c:forEach var="job" items="${jobs}" varStatus="s">
            <div class="jobbox">
                <div class="jobname">${job.jobname}</div><br>
                <div class="jobnum">岗位人数：${job.jobnum}</div><br>
                <div class="jobdescri">岗位描述：</div><br>
                <div class="text">
                        ${job.jobdescri}
                </div>
            </div>
        </c:forEach>

    </div>
</body>
</html>
