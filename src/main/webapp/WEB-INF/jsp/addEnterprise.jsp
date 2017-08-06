<%--
  Created by IntelliJ IDEA.
  User: 26096
  Date: 2017/8/5
  Time: 11:34
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

    <title>CKEditor</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</head>

<body>
<form id="form1" name="form1" method="post" action="display.jsp">
    <table width="650" height="400" border="0" align="center">
        <tr>
            <td valign="top">
                内容:
            </td>
            <td>
                <textarea id="editor1" name="editor1">&lt;p&gt;Initial value.&lt;/p&gt;</textarea>
                <script type="text/javascript">
                    CKEDITOR.replace( 'editor1' );
                </script>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" name="Submit" value="提交" />
            </td>
        </tr>
    </table>
</form>
</body>
</html>

</body>
</html>
