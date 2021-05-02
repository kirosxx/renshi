<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/add.css?v=<%= System.currentTimeMillis()%>"/>


</head>

<body style="overflow-y: hidden">
    <div class="center">
        <form action="leaveifo/addleaveifo" method="post"  autocomplete="off">
            <div class="title1">请假信息录入</div><br>
            <div calss="form-group" style="margin-left: -30px;">
                <lable>输入工号检索：</lable>
                <input class="inputs" name="eno" id="eno" onblur="isAlreadyHave()" style="width: 100px;">
            </div><br>

            <div calss="form-group" style="margin-left: -70px;">
                <lable>姓名：&nbsp;&nbsp;</lable>
                <input class="inputs" name="ename" id="ename" type="hidden">
                <span id="enoDiv1" style="color: red; font-size: 15px;position:absolute;"></span>
                <span id="enoDiv2" style="color: green; font-size: 15px;position:absolute;"></span>
            </div>

            <div calss="form-group"><br>
                <lable>&nbsp;请假日期：</lable>
                <input type="text" class="inputs" id="startdate" name="startdate" placeholder="&nbsp;点击选择日期" style="padding-left: 5px;width:100px;height: 30px;">
            </div>
            <div calss="form-group" style="margin-left: 55px;"><br>
                <lable>至&nbsp;&nbsp;</lable>
                <input type="text" class="inputs" id="enddate" name="enddate" placeholder="&nbsp;点击选择日期" style="padding-left: 5px;width:100px;height: 30px;">
            </div><br>

            <div calss="form-group" style="margin-left: 10px;">
                <lable>请假类型：</lable>
                <select name="type" id="type" style="padding-bottom: 5px;">
                    <option value="病假">病假</option>
                    <option value="事假">事假</option>
                    <option value="产假">产假</option>
                    <option value="其他特殊情况">其他特殊情况</option>
                </select>
            </div>
            <br>

            <div calss="form-group" style="margin-left: 20px;">
                <lable>批复人：</lable>
                <input class="inputs" name="agreer" id="agreer" style="width: 100px;">
            </div>
            <br><br>

            <div calss="form-group">
                <input class="button" type="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input class="button" type="reset" value="重置">
            </div>

        </form>
    </div>


    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/laydate/laydate.js" type="text/javascript"></script>
    <script>
        // 日期框
        laydate.render({
            elem: '#startdate'
        });
        laydate.render({
            elem: '#enddate'
        });
    </script>
    <script type="text/javascript">
        function isAlreadyHave() {
            $(document).ready(function() {

                var eno = $("#eno").val();

                if (eno == null || eno == "") {
                    $("#enoDiv2").html("");  //清空有可能存在的div
                    $("#enoDiv1").html("工号不能为空");
                    $("#eno").css("border", "1px solid red")
                }else {
                    $.post("${pageContext.request.contextPath}/leaveifo/ishava", {
                        "eno" : eno
                    }, function(data) {
                        if(data.indexOf("有误") == -1){
                            $("#enoDiv1").html("");  //清空有可能存在的div
                            $("#enoDiv2").html(data);
                            $("#eno").css("border", "1px solid green")
                        }else{
                            $("#enoDiv2").html("");  //清空有可能存在的div
                            $("#enoDiv1").html(data);
                            $("#eno").css("border", "1px solid red")
                        }
                    }, "text");

                }

            });
        }
    </script>
</body>
</html>
