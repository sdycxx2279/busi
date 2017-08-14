<%--
  Created by IntelliJ IDEA.
  User: 26096
  Date: 2017/8/11
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/css/ace.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/css/ace-rtl.min.css"/>

</head>

<body>
<div class="main-container" id="main-container">
    <div class="main-container-inner">
        <div class="main-content" style="margin-left:0px;">
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="hr hr-18 dotted hr-double"></div>
                        <h4 class="pink">
                            <i class="icon-hand-right icon-animated-hand-pointer blue"></i>
                            <a href="#modal-table" role="button" class="green" data-toggle="modal"> 企业分布 </a>
                        </h4>
                        <div class="hr hr-18 dotted hr-double"></div>
                        <div class="nav-search" id="nav-search">
                            <form class="form-search">
                                <span class="span_margin">企业名：</span><span class="input-icon">
                                <input type="text" value="${name}" class="nav-search-input"
                                       id="name-search-input" autocomplete="off"/>
                                <i class="icon-search nav-search-icon"></i>
                            </span>
                                <span class="span_margin">网格长：</span><span class="input-icon">
                                    <input type="text" value="${leader}" class="nav-search-input"
                                           id="leader-search-input" autocomplete="off"/>
                                    <i class="icon-search nav-search-icon"></i>
                                </span>
                                <span class="span_margin">网格员：</span><span class="input-icon">
                                    <input type="text" value="${member}" class="nav-search-input"
                                           id="member-search-input" autocomplete="off"/>
                                    <i class="icon-search nav-search-icon"></i>
                                </span>
                                <span class="span_margin">级别：</span><span class="input-icon">
                                <select name="ad" id="level-search-input">
                                    <option value="0">----请选择----</option>
                                    <option value="1">红色</option>
                                    <option value="2">黄色</option>
                                    <option value="3">绿色</option>
                                </select>
                            </span>
                                <span class="span_margin">截止日期：</span><span class="input-icon">
                                <input type="date" value ="${deadline}" class="nav-search-input"
                                       id="deadline-search-input" autocomplete="off"/>
                                <i class="icon-search nav-search-icon"></i>
                            </span>
                                <span class="span_margin">企业类别：</span><span class="input-icon">
                                <select name="ad" id="tag-search-input">
                                    <option value="0">----请选择----</option>
                                    <c:forEach items="${typeList}" var="type">
                                        <option value="${type.id}" <c:if test="${type.id==tag}"> selected = "selected"</c:if>>${type.name}</option>
                                    </c:forEach>
                                </select>
                                </span>
                                <input type="button" id="submit" class="submit_button" value="提交"
                                       onclick="searchByProperties()">
                            </form>
                        </div><!-- #nav-search -->
                        <div class="col-xs-12" id="allmap" style="width:100%;height:90%;margin-bottom:20px;font-family:"微软雅黑";">
                    </div>
                </div>
            </div><!-- /.page-content -->
        </div><!-- /.main-content -->
    </div><!-- /.main-container-inner -->
</div><!-- /.main-container -->
</body>
</html>

<!-- basic scripts -->

<!--[if !IE]> -->
<script type="text/javascript">
    if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>

<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

<!-- <![endif]-->

<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->

<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.js"></script>

<!-- ace scripts -->

<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>
<script src="assets/js/enterpriseMap.js"></script>

<!-- Baidu Map API -->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=AP2WVpt74KyxycTt7BwhEFDpP3VG1NF9"></script>

<script type="text/javascript">
    var level = ${level};
    document.getElementById("level-search-input")[level].selected=true;
    // 百度地图API功能
    var map = new BMap.Map("allmap");    // 创建Map实例
    map.centerAndZoom(new BMap.Point(116, 35.534523), 15);  // 初始化地图,设置中心点坐标和地图级别
    var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
    var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
    var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); //右上角，仅包含平移和缩放按钮
    map.addControl(top_left_control);
    map.addControl(top_left_navigation);
    map.addControl(top_right_navigation);
    map.setCurrentCity("郓城");          // 设置地图显示的城市 此项是必须设置的
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放

    var points = ${enterpriseMap};
    addMarker(points);


    function addMarker(points){  // 创建图标对象

        // 创建标注对象并添加到地图
        for(var i = 0,pointsLen = points.length;i <pointsLen;i++){
            var point = new BMap.Point(points[i].lng,points[i].lat);
            var  marker = new BMap.Marker(point);
            map.addOverlay(marker);
            //给标注点添加点击事件。使用立即执行函数和闭包
            (function() {
                var thePoint = points[i];
                marker.addEventListener("click",function(){
                    showInfo(this,thePoint);
                });
            })();

        }
    }
    //显示信息窗口，显示标注点的信息。
    function showInfo(thisMaker,point){
        var sContent =
            '<ul style="margin:0 0 5px 0;padding:0.2em 0">'
            +'<li style="line-height: 26px;font-size: 15px;">'
            +'<span style="width: 50px;display: inline-block;">企业名：</span>' + point.name + '</li>'
            +'<li style="line-height: 26px;font-size: 15px;">'
            +'<span style="width: 50px;display: inline-block;">类别：</span>' + point.type + '</li>'
            +'<li style="line-height: 26px;font-size: 15px;">'
            +'<span style="width: 50px;display: inline-block;">级别：</span>' + point.level + '</li>'
            +'<li style="line-height: 26px;font-size: 15px;">'
            +'<span style="width: 50px;display: inline-block;">截止日期：</span>'+ point.deadline +'</li>'
            +'<li style="line-height: 26px;font-size: 15px;"><span style="width: 50px;display: inline-block;">查看：</span><a href="'+point.id+'">详情</a></li>'
            +'</ul>';
        var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
        thisMaker.openInfoWindow(infoWindow);   //图片加载完毕重绘infowindow
    }
</script>
