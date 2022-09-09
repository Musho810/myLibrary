<%--
  Created by IntelliJ IDEA.
  User: Toshiba
  Date: 09.09.2022
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>REGISTRATION</title>
</head>
<body>
<%
    String msg = (String) request.getAttribute("msg");
%>

<%if (msg !=null) {%>
<p style=" color: red "><%=msg%></p>
<% } %>

<form action="/registration" method="post" >
    <input type="text" name="username" placeholder="Please input user name"/><br>
    <input type="text" name="usersurname" placeholder="Please input user surname"/><br>
    <input type="email" name="useremail" placeholder="Please input user email"/><br>
    <input type="password" name="userpassword" placeholder="Please input user password"/><br>

   <br>

    <input type="submit" value="Register">


</form>

</body>
</html>
