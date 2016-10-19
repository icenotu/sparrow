<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016-08-28
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="${pageContext.request.contextPath}/supplier/insert.form" method="post">
    供应商名称：<input type="text" name="supName" >
    联系人：<input type="text" name="supLinkman" >
    电话：<input type="text" name="supPhone" >
    地址：<input type="text" name="supAddress" >
    备注：<input type="text" name="supRemark" >
      <input type="submit" value="提交">
  </form>
  </body>
</html>
