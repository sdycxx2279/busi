<%--
  Created by IntelliJ IDEA.
  User: 26096
  Date: 2017/8/3
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=AP2WVpt74KyxycTt7BwhEFDpP3VG1NF9"></script>
    <title>地图展示</title>
</head>
<body>
<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");    // 创建Map实例
    map.centerAndZoom(new BMap.Point(116, 35.53), 15);  // 初始化地图,设置中心点坐标和地图级别
    var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
    var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
    var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); //右上角，仅包含平移和缩放按钮
    map.addControl(top_left_control);
    map.addControl(top_left_navigation);
    map.addControl(top_right_navigation);
    map.setCurrentCity("郓城");          // 设置地图显示的城市 此项是必须设置的
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放

    var points = [
        {"lng":115.987567,"lat":35.537519,"url":"http://www.baidu.com","id":50,"name":"p1"},
        {"lng":115.997772,"lat":35.534523,"url":"http://www.taobao.com","id":2,"name":"p2"},
        {"lng":115.991592,"lat":35.533466,"url":"http://www.google.com","id":3,"name":"p3"}
    ]
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
            +'<span style="width: 50px;display: inline-block;">id：</span>' + point.id + '</li>'
            +'<li style="line-height: 26px;font-size: 15px;">'
            +'<span style="width: 50px;display: inline-block;">名称：</span>' + point.name + '</li>'
            +'<li style="line-height: 26px;font-size: 15px;"><span style="width: 50px;display: inline-block;">查看：</span><a href="'+point.url+'">详情</a></li>'
            +'</ul>';
        var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
        thisMaker.openInfoWindow(infoWindow);   //图片加载完毕重绘infowindow
    }
    addMarker(points);
</script>
