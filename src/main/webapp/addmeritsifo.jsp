<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/add.css?v=<%= System.currentTimeMillis()%>"/>


</head>

<body style="overflow-y: hidden">
    <div class="center">
        <form action="meritsifo/addmeritsifo" method="post"  autocomplete="off">
            <div class="title1">绩效信息录入</div><br>
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
                <lable>&nbsp;奖惩日期：</lable>
                <input type="text" class="inputs" id="date" name="date" placeholder="&nbsp;点击选择日期" style="padding-left: 5px;width:100px;height: 30px;">
            </div><br>

            <div calss="form-group" style="margin-left: -10px;">
                <lable>奖惩类型：</lable>
                <select name="type" id="type" style="padding-bottom: 5px;">
                    <option value="上班摸鱼">上班摸鱼</option>
                    <option value="表现优异">表现优异</option>
                    <option value="违反纪律">违反纪律</option>
                    <option value="顶撞上司">顶撞上司</option>
                </select>
            </div>
            <br>

            <div calss="form-group">
                <lable>奖惩原因：</lable>
                <textarea  class="inputs" name="reason" id="reason"
                           style="width: 200px;height: 100px;white-space: pre-wrap; word-wrap: break-word; word-break: break-all;resize: none;vertical-align: top;">
                </textarea>
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
    <script type="text/javascript">
        function isAlreadyHave() {
            $(document).ready(function() {

                var eno = $("#eno").val();

                if (eno == null || eno == "") {
                    $("#enoDiv2").html("");  //清空有可能存在的div
                    $("#enoDiv1").html("工号不能为空");
                    $("#eno").css("border", "1px solid red")
                }else {
                    $.post("${pageContext.request.contextPath}/meritsifo/ishava", {
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
    <script>
        // 日期框
        laydate.render({
            elem: '#date'
        });
    </script>


</body>
</html>
