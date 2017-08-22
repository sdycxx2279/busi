<%--
  Created by IntelliJ IDEA.
  User: 26096
  Date: 2017/8/11
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    //分页
    //currentPage就是当前页，allPages表示的就是一共有多少页。这些在后面都会用到
    int currentPage = 0, allPages = 0;
    if (request.getAttribute("currentPage") != null) {
        currentPage = Integer.parseInt(request.getAttribute(
                "currentPage").toString());
    }
    if (request.getAttribute("allPages") != null) {
        allPages = Integer.parseInt(request.getAttribute("allPages")
                .toString());
    }
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
                            <a href="#modal-table" role="button" class="green" data-toggle="modal"> 单位分布 </a>
                        </h4>
                        <div class="hr hr-18 dotted hr-double"></div>
                        <div class="nav-search" id="nav-search">
                            <form class="form-search">
                                <span class="span_margin">单位名：</span><span class="input-icon">
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
                                <input type="date" value="${deadline}" class="nav-search-input"
                                       id="deadline-search-input" autocomplete="off"/>
                                <i class="icon-search nav-search-icon"></i>
                            </span>
                                <span class="span_margin">单位类别：</span><span class="input-icon">
                                <select name="ad" id="tag-search-input">
                                    <option value="0">----请选择----</option>
                                    <c:forEach items="${typeList}" var="type">
                                        <option value="${type.id}" <c:if
                                                test="${type.id==tag}"> selected = "selected"</c:if>>${type.name}</option>
                                    </c:forEach>
                                </select>
                                </span>
                                <input type="button" id="submit" class="submit_button" value="提交"
                                       onclick="searchByProperties()">
                                <input type="button" id="fullScreen" class="submit_button" value="地图全屏"
                                       onclick="full()">
                            </form>
                        </div><!-- #nav-search -->
                        <div class="col-xs-12" id="allmap" style="width:100%;height:600px;margin-bottom:20px;font-family:"
                             微软雅黑
                        ";">
                    </div>
                    <div class="col-xs-12" id="list" style="display:block">
                        <div class="hr hr-18 dotted hr-double"></div>
                        <h4 class="pink">
                            <i class="icon-hand-right icon-animated-hand-pointer blue"></i>
                            <a href="#modal-table" role="button" class="green" data-toggle="modal"> 单位列表 </a>
                        </h4>
                        <div class="hr hr-18 dotted hr-double"></div>

                        <div class="table-responsive">
                            <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                                <thead class="table-header">
                                <tr>
                                    <th class="center">企业名</th>
                                    <th>级别</th>
                                    <th>负责人</th>
                                    <th>网格长</th>
                                    <th>网格员</th>
                                    <th>企业类别</th>
                                    <th>截止日期</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach items="${enterpriseList}" var="item">
                                    <tr>
                                        <td class="center">${item.name}</td>
                                        <td>
                                            <c:if test="${item.level==1}">
                                                <p style="color: red">红色</p>
                                            </c:if>
                                            <c:if test="${item.level==2}">
                                                <p style="color:yellow;">黄色</p>
                                            </c:if>
                                            <c:if test="${item.level==3}">
                                                <p style="color: green">绿色</p>
                                            </c:if>
                                        </td>
                                        <td>${item.boss}</td>
                                        <td>${item.leader}</td>
                                        <td>${item.member}</td>
                                        <td>
                                            <c:forEach items="${typeList}" var="type">
                                                <c:if test="${type.id==item.type}">
                                                    <c:out value="${type.name}"/>
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${item.deadline}"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="10" style="text-align:left">
                                        <c:if test="${allPages>1}">
                                            <div align="right" class="viciao">
                                                <a href="javascript:void();"
                                                   onclick="dividePage('${allPages}','${currentPage}','first')">&nbsp; 首
                                                    页 &nbsp;</a>
                                                <a href="javascript:void();"
                                                   onclick="dividePage('${allPages}','${currentPage}','prvious')">&nbsp;&lt;&nbsp;
                                                    Prev &nbsp;</a>
                                                <%
                                                    for (int i = currentPage - 2; i <= currentPage + 2
                                                            && i <= allPages; i++) {
                                                        if (currentPage == i) {
                                                %>
                                                <span class="current"><%=i%></span>
                                                <%
                                                } else if (i > 0) {
                                                %>
                                                <a href="javascript:void();"
                                                   onclick="dividePage('${allPages}','${currentPage}','<%=i%>')"><%=i%>
                                                </a>
                                                <%
                                                        }
                                                    }
                                                %>
                                                <a href="javascript:void();"
                                                   onclick="dividePage('${allPages}','${currentPage}','next')">&nbsp;Next&nbsp;&gt;&nbsp;</a>
                                                <a
                                                        href="javascript:void();"
                                                        onclick="dividePage('${allPages}','${currentPage}','last')">&nbsp;尾
                                                    页&nbsp; </a>
                                            </div>
                                        </c:if>

                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
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
    if ("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
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
    document.getElementById("level-search-input")[level].selected = true;
    // 百度地图API功能
    var map = new BMap.Map("allmap");    // 创建Map实例
    map.centerAndZoom(new BMap.Point(116, 35.534523), 15);  // 初始化地图,设置中心点坐标和地图级别
    var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
    var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
    var top_right_navigation = new BMap.NavigationControl({
        anchor: BMAP_ANCHOR_TOP_RIGHT,
        type: BMAP_NAVIGATION_CONTROL_SMALL
    }); //右上角，仅包含平移和缩放按钮
    map.addControl(top_left_control);
    map.addControl(top_left_navigation);
    map.addControl(top_right_navigation);
    map.setCurrentCity("郓城");          // 设置地图显示的城市 此项是必须设置的
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放

    var points = ${enterpriseMap};
    var tagList = ${tagList};
    addMarker(points);


    function addMarker(points) {  // 创建图标对象

        // 创建标注对象并添加到地图
        for (var i = 0, pointsLen = points.length; i < pointsLen; i++) {
            var point = new BMap.Point(points[i].lng, points[i].lat);
            var marker = new BMap.Marker(point);
            if (points[i].level == 1) {
                marker.setAnimation(BMAP_ANIMATION_BOUNCE); //弹跳效果
            }
            map.addOverlay(marker);
            //给标注点添加点击事件。使用立即执行函数和闭包
            (function () {
                var thePoint = points[i];
                marker.addEventListener("click", function () {
                    showInfo(this, thePoint);
                });
            })();

        }
    }

    //显示信息窗口，显示标注点的信息。
    function showInfo(thisMaker, point) {
        var level;
        var tag;
        if(point.level==1){
            level = "红色";
        }else if(point.level==2){
            level = "黄色";
        }else{
            level="绿色";
        }
        for (var i = 0, tagsLen = tagList.length; i < tagsLen; i++) {
            if(point.type==tagList[i].id){
                tag = tagList[i].name;
                break;
            }
        }

        var sContent =
            '<ul style="margin:0 0 5px 0;padding:0.2em 0">'
            + '<li style="line-height: 26px;font-size: 15px;">'
            + '<span style="width: 100px;display: inline-block;">单位名：</span>' + point.name + '</li>'
            + '<li style="line-height: 26px;font-size: 15px;">'
            + '<span style="width: 100px;display: inline-block;">类别：</span>' + tag + '</li>'
            + '<li style="line-height: 26px;font-size: 15px;">'
            + '<span style="width: 100px;display: inline-block;">级别：</span>' + level + '</li>'
            + '<li style="line-height: 26px;font-size: 15px;"><span style="width: 100px;display: inline-block;">查看：</span><a href="ad/enterpriseInfo/' + point.id + '.do">详情</a></li>'
            + '</ul>';
        var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
        thisMaker.openInfoWindow(infoWindow);   //图片加载完毕重绘infowindow
    }

</script>
