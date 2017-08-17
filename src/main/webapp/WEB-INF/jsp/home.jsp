<%--
  Created by IntelliJ IDEA.
  User: 26096
  Date: 2017/8/7
  Time: 16:16
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

    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/ace.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/ace-skins.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/home.css" />

    <script src="assets/js/jquery-1.7.1.min.js"></script>
    <script src="assets/js/ace-extra.min.js"></script>
</head>

<body>
<div class="navbar navbar-default" id="navbar">
    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand"> <small> <i
                    class="icon-leaf"></i> 丁里长镇党务政务电子管理系统
            </small>
            </a>
            <!-- /.brand -->
        </div>
        <!-- /.navbar-header -->

        <div class="navbar-header pull-right" role="navigation" style="padding-top: 10px;">
            <!-- /.ace-nav -->
            <a href="/quit.do" style="color:white;font-size:15px;"> <i class="icon-off"></i> 退出
            </a>
        </div>
        <!-- /.navbar-header -->
    </div>
    <!-- /.container -->
</div>

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#"> <span
                class="menu-text"></span>
        </a>

        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'fixed')
                } catch (e) {
                }
            </script>

            <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large"style="color:#438eb9">
                    欢迎，${LoginUser.nickname}
                </div>

                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span> <span class="btn btn-info"></span>

                    <span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
                </div>
            </div>
            <!-- #sidebar-shortcuts -->
            <!-- 菜单显示开始 -->
            <ul class="nav nav-list">
                <!-- <li class="active"><a href="index.html"> <i
                            class="icon-dashboard"></i> <span class="menu-text">
                                控制台</span>
                    </a></li> -->
                <c:forEach items="${menuList}" var="m0" varStatus="mainIndex">
                    <c:choose>
                        <c:when test="${empty m0.subMenus}">
                            <li><a href="javascript:void();"
                                   onclick="addIframe('','${m0.controller}','${m0.method}')">
                                <i class="icon-text-width"></i> <span class="menu-text">
                                    ${m0.name} </span>
                            </a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="#" class="dropdown-toggle"> <i
                                    class="icon-desktop"></i> <span class="menu-text">
                                    ${m0.name} </span> <b class="arrow icon-angle-down"></b>
                            </a>
                                <ul class="submenu">
                                    <c:forEach items="${ m0.subMenus}" var="m1"
                                               varStatus="mainIndex">
                                        <c:choose>
                                            <c:when test="${empty m1.subMenus}">
                                                <li><a href="javascript:void();"
                                                       onclick="addIframe('','${m1.controller}','${m1.method}')">
                                                    <i class="icon-double-angle-right"></i> ${m1.name}
                                                </a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li><a href="#" class="dropdown-toggle"> <i
                                                        class="icon-desktop"></i> <span class="menu-text">
                                                        ${m0.name} </span> <b class="arrow icon-angle-down"></b>
                                                </a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </ul></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
            <!-- /.nav-list -->

            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left"
                   data-icon1="icon-double-angle-left"
                   data-icon2="icon-double-angle-right"></i>
            </div>

            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'collapsed')
                } catch (e) {
                }
            </script>
        </div>

        <div class="main-content">
            <div class="page-content">
                <div class="addFrame">
                    <!-- 右侧显示 -->
                    <iframe src=" " class='active iframe-content' id="frameContent">
                    </iframe>
                </div>

                <!-- PAGE CONTENT ENDS -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.page-content -->
</div>
<!-- /.main-content -->
<!-- basic scripts -->

<script src="assets/js/home.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/typeahead-bs2.min.js"></script>
<script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="assets/js/jquery.slimscroll.min.js"></script>
<script src="assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="assets/js/jquery.sparkline.min.js"></script>
<script src="assets/js/flot/jquery.flot.min.js"></script>
<script src="assets/js/flot/jquery.flot.pie.min.js"></script>
<script src="assets/js/flot/jquery.flot.resize.min.js"></script>

<!-- ace scripts -->

<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>
</body>
</html>

