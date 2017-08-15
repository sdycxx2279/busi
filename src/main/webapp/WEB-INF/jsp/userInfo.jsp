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

    <title>丁里长镇政务电子管理系统</title>

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
            编辑用户信息
            <small>
                <i class="icon-double-angle-right"></i>
            </small>
        </h1>
    </div><!-- /.page-header -->
    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->

            <form class="form-horizontal" action="/superad/editUser/${user.id}.do" method="post" onsubmit="return send()">
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-input-readonly">用户名 </label>

                    <div class="col-sm-9">
                        <input readonly="true" type="text" class="col-xs-10 col-sm-5" id="form-input-readonly" name="username" value="${user.username}" />
                        <span class="help-inline col-xs-12 col-sm-7">
								<label class="middle">
									<input class="ace" type="checkbox" id="id-disable-check" />
								</label>
							</span>
                    </div>
                </div>

                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-2">昵称</label>

                    <div class="col-sm-9">
                        <input class="input-sm" type="text" id="form-field-2" name="nickname"  value="${user.nickname}" />
                        <div class="space-2"></div>

                        <div class="help-block" id="input-size-slider"></div>
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right"
                           for="form-field-3"> 用户权限 </label>

                    <div class="col-sm-9">
                        <select name="ad" id="form-field-3">
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

                        &nbsp; &nbsp; &nbsp;
                        <button class="btn" type="reset" onclick="goBack()">
                            <i class="icon-undo bigger-110"></i>
                            取消
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
    var i = ${user.ad};
    document.getElementById("form-field-3")[i].selected=true;
    var flag = '${flag}';
    if(flag == 1)
        alert("系统故障，请稍后再试！");
    function send(){
        var nickname = $("#form-field-2").val();
        if(nickname.length>20){
            alert("用户昵称长度不得大于20个字符！");
            return false;
        }
        if(nickname==""){
            alert("昵称不得为空！");
            return false;
        }
        if (nickname.indexOf(" ") != -1) {
            alert("昵称不得包含空格！");
            return false;
        }
    }
    function goBack(){
        self.location = document.referrer;
    }
</script>
