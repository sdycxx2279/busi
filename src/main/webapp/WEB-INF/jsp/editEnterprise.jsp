<%--
  Created by IntelliJ IDEA.
  User: 26096
  Date: 2017/8/14
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            编辑单位
            <small>
                <i class="icon-double-angle-right"></i>
            </small>
        </h1>
    </div><!-- /.page-header -->
    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->

            <form class="form-horizontal" action="/ad/editEnterprisePost/${enterprise.id}.do" method="post" enctype="multipart/form-data" onsubmit="return send()">
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="name">单位名 </label>

                    <div class="col-sm-9">
                        <input  type="text" class="col-xs-10 col-sm-5" value="${enterprise.name}" id="name" name="name"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">单位位置 </label>

                    <div class="col-sm-9">
                        <div id="l-map" style="height:300px;width:100%;"></div>
                        <div id="r-result">搜索位置:<input type="text" id="suggestId" size="20" value="百度" style="width:150px;" />
                            <input style="margin-left: 20px" type="button" value="清除所有点" onclick="clearAll()"/></div>
                        <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
                        <input type="hidden" name="lng" id="lng"/>
                        <input type="hidden" name="lat" id="lat"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="level"> 问题级别
                    </label>

                    <div class="col-sm-9">
                        <select name="level" id="level">
                            <option value="0">----请选择----</option>
                            <option value="1" style="color: red">红色</option>
                            <option value="2" style="color: yellow">黄色</option>
                            <option value="3" style="color: green">绿色</option>
                        </select>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="type"> 单位类型
                    </label>

                    <div class="col-sm-9">
                        <select name="type" id="type">
                            <option value="0">----请选择----</option>
                            <c:forEach items="${typeList}" var="type">
                                <option value="${type.id}" <c:if test="${type.id==enterprise.type}"> selected = "selected"</c:if>>${type.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="boss">单位负责人姓名</label>

                    <div class="col-sm-9">
                        <input type="text" id="boss" name="boss" class="col-xs-10 col-sm-5" value="${enterprise.boss}"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="call_boss">单位负责人电话</label>

                    <div class="col-sm-9">
                        <input type="text" id="call_boss" name="call_boss" class="col-xs-10 col-sm-5"
                               onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)"
                               onblur="this.v();" value="${enterprise.call_boss}"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="photo_member">单位负责人照片</label>
                    <div class="col-sm-9">
                        <div>
                            <div class="line">
                                <img src="${enterprise.photo_boss}" style="width:100px;height:160px;" alt="单位负责人照片">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="photo_boss">修改</label>
                    <div class="col-sm-9">
                        <div>
                            <div class="line">
                                <input type="file" id="photo_boss" name="file1"/>
                            </div>
                            <img src="" class="showImage"> <br class="br">
                        </div>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="leader">网格长姓名</label>

                    <div class="col-sm-9">
                        <input type="text" id="leader" name="leader" class="col-xs-10 col-sm-5" value="${enterprise.leader}" />
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="call_leader">网格长电话</label>

                    <div class="col-sm-9">
                        <input type="text" id="call_leader" name="call_leader" class="col-xs-10 col-sm-5"
                               onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)"
                               onblur="this.v();" value="${enterprise.call_leader}"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="photo_member">网格长照片</label>
                    <div class="col-sm-9">
                        <div>
                            <div class="line">
                                <img src="${enterprise.photo_leader}" style="width:100px;height:160px;" alt="网格长照片">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="photo_leader">修改</label>
                    <div class="col-sm-9">
                        <div>
                            <div class="line">
                                <input type="file" id="photo_leader" name="file2"/>
                            </div>
                            <img src="" class="showImage"> <br class="br">
                        </div>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="member">网格员姓名</label>

                    <div class="col-sm-9">
                        <input type="text" id="member" name="member" class="col-xs-10 col-sm-5" value="${enterprise.member}"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="call_member">网格员电话</label>

                    <div class="col-sm-9">
                        <input type="text" id="call_member" name="call_member" class="col-xs-10 col-sm-5"
                               onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)"
                               onblur="this.v();" value="${enterprise.call_member}"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="photo_member">网格员照片</label>
                    <div class="col-sm-9">
                        <div>
                            <div class="line">
                                <img src="${enterprise.photo_member}" style="width:100px;height:160px;" alt="网格员照片">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="photo_member">修改</label>
                    <div class="col-sm-9">
                        <div>
                            <div class="line">
                                <input type="file" id="photo_member" name="file3"/>
                            </div>
                            <img src="" class="showImage"> <br class="br">
                        </div>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="deadline">整改截止日期</label>

                    <div class="col-sm-9">
                        <input type="date" id="deadline" name="deadday" value="${deadline}"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">单位描述</label>

                    <div class="col-sm-9">
                        <script id="description" type="text/plain"></script>
                        <input type="hidden" id="input_description" name="description"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">存在问题Ⅰ</label>

                    <div class="col-sm-9">
                        <script id="question1" type="text/plain"></script>
                        <input type="hidden" id="input_question1" name="question1"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">存在问题Ⅱ</label>

                    <div class="col-sm-9">
                        <script id="question2" type="text/plain"></script>
                        <input type="hidden" id="input_question2" name="question2"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">存在问题Ⅲ</label>

                    <div class="col-sm-9">
                        <script id="question3" type="text/plain"></script>
                        <input type="hidden" id="input_question3" name="question3"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">存在问题Ⅳ</label>

                    <div class="col-sm-9">
                        <script id="question4" type="text/plain"></script>
                        <input type="hidden" id="input_question4" name="question4"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">存在问题Ⅴ</label>

                    <div class="col-sm-9">
                        <script id="question5" type="text/plain"></script>
                        <input type="hidden" id="input_question5" name="question5"/>
                    </div>
                </div>
                <div class="space-4"></div>




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
<script type="text/javascript" src="assets/js/jquery-1.7.1.min.js"></script>

<!-- 配置文件 -->
<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="ueditor/ueditor.all.js"></script>

<!-- Baidu Map API -->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=AP2WVpt74KyxycTt7BwhEFDpP3VG1NF9"></script>

<script type="text/javascript">
    var lng = ${enterprise.lng}
    var lat = ${enterprise.lat}
    var level = ${enterprise.level};
    var message = '${message}';
    var description = '${enterprise.description}';
    var question1 = '${enterprise.question1}';
    var question2 = '${enterprise.question2}';
    var question3 = '${enterprise.question3}';
    var question4 = '${enterprise.question4}';
    var question5 = '${enterprise.question5}';
    //初始化ueditor编辑器
    var ue1 = UE.getEditor('description');
    var ue2 = UE.getEditor('question1');
    var ue3 = UE.getEditor('question2');
    var ue4 = UE.getEditor('question3');
    var ue5 = UE.getEditor('question4');
    var ue6 = UE.getEditor('question5');

    //为富文本编辑框赋值
    ue1.ready(function() {
        ue1.setContent(description);
    });
    ue2.ready(function() {
        ue2.setContent(question1);
    });
    ue3.ready(function() {
        ue3.setContent(question2);
    });
    ue4.ready(function() {
        ue4.setContent(question3);
    });
    ue5.ready(function() {
        ue5.setContent(question4);
    });
    ue6.ready(function() {
        ue6.setContent(question5);
    });
</script>

<script type="text/javascript" src="assets/js/editEnterprise.js"></script>