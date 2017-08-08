<%--
  Created by IntelliJ IDEA.
  User: 26096
  Date: 2017/8/9
  Time: 0:56
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

    <title>企业信息管理系统</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!-- page specific plugin styles -->

    <link rel="stylesheet" type="text/css" href="assets/css/jquery-ui-1.10.3.custom.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/jquery.gritter.css" />
    <script type="text/javascript" src="assets/js/jquery-1.7.1.min.js"></script>
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
            新建用户
            <small>
                <i class="icon-double-angle-right"></i>
            </small>
        </h1>
    </div><!-- /.page-header -->
    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->

            <form class="form-horizontal" action="" method="post" enctype="multipart/form-data"
                  onsubmit="return send()">
                <div class="form-group">
                    <label readonly="" class="col-sm-3 control-label no-padding-right" for="form-field-1">用户名 </label>

                    <div class="col-sm-9">
                        <input  type="text" class="col-xs-10 col-sm-5" id="form-field-1" name="username"/>
                        <span class="help-inline col-xs-12 col-sm-7">
								<label class="middle">
									<input class="ace" type="checkbox" id="id-disable-check" />
								</label>
							</span>
                    </div>
                </div>
                <div class="space-4"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 密码</label>

                    <div class="col-sm-9">
                        <input type="password" id="form-field-2" name="password" class="col-xs-10 col-sm-5" />
                    </div>
                </div>

                <div class="space-4"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="repeat">
                        重复密码</label>

                    <div class="col-sm-9">
                        <input type="password" id="repeat" class="col-xs-10 col-sm-5" />
                    </div>
                </div>

                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-3">昵称</label>

                    <div class="col-sm-9">
                        <input class="input-sm" type="text" id="form-field-3" name="nickname"/>
                        <div class="space-2"></div>

                        <div class="help-block" id="input-size-slider"></div>
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-4"> 用户权限
                    </label>

                    <div class="col-sm-9">
                        <select name="ad" id="form-field-4">
                            <option value="3">----请选择----</option>
                            <option value="0">普通用户</option>
                            <option value="1">管理员</option>
                            <option value="2">超级管理员</option>
                        </select>
                    </div>
                </div>


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
<script src="assets/js/base.js"></script>
</body>
</html>
<script  type = "text/javascript" >
    function send(){
        var username = $("#form-field-1").val();
        var password = $("#form-field-2").val();
        var nickname = $("#form-field-3").val();
        var ad = $("#form-field-4").val();
        var repeat = $("#repeat").val();

        if(username==""){
            alert("用户名不得为空！");
            return false;
        }
        if(password==""){
            alert("密码不得为空！");
            return false;
        }
        if(nickname==""){
            alert("昵称不得为空！");
            return false;
        }
        if(username.length>20){
            alert("用户名长度不得大于20个字符！");
            return false;
        }
        if(password.length>20){
            alert("密码长度不得大于20个字符！");
            return false;
        }
        if(nickname.length>20){
            alert("用户昵称长度不得大于20个字符！");
            return false;
        }
        if(ad =="" || ad == "3"){
            alert("请选择用户权限！");
            return false;
        }
        if(repeat != password){
            alert("两次密码输入不一致！");
            return false;
        }
    }
</script>
