<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/add.css?v=<%= System.currentTimeMillis()%>"/>

    <script src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        function isAlreadyHave() {
            $(document).ready(function () {

                var eno = $("#eno").val();

                if (eno == null || eno == "") {
                    $("#enoDiv2").html("");  //清空有可能存在的div
                    $("#enoDiv1").html("工号不能为空");
                    $("#eno").css("border", "1px solid red")
                } else {
                    $.post("${pageContext.request.contextPath}/employee/ishava", {
                        "eno": eno
                    }, function (data) {

                        if (data.indexOf("不") == -1) {
                            $("#enoDiv1").html("");  //清空有可能存在的div
                            $("#enoDiv2").html(data);
                            $("#eno").css("border", "1px solid green")
                        } else {
                            $("#enoDiv2").html("");  //清空有可能存在的div
                            $("#enoDiv1").html(data);
                            $("#eno").css("border", "1px solid red")
                        }
                    }, "text");

                }

            });

        }
    </script>

</head>

<body style="overflow-y: hidden">
<div class="center">
    <form  action="employee/addEmployee" method="post"  autocomplete="off">
        <div class="title1">员工信息录入</div>
        <br>
        <div calss="form-group">
            <lable>工号：</lable>
            <input class="inputs" name="eno" id="eno" onblur="isAlreadyHave()">
            <span id="enoDiv1" style="color: red; font-size: 13px;position:absolute;margin-top: 5px;"></span>
            <span id="enoDiv2" style="color: green; font-size: 13px;position:absolute;margin-top: 5px;"></span>
        </div>
        <br>

        <div calss="form-group">
            <lable>姓名：</lable>
            <input class="inputs" name="ename">
        </div>
        <br>

        <div calss="form-group">
            <lable>性别：</lable>
            <input type="radio" name="sex" value="男" checked="checked"/>男
            <input type="radio" name="sex" value="女"/>女&nbsp;&nbsp;&nbsp;&nbsp;
            <lable>工龄：</lable>
            <input class="inputs" name="wyear" style="width: 60px;"> 年
        </div>
        <br>

        <div calss="form-group">
            <lable>工资：</lable>
            <input class="inputs" name="wages" style="width: 80px;"> 元/月
        </div>
        <br>

        <div calss="form-group">
            <lable>岗位：</lable>
            <select name="job" id="job" style="padding-bottom: 5px;">
                <option value="程序员">程序员</option>
                <option value="保安">保安</option>
                <option value="前台">前台</option>
                <option value="产品经理">产品经理</option>
            </select>
        </div>
        <br>

        <div calss="form-group">
            <lable>绩效：</lable>
            <input class="inputs" name="merits">
        </div>
        <br><br>

        <div calss="form-group">
            <input class="button" type="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input class="button" type="reset" value="重置">
        </div>

    </form>
</div>
</body>
</html>
