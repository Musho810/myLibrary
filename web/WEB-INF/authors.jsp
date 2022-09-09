<%@ page import="model.Author" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Toshiba
  Date: 04.09.2022
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Authors</title>
</head>
<body>
<h1 style="color: red; text-align: center ">ALL AUTHORS</h1>

<%
    List<Author> authorList = (List<Author>) request.getAttribute("authors");

%>
<a href="/homePage">Home</a>
<table border="1">
    <tr>
        <th> id</th>
        <th> Image</th>
        <th> name</th>
        <th> surname</th>
        <th> email</th>
        <th> age</th>

        <th> action</th>
    </tr>
    <% for (Author author : authorList) {
    %>
    <tr>
        <td><%=author.getId()%>
        </td>
        <td>
            <% if (author.getAuthorPic()==null || author.getAuthorPic().length()==0) { %>
            <img src="/images/defaultAuthorPic.jpg" width="50">
            <% } else { %>
            <img src="/getAuthorImage?authorPic=<%=author.getAuthorPic()%>" width="50">
            <% } %>
        </td>
        <td><%=author.getName()%>
        </td>
        <td><%=author.getSurname()%>
        </td>
        <td><%=author.getEmail()%>
        </td>
        <td><%=author.getAge()%>
        </td>

        <td>
            <a href="/authors/remove?authorId=<%=author.getId()%>">Remove</a> |
            <a href="/authors/edit?authorId=<%=author.getId()%>">Edit</a>
        </td>

    </tr>
    <%
        }
    %>

</table>
</body>
</html>
