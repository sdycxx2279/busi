<%--
  Created by IntelliJ IDEA.
  User: 26096
  Date: 2017/8/9
  Time: 0:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/ace.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/ace-rtl.min.css" />

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
                            <a href="#modal-table" role="button" class="green" data-toggle="modal"> 会员列表 </a>
                        </h4>
                        <div class="hr hr-18 dotted hr-double"></div>
                        <div class="nav-search" id="nav-search">
                            <form class="form-search">
                                <span class="span_margin">用户名：</span></span><span class="input-icon">
									<input type="text" placeholder="${userName}" class="nav-search-input" id="userName-search-input" autocomplete="off" />
									<i class="icon-search nav-search-icon"></i>
								</span>
                                <input type="button" id="submit" class="submit_button" value="提交" onclick="searchByuserNameAndphoneNumber()">
                            </form>
                        </div><!-- #nav-search -->
                        <div class="row">
                            <div class="col-xs-12">

                                <div class="table-responsive">
                                    <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                                        <thead class="table-header">
                                        <tr>
                                            <th class="center">用户编号</th>
                                            <th>用户名</th>
                                            <th>昵称</th>
                                            <th>用户权限</th>
                                            <th>管理操作</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach items="${userList}" var="item">
                                            <tr>
                                                <td class="center">
                                                        ${item.id}
                                                </td>

                                                <td>${item.username} </td>
                                                <td>${item.nickname}</td>
                                                <td>${item.ad}</td>
                                                <td>
                                                    <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
                                                        <!-- 编辑用户信息操作 -->
                                                        <a class="blue" href="">
                                                            <i class="icon-zoom-in bigger-130"></i>
                                                        </a>
                                                        <!-- 删除用户信息操作 -->
                                                        <a class="green" href="" onclick="deleteUser()">
                                                            <i class="icon-remove bigger-130"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <tr >
                                            <td colspan="10" style="text-align:left">
                                                <c:if test="${allPages>1}">
                                                    <div align="right" class="viciao">
                                                        <a href="javascript:void();" onclick="dividePage('${allPages}','${currentPage}','first')">&nbsp; 首 页 &nbsp;</a>
                                                        <a href="javascript:void();"onclick="dividePage('${allPages}','${currentPage}','prvious')">&nbsp;&lt;&nbsp; Prev &nbsp;</a>
                                                        <%
                                                            for (int i = currentPage - 2; i <= currentPage + 2
                                                                    && i <= allPages; i++) {
                                                                if (currentPage == i) {
                                                        %>
                                                        <span class="current"><%=i%></span>
                                                        <%
                                                        } else if (i > 0) {
                                                        %>
                                                        <a href="javascript:void();"onclick="dividePage('${allPages}','${currentPage}','<%=i%>')"><%=i%></a>
                                                        <%
                                                                }
                                                            }
                                                        %>
                                                        <a href="javascript:void();"onclick="dividePage('${allPages}','${currentPage}','next')">&nbsp;Next&nbsp;&gt;&nbsp;</a> <a
                                                            href="javascript:void();"onclick="dividePage('${allPages}','${currentPage}','last')">&nbsp;尾 页&nbsp; </a>
                                                    </div>
                                                </c:if>

                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div><!-- /.main-content -->
    </div><!-- /.main-container-inner -->
</div><!-- /.main-container -->

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
<script src="assets/js/userIndex.js"></script>
