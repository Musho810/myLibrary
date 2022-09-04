<%@ page import="model.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Author" %><%--
  Created by IntelliJ IDEA.
  User: Toshiba
  Date: 04.09.2022
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Book</title>
</head>
<body>

<%
    Book book = (Book) request.getAttribute("book");
    List < Author> authorList = (List<Author>) request.getAttribute("authors");

%>

<h1> Please edit book`s data:</h1>
<form action="/books/edit" method="post">
    <input type="hidden" name="bookId" value="<%=book.getId()%>"/>
    <input type="text" name="title" value="<%=book.getTitle()%>"/><br>
    <input type="text" name="description" value="<%=book.getDescription()%>"/><br>
    <input type="number" name="price" value="<%=book.getPrice()%>"/><br>
    Author
    <select name="authorId">
        <% for (Author author : authorList) {
            if (author.equals(book.getAuthor())) {
        %>
        <option selected value="<%=author.getId()%>"><%=author.getName()%> <%=author.getSurname()%> >
        </option>
        <%
        } else { %>
        <option value="<%=author.getId()%>"><%=author.getName()%> <%=author.getSurname()%> >
        </option>

        <%
            }
        %>
        <%
            }
        %>

    </select> <br>
    <input type="submit" value="Update">

</form>


</body>
</html>
