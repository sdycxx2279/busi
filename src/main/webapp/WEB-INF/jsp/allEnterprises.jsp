<%--
  Created by IntelliJ IDEA.
  User: 26096
  Date: 2017/8/11
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
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
                            <a href="#modal-table" role="button" class="green" data-toggle="modal"> 企业列表 </a>
                        </h4>
                        <div class="hr hr-18 dotted hr-double"></div>
                        <div class="nav-search" id="nav-search">
                            <form class="form-search">
                                <span class="span_margin">企业名：</span></span><span class="input-icon">
                                <input type="text" value="${name}" class="nav-search-input"
                                       id="name-search-input" autocomplete="off"/>
                                <i class="icon-search nav-search-icon"></i>
                            </span>
                                <span class="span_margin">网格长：</span></span><span class="input-icon">
                                    <input type="text" value="${leader}" class="nav-search-input"
                                           id="leader-search-input" autocomplete="off"/>
                                    <i class="icon-search nav-search-icon"></i>
                                </span>
                                <span class="span_margin">网格员：</span></span><span class="input-icon">
                                    <input type="text" value="${member}" class="nav-search-input"
                                           id="member-search-input" autocomplete="off"/>
                                    <i class="icon-search nav-search-icon"></i>
                                </span>
                                <span class="span_margin">级别：</span></span><span class="input-icon">
                                <select name="ad" id="level-search-input">
                                    <option value="0">----请选择----</option>
                                    <option value="1">红色</option>
                                    <option value="2">黄色</option>
                                    <option value="3">绿色</option>
                                </select>
                            </span>
                                <span class="span_margin">截止日期：</span></span><span class="input-icon">
                                <input type="date" value="${deadline}" class="nav-search-input"
                                       id="deadline-search-input" autocomplete="off"/>
                                <i class="icon-search nav-search-icon"></i>
                            </span>
                                <span class="span_margin">企业类别：</span></span><span class="input-icon">
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
                        <div class="row">
                            <div class="col-xs-12">

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
                                            <th>管理操作</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach items="${enterpriseList}" var="item">
                                            <tr>
                                                <td class="center">
                                                        ${item.name}
                                                </td>

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
                                                    <c:forEach items="${typeList}" var="tag">
                                                        <c:if test="${tag.id==item.type}">
                                                            <c:out value="${tag.name}"/>
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td>
                                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${item.deadline}"/>
                                                </td>
                                                <td>
                                                    <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
                                                        <!-- 编辑用户信息操作 -->
                                                        <a class="blue" href="">
                                                            <i class="icon-zoom-in bigger-130"></i>
                                                        </a>
                                                        <!-- 删除用户信息操作 -->
                                                        <a class="red" href="javascript:void();" onclick="deleteEnterprise(${item.id},${allPages},${currentPage},${currentPage})">
                                                            <i class="icon-remove bigger-130"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <td colspan="10" style="text-align:left">
                                                <c:if test="${allPages>1}">
                                                    <div align="right" class="viciao">
                                                        <a href="javascript:void();"
                                                           onclick="dividePage('${allPages}','${currentPage}','first')">&nbsp;
                                                            首 页 &nbsp;</a>
                                                        <a href="javascript:void();"
                                                           onclick="dividePage('${allPages}','${currentPage}','previous')">&nbsp;&lt;&nbsp;
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
                    </div><!-- /.col -->
                </div><!-- /.row -->
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
<script src="assets/js/allEnterprises.js"></script>>

<script type="text/javascript">
    var level = ${level};
    document.getElementById("level-search-input")[level].selected=true;
    var message = ${message};
    if(message==1)
        alert("系统故障，请稍后再试！");
</script>