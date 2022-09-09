<%@ page import="model.Author" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Toshiba
  Date: 04.09.2022
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Author</title>
</head>
<body>
<%
    Author author = (Author) request.getAttribute("author");
    List <Author> authorList = (List<Author>) request.getAttribute("authors");

%>

<h1> Please edit author`s data:</h1>
<a href="/homePage">Home</a>
<form action="/authors/edit" method="post"enctype="multipart/form-data">
    <input type="hidden" name="authorId" value="<%=author.getId()%>"/>
    <input type="text" name="name" value="<%=author.getName()%>"/><br>
    <input type="text" name="surname" value="<%=author.getSurname()%>"/><br>
    <input type="text" name="email" value="<%=author.getEmail()%>"/><br>
    <input type="number" name="age" value="<%=author.getAge()%>"/><br>
    <input type="file" name="authorPic" value="<%=author.getAuthorPic()%>">

    <input type="submit" value="UpDate">

</form>
</body>
</html>
