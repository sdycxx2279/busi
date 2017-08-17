<%--
  Created by IntelliJ IDEA.
  User: 26096
  Date: 2017/8/9
  Time: 17:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>丁里长镇党务政务电子管理系统</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!-- page specific plugin styles -->

    <link rel="stylesheet" type="text/css" href="assets/css/jquery-ui-1.10.3.custom.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/select2.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-editable.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/ace.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/ace-rtl.min.css" />

</head>

<body style="background-color: #fff;">
<div class="page-content">
    <div class="page-header">
        <h1>
            修改密码
            <small>
                <i class="icon-double-angle-right"></i>
            </small>
        </h1>
    </div><!-- /.page-header -->
    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->

            <form class="form-horizontal" action="/user/editPassword.do" method="post" onsubmit="return send()">

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">旧密码</label>

                    <div class="col-sm-9">
                        <input class="col-xs-10 col-sm-5" type="password" id="form-field-1" name="oldPassword"/>
                        <div class="space-2"></div>

                    </div>
                </div>

                <div class="space-4"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-2">新密码</label>

                    <div class="col-sm-9">
                        <input class="col-xs-10 col-sm-5" type="password" id="form-field-2" name="password"/>
                        <div class="space-2"></div>

                    </div>
                </div>

                <div class="space-4"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-3">重复新密码</label>

                    <div class="col-sm-9">
                        <input class="col-xs-10 col-sm-5" type="password" id="form-field-3" name="repeat"/>
                        <div class="space-2"></div>

                    </div>
                </div>

                <div class="space-4"></div>





                <div class="clearfix form-actions">
                    <div class="col-md-offset-3 col-md-9">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok bigger-110"></i>
                            提交
                        </button>
                    </div>
                </div>

                <div class="hr hr-24"></div>

            </form>
        </div>
    </div>
</div>
</body>
</html>
<script  type = "text/javascript" >
    var flag = '${flag}';
    if(flag==1)
        alert("密码修改成功");
    else if (flag==3)
        alert("系统错误");
    else if(flag==2)
        alert("旧密码输入错误");
    function send(){
        var oldpassword = $("#form-field-1").val();
        var password = $("#form-field-2").val();
        var repeat = $("#form-field-3").val();
        if(password.length>20){
            alert("密码长度不得大于20个字符！");
            return false;
        }
        if(oldpassword==""){
            alert("旧密码不得为空！");
            return false;
        }
        if(password==""){
            alert("密码不得为空！");
            return false;
        }
        if (password.indexOf(" ") != -1) {
            alert("密码不得包含空格！");
            return false;
        }
        if (password!=repeat) {
            alert("两次新密码重复输入不一致！");
            return false;
        }
    }
</script>
<script type="text/javascript" src="assets/js/jquery-1.7.1.min.js"></script>
