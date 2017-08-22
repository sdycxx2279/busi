<%--
  Created by IntelliJ IDEA.
  User: 26096
  Date: 2017/8/14
  Time: 22:31
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
            单位详情 <small> <i class="icon-double-angle-right"></i></small>
        </h1>
    </div>
    <!-- /.page-header -->
    <div class="row">
        <div class="col-xs-12">
            <div id="user-profile-1" class="user-profile row">

                <div class="col-xs-12 col-sm-9">

                    <div class="space-12"></div>

                    <div class="profile-user-info profile-user-info-striped">
                        <div class="profile-info-row">
                            <div class="profile-info-name">单位名称</div>
                            <div class="profile-info-value">
                                <span class="editable" id="name">${enterprise.name}</span>
                            </div>
                        </div>

                        <div class="profile-info-row">
                            <div class="profile-info-name">单位简介</div>

                            <div class="profile-info-value">
                                ${enterprise.description}
                            </div>
                        </div>

                        <div class="profile-info-row">
                            <div class="profile-info-name">单位位置</div>

                            <div class="profile-info-value">
                                <div id="map" style="height:300px;width:100%;"></div>
                            </div>
                        </div>
                        <div class="profile-info-row">
                            <div class="profile-info-name">问题级别</div>

                            <div class="profile-info-value">
                                <c:if test="${enterprise.level==1}">
                                    <p style="color: red">红色</p>
                                </c:if>
                                <c:if test="${enterprise.level==2}">
                                    <p style="color:yellow;">黄色</p>
                                </c:if>
                                <c:if test="${enterprise.level==3}">
                                    <p style="color: green">绿色</p>
                                </c:if>
                            </div>
                        </div>

                        <div class="profile-info-row">
                            <div class="profile-info-name">单位类型</div>

                            <div class="profile-info-value">
                                <c:forEach items="${typeList}" var="tag">
                                    <c:if test="${tag.id==enterprise.type}">
                                        <c:out value="${tag.name}"/>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="profile-info-row">
                            <div class="profile-info-name">整改截止日期</div>
                            <div class="profile-info-value">
                                <fmt:formatDate pattern="yyyy-MM-dd" value="${enterprise.deadline}"/>
                            </div>
                        </div>

                        <div class="profile-info-row">
                            <div class="profile-info-name">单位负责人姓名</div>
                            <div class="profile-info-value">
                                ${enterprise.boss}
                            </div>
                        </div>

                        <div class="profile-info-row">
                            <div class="profile-info-name">单位负责人电话</div>
                            <div class="profile-info-value">
                                ${enterprise.call_boss}
                            </div>
                        </div>

                        <div class="profile-info-row">
                            <div class="profile-info-name">单位负责人照片</div>
                            <div class="profile-info-value">
                                <div style="width:100px;height:160px">
                                    <img style="width:100%;height:100%" src="${enterprise.photo_boss}">
                                </div>
                            </div>
                        </div>

                        <div class="profile-info-row">
                            <div class="profile-info-name">网格长姓名</div>
                            <div class="profile-info-value">
                                ${enterprise.leader}
                            </div>
                        </div>
                        <div class="profile-info-row">
                            <div class="profile-info-name">网格长电话</div>
                            <div class="profile-info-value">
                                ${enterprise.call_leader}
                            </div>
                        </div>
                        <div class="profile-info-row">
                            <div class="profile-info-name">网格长照片</div>
                            <div class="profile-info-value">
                                <div style="width:100px;height:160px">
                                    <img style="width:100%;height:100%" src="${enterprise.photo_leader}">
                                </div>
                            </div>
                        </div>
                        <div class="profile-info-row">
                            <div class="profile-info-name">网格员姓名</div>
                            <div class="profile-info-value">
                                ${enterprise.member}
                            </div>
                        </div>
                        <div class="profile-info-row">
                            <div class="profile-info-name">网格员电话</div>
                            <div class="profile-info-value">
                                ${enterprise.call_member}
                            </div>
                        </div>
                        <div class="profile-info-row">
                            <div class="profile-info-name">网格员照片</div>
                            <div class="profile-info-value">
                                <div style="width:100px;height:160px">
                                    <img style="width:100%;height:100%" src="${enterprise.photo_member}">
                                </div>
                            </div>
                        </div>

                        <div class="profile-info-row">
                            <div class="profile-info-name">存在问题Ⅰ</div>

                            <div class="profile-info-value">
                                ${enterprise.question1}
                            </div>
                        </div>
                        <div class="profile-info-row">
                            <div class="profile-info-name">存在问题Ⅱ</div>
                            <div class="profile-info-value">
                                ${enterprise.question2}
                            </div>
                        </div>
                        <div class="profile-info-row">
                            <div class="profile-info-name">存在问题Ⅲ</div>
                            <div class="profile-info-value">
                                ${enterprise.question3}
                            </div>
                        </div>
                        <div class="profile-info-row">
                            <div class="profile-info-name">存在问题Ⅳ</div>

                            <div class="profile-info-value">
                                ${enterprise.question4}
                            </div>
                        </div>
                        <div class="profile-info-row">
                            <div class="profile-info-name">存在问题Ⅴ</div>

                            <div class="profile-info-value">
                                ${enterprise.question5}
                            </div>
                        </div>

                    </div>
                    <div class="clearfix form-actions">
                        <div class="col-md-offset-3 col-md-9">
                            &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp;
                            <button class="btn" type="reset" onclick="goBack()">
                                <i class="icon-undo bigger-110"></i> 返回
                            </button>
                        </div>
                    </div>
                </div>
                <br>
            </div>
        </div>
    </div>
</body>
</html>
<!-- Baidu Map API -->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=AP2WVpt74KyxycTt7BwhEFDpP3VG1NF9"></script>


<script type="text/javascript">
    var lng = ${enterprise.lng};
    var lat = ${enterprise.lat};
    // 百度地图API功能
    var map = new BMap.Map("map");    // 创建Map实例
    map.centerAndZoom(new BMap.Point(lng, lat), 15);  // 初始化地图,设置中心点坐标和地图级别
    var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
    var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
    var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); //右上角，仅包含平移和缩放按钮
    map.addControl(top_left_control);
    map.addControl(top_left_navigation);
    map.addControl(top_right_navigation);
    map.setCurrentCity("郓城");          // 设置地图显示的城市 此项是必须设置的
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放


    var point = new BMap.Point(lng,lat);
    var marker = new BMap.Marker(point);
    map.addOverlay(marker);

    function goBack(){
        self.location = document.referrer;
    }
</script>