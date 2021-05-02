<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" type="text/css" href="../css/show.css?v=<%= System.currentTimeMillis()%>"/>

    <script  type="text/javascript">
        function deletemeritsifo(id) {
            //删除时安全提示
            if (confirm("是否确认删除？")){
                location.href="deletemeritsifo?id="+id
            }
        }
    </script>
</head>
<body>

        <form action="findByCondition" method="post"  autocomplete="off">
            <a style="margin-left:100px;font-size: 18px;">精确查询:</a>
            <a style="margin-left:20px;font-size: 15px;color: #009688;">
                工号:
            </a>
            <input type="text" id="eno" name="eno" value="${ConditionEno}" size="15" class="inputs" style="width:80px;height: 30px;"/>
            <a style="margin-left:5px;font-size: 15px;color: #009688;">日期:</a>
            <input type="text" class="inputs" id="date" name="date" value="${ConditionDate}" placeholder="&nbsp;点击选择日期" style="padding-left: 5px;width:100px;height: 30px;">
            <input type="submit" value="查询" class="button4"/>
        </form>


        <table border="1" class="hovertable">

            <caption class="title">员工绩效查看</caption>
            <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                <th class="th2">事件id</th>
                <th class="th2">工号</th>
                <th class="th2">姓名</th>
                <th class="th2">奖惩日期</th>
                <th class="th2">奖惩类型</th>
                <th class="th2">奖惩原因</th>
                <th class="th1">操作</th>
            </tr>

            <c:forEach var="meritsifo" items="${pageInfo.list}" varStatus="s">
                <%-- 用EL访问作用域变量的成员 --%>
                <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                    <td>${meritsifo.id}</td>
                    <td>${meritsifo.eno}</td>
                    <td>${meritsifo.ename}</td>
                    <td>${meritsifo.date}</td>
                    <td>${meritsifo.type}</td>
                    <td>${meritsifo.reason}</td>
                    <td><a class="button1" href="findById?id=${meritsifo.id}">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a class="button2" href="javascript:deletemeritsifo(&quot;${meritsifo.id}&quot;)">删除</a></td>
                </tr>
            </c:forEach>
        </table><br><br>

        <%-- 分页条 --%>
        <div style="margin-left: 10px;">
            <nav aria-label="Page navigation">
                <ul class="pagination" style="text-align: center;position: absolute;top: 405px;">

                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="findAll?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>


                    <c:forEach begin="1" end="${pageInfo.pages}" var="i">
                        <c:if test="${pageInfo.pageNum == i}">
                            <li class="active"><a href="findAll?pageNum=${i}">${i}</a></li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum != i}">
                            <li><a href="findAll?pageNum=${i}">${i}</a></li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="findAll?pageNum=${pageInfo.pageNum+1}" aria-label="Next">
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
                elem: '#date'
            });

        </script>

</body>
</html>
