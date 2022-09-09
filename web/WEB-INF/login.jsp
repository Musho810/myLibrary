<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: Toshiba
  Date: 09.09.2022
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LOG IN</title>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");


%>
<%
    String msg = (String) request.getAttribute("msg");
%>
<%if (msg !=null) {%>
<p style=" color: red "><%=msg%></p>
<% } %>
<h1> Please input yor email and password</h1><br>
<form action="/login" method="post">
    <input type="email" name="useremail" placeholder="Please input email"/><br>
    <input type="password" name="password" placeholder="Please input password"/><br>
    <input type="submit" value="LOGIN">
</form>
</body>
</html>
