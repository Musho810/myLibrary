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
    <title>Add Book</title>
</head>
<body>
<% List<Author> authorList = (List<Author>) request.getAttribute("authors");

%>

<h1> Please input book`s data:</h1>
<form action="/books/add" method="post">
    <input type="text" name="title" placeholder="Please input book title"/><br>
    <input type="text" name="description" placeholder="Please input book description"/><br>
    <input type="number" name="price" placeholder="Please input book price"/><br>
    Author
    <select name="authorId">
        <% for (Author author : authorList) {
        %>
        <option value="<%=author.getId()%>"><%=author.getName()%> <%=author.getSurname()%></option>
        <%
            }
        %>
    </select> <br>
    <input type="submit" value="ADD">

</form>


</body>
</html>
