<%--
  Created by IntelliJ IDEA.
  User: 26096
  Date: 2017/8/5
  Time: 11:34
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

    <title>企业信息管理系统</title>

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
            新建企业
            <small>
                <i class="icon-double-angle-right"></i>
            </small>
        </h1>
    </div><!-- /.page-header -->
    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->

            <form class="form-horizontal" action="/ad/addEnterprisePost.do" method="post" enctype="multipart/form-data" onsubmit="return send()">
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="name">企业名 </label>

                    <div class="col-sm-9">
                        <input  type="text" class="col-xs-10 col-sm-5" placeholder="不得输入数字" id="name" name="name"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">企业位置 </label>

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
                    <label class="col-sm-3 control-label no-padding-right" for="level"> 企业级别
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
                    <label class="col-sm-3 control-label no-padding-right" for="type"> 企业类型
                    </label>

                    <div class="col-sm-9">
                        <select name="type" id="type">
                            <option value="0">----请选择----</option>
                            <c:forEach items="${typeList}" var="type">
                                <option value="${type.id}">${type.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="boss">企业负责人姓名</label>

                    <div class="col-sm-9">
                        <input type="text" id="boss" name="boss" class="col-xs-10 col-sm-5" placeholder="不得输入纯数字"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="call_boss">企业负责人电话</label>

                    <div class="col-sm-9">
                        <input type="text" id="call_boss" name="call_boss" class="col-xs-10 col-sm-5" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="photo_boss">企业负责人照片</label>
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
                        <input type="text" id="leader" name="leader" class="col-xs-10 col-sm-5" placeholder="不得输入纯数字" />
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="call_leader">网格长电话</label>

                    <div class="col-sm-9">
                        <input type="text" id="call_leader" name="call_leader" class="col-xs-10 col-sm-5" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="photo_leader">网格长照片</label>
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
                        <input type="text" id="member" name="member" class="col-xs-10 col-sm-5" placeholder="不得输入纯数字"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="call_member">网格员电话</label>

                    <div class="col-sm-9">
                        <input type="text" id="call_member" name="call_member" class="col-xs-10 col-sm-5" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="photo_member">网格员照片</label>
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
                    <label class="col-sm-3 control-label no-padding-right" for="deadline">截止日期</label>

                    <div class="col-sm-9">
                        <input type="date" id="deadline" name="deadday"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">企业描述</label>

                    <div class="col-sm-9">
                        <script id="description" type="text/plain"></script>
                        <input type="hidden" id="input_description" name="description"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">存在问题1</label>

                    <div class="col-sm-9">
                        <script id="question1" type="text/plain"></script>
                        <input type="hidden" id="input_question1" name="question1"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">存在问题2</label>

                    <div class="col-sm-9">
                        <script id="question2" type="text/plain"></script>
                        <input type="hidden" id="input_question2" name="question2"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">存在问题3</label>

                    <div class="col-sm-9">
                        <script id="question3" type="text/plain"></script>
                        <input type="hidden" id="input_question3" name="question3"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">存在问题4</label>

                    <div class="col-sm-9">
                        <script id="question4" type="text/plain"></script>
                        <input type="hidden" id="input_question4" name="question4"/>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">存在问题5</label>

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
                    </div>
                </div>

                <div class="hr hr-24"></div>

            </form>
        </div>
    </div>
</div>
</body>
</html>

<script src="assets/js/base.js"></script>
<script type="text/javascript" src="assets/js/jquery-1.7.1.min.js"></script>

<!-- 配置文件 -->
<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="ueditor/ueditor.all.js"></script>

<!-- Baidu Map API -->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=AP2WVpt74KyxycTt7BwhEFDpP3VG1NF9"></script>

<script type="text/javascript">
    var message = '${message}';
    if(message==1){
        alert("系统错误，请稍后再试！");
    }
    //初始化ueditor编辑器
    var ue1 = UE.getEditor('description');
    var ue2 = UE.getEditor('question1');
    var ue3 = UE.getEditor('question2');
    var ue4 = UE.getEditor('question3');
    var ue5 = UE.getEditor('question4');
    var ue6 = UE.getEditor('question5');

    // 百度地图API功能
    var map = new BMap.Map("l-map");    // 创建Map实例
    map.centerAndZoom(new BMap.Point(116, 35.534523), 15);  // 初始化地图,设置中心点坐标和地图级别
    var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
    var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
    var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); //右上角，仅包含平移和缩放按钮
    map.addControl(top_left_control);
    map.addControl(top_left_navigation);
    map.addControl(top_right_navigation);
    map.setCurrentCity("郓城");          // 设置地图显示的城市 此项是必须设置的
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放

    var overlays = [];

    map.addEventListener("click",function(e){
        var point = new BMap.Point(e.point.lng,e.point.lat);
        var marker = new BMap.Marker(point);// 创建标注
        map.addOverlay(marker);
        marker.enableDragging();
        overlays.push(marker);
    });
    function G(id) {
        return document.getElementById(id);
    }



    var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
        {"input" : "suggestId"
            ,"location" : map
        });

    ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
        var str = "";
        var _value = e.fromitem.value;
        var value = "";
        if (e.fromitem.index > -1) {
            value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        }
        str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

        value = "";
        if (e.toitem.index > -1) {
            _value = e.toitem.value;
            value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        }
        str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
        G("searchResultPanel").innerHTML = str;
    });

    var myValue;
    ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
        var _value = e.item.value;
        myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

        setPlace();
    });

    function setPlace(){
        map.clearOverlays();    //清除地图上所有覆盖物
        function myFun(){
            var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
            map.centerAndZoom(pp, 18);
            marker = new BMap.Marker(pp)
            map.addOverlay(marker);//添加标注
            marker.enableDragging();
            overlays.push(marker);
        }
        var local = new BMap.LocalSearch(map, { //智能搜索
            onSearchComplete: myFun
        });
        local.search(myValue);
    }
    function clearAll() {
        for(var i = 0; i < overlays.length; i++){
            map.removeOverlay(overlays[i]);
        }
        overlays.length = 0
    }
    //校验输入格式并为隐藏输入框赋值
    function send(){
        var name = $("#name").val();
        var level = $("#level").val();
        var type = $("#type").val();
        var boss = $("#boss").val();
        var photo_boss = $("#photo_boss").val();
        var call_boss = $("#call_boss").val();
        var leader = $("#leader").val();
        var photo_leader = $("#photo_leader").val();
        var call_leader = $("#call_leader").val();
        var member = $("#member").val();
        var photo_member = $("#photo_member").val();
        var call_member = $("#call_member").val();
        var deadline = $("#deadline").val();
        var description = ue1.getContent();

        //用于校验是否为纯数字
        var reg=/^[1-9]\d*$|^0$/;

        if(name==null||name==""){
            alert("企业名不可为空！");
            return false;
        }
        if(reg.test(name)==true){
            alert("企业名不可为纯数字");
            return false;
        }
        if(overlays.length!=1){
            alert("地点必选且仅可以选择一个！");
            return false;
        }
        $("#lng").val(overlays[0].getPosition().lng);
        $("#lat").val(overlays[0].getPosition().lat);
        if(level==null||level=="0"){
            alert("必须选择级别！");
            return false;
        }
        if(boss==null||boss==""){
            alert("企业负责人姓名不可为空！");
            return false;
        }
        if(reg.test(boss)==true){
            alert("企业负责人姓名不可为纯数字");
            return false;
        }
        if(photo_boss==null||photo_boss==""){
            alert("企业负责人照片未上传！");
            return false;
        }
        if(call_boss==null||call_boss==""){
            alert("企业负责人电话不可为空！");
            return false;
        }
        if(leader==null||leader==""){
            alert("网格长姓名不可为空！");
            return false;
        }
        if(reg.test(leader)==true){
            alert("网格长姓名不可为纯数字");
            return false;
        }
        if(photo_leader==null||photo_leader==""){
            alert("网格长照片未上传！");
            return false;
        }
        if(call_leader==null||call_leader==""){
            alert("网格长电话不可为空！");
            return false;
        }
        if(member==null||member==""){
            alert("网格员姓名不可为空！");
            return false;
        }
        if(reg.test(member)==true){
            alert("网格员姓名不可为纯数字");
            return false;
        }
        if(photo_member==null||photo_member==""){
            alert("网格员照片未上传！");
            return false;
        }
        if(call_member==null||call_member==""){
            alert("网格员电话不可为空！");
            return false;
        }
        if(deadline==null||deadline==""){
            alert("截止日期不可为空！");
            return false;
        }
        if(description==null||description==""){
            alert("企业简介不可为空！");
            return false;
        }
        if(!isImage(photo_boss)||!isImage(photo_member)||!isImage(photo_leader)){
            alert("照片仅接受jpg、jpeg、bmp、png、gif五种格式！");
            return false;
        }

        $("#input_description").val(ue1.getContent());
        $("#input_question1").val(ue2.getContent());
        $("#input_question2").val(ue3.getContent());
        $("#input_question3").val(ue4.getContent());
        $("#input_question4").val(ue5.getContent());
        $("#input_question5").val(ue6.getContent());
    }

    //校验文件是否为图片
    function isImage(file){
        photoExt=file.substr(file.lastIndexOf(".")).toLowerCase();//获得文件后缀名
        if(photoExt!='.bmp'&&photoExt!='.jpg'&&photoExt!='.jpeg'&&photoExt!='.gif'&&photoExt!='.png')
            return false;
        else
            return true;
    }

</script>