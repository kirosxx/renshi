<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" type="text/css" href="../css/show.css?v=<%= System.currentTimeMillis()%>"/>

    <script  type="text/javascript">
        function deleteemployee(eno) {
            //删除时安全提示
            if (confirm("是否确认删除？")){
                location.href="deleteEmployee?eno="+eno
        }
        }
    </script>


</head>
<body style="overflow-y: hidden">

        <form action="ygFindByCondition" method="post"  autocomplete="off">
            <a style="margin-left:100px;font-size: 18px;">模糊查询:</a>
            <a style="margin-left:20px;font-size: 15px;color: #009688;">
                姓名:
            </a>
            <input type="text" id="ename" name="ename" value="${ConditionEname}" size="15" class="inputs" style="width:80px;height: 30px;"/>
            <a style="margin-left:5px;font-size: 15px;color: #009688;">岗位:</a>
            <c:if test="${ConditionJob =='' || ConditionJob == null}">
                <select name="job" id="job" style="padding-bottom: 5px;">
                    <option value="" selected>所有岗位</option>
                    <option value="程序员">程序员</option>
                    <option value="保安">保安</option>
                    <option value="前台">前台</option>
                    <option value="产品经理">产品经理</option>
                </select>
            </c:if>
            <c:if test="${ConditionJob =='程序员'}">
                <select name="job" id="job" style="padding-bottom: 5px;">
                    <option value="">所有岗位</option>
                    <option value="程序员" selected>程序员</option>
                    <option value="保安">保安</option>
                    <option value="前台">前台</option>
                    <option value="产品经理">产品经理</option>
                </select>
            </c:if>
            <c:if test="${ConditionJob =='保安'}">
                <select name="job" id="job" style="padding-bottom: 5px;">
                    <option value="">所有岗位</option>
                    <option value="程序员">程序员</option>
                    <option value="保安" selected>保安</option>
                    <option value="前台">前台</option>
                    <option value="产品经理">产品经理</option>
                </select>
            </c:if>
            <c:if test="${ConditionJob =='前台'}">
                <select name="job" id="job" style="padding-bottom: 5px;">
                    <option value="">所有岗位</option>
                    <option value="程序员" >程序员</option>
                    <option value="保安">保安</option>
                    <option value="前台" selected>前台</option>
                    <option value="产品经理">产品经理</option>
                </select>
            </c:if>
            <c:if test="${ConditionJob =='产品经理'}">
                <select name="job" id="job" style="padding-bottom: 5px;">
                    <option value="">所有岗位</option>
                    <option value="程序员" >程序员</option>
                    <option value="保安">保安</option>
                    <option value="前台">前台</option>
                    <option value="产品经理" selected>产品经理</option>
                </select>
            </c:if>
            <input type="submit" value="查询" class="button4"/>
        </form>


        <table border="1" class="hovertable">

            <caption class="title">员工信息查看</caption>
            <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                <th class="th2">工号</th>
                <th class="th2">姓名</th>
                <th class="th2">性别</th>
                <th class="th2">工龄</th>
                <th class="th2">工资</th>
                <th class="th2">职务</th>
                <th class="th2">绩效</th>
                <th class="th1">操作</th>
            </tr>

            <c:forEach var="employee" items="${pageInfo.list}" varStatus="s">
                <%-- 用EL访问作用域变量的成员 --%>
                <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                    <td>${employee.eno}</td>
                    <td>${employee.ename}</td>
                    <td>${employee.sex}</td>
                    <td>${employee.wyear}</td>
                    <td>${employee.wages}</td>
                    <td>${employee.job}</td>
                    <td>${employee.merits}</td>
                    <td style="color:red;">&nbsp;没有操作权限&nbsp;
                    </td>
                </tr>
            </c:forEach>
        </table>

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


</body>
</html>
