<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" type="text/css" href="../css/show.css?v=<%= System.currentTimeMillis()%>"/>

</head>
<body>

        <table border="1" class="hovertable">

            <caption class="title">查看请假申请</caption>
            <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                <th class="th2">事件id</th>
                <th class="th2">工号</th>
                <th class="th2">姓名</th>
                <th class="th2">请假日期</th>
                <th class="th2">请假类型</th>
                <th class="th2">是否同意</th>
                <th class="th2">批复人</th>
            </tr>

            <c:forEach var="leaveappli" items="${pageInfo.list}" varStatus="s">
                <%-- 用EL访问作用域变量的成员 --%>
                <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                    <td>${leaveappli.id}</td>
                    <td>${leaveappli.eno}</td>
                    <td>${leaveappli.ename}</td>
                    <td>${leaveappli.startdate} 至 ${leaveappli.enddate}</td>
                    <td>${leaveappli.type}</td>

                    <c:if test="${leaveappli.yesorno == '待审核'}">
                    <td style="color: blue">${leaveappli.yesorno}</td>
                    </c:if>
                    <c:if test="${leaveappli.yesorno == '申请已被拒绝'}">
                        <td style="color: red">${leaveappli.yesorno}</td>
                    </c:if>
                    <c:if test="${leaveappli.yesorno == '已通过'}">
                        <td style="color: green">${leaveappli.yesorno}</td>
                    </c:if>

                    <td style="color: red;">${leaveappli.agreer}</td>
                </tr>
            </c:forEach>
        </table><br><br>

        <%-- 分页条 --%>
        <div style="margin-left: 10px;">
            <nav aria-label="Page navigation">
                <ul class="pagination" style="text-align: center;position: absolute;top: 405px;">

                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="ygFindAll?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>


                    <c:forEach begin="1" end="${pageInfo.pages}" var="i">
                        <c:if test="${pageInfo.pageNum == i}">
                            <li class="active"><a href="ygFindAll?pageNum=${i}">${i}</a></li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum != i}">
                            <li><a href="ygFindAll?pageNum=${i}">${i}</a></li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="ygFindAll?pageNum=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if><br><br>
                    <span style="font-size: 15px;color: #efefef;">
                        当前第${pageInfo.pageNum}页,总${pageInfo.pages}页,共${pageInfo.total}条记录
                    </span>
                </ul>
            </nav>
        </div>

        <%-- 日期框js --%>
        <script src="../js/laydate/laydate.js" type="text/javascript"></script>
        <script>
            laydate.render({
                elem: '#startdate'
            });
            laydate.render({
                elem: '#enddate'
            });
        </script>

</body>
</html>
