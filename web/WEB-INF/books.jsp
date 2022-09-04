<%@ page import="model.Book" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Toshiba
  Date: 04.09.2022
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books</title>
</head>
<body>

<%
    List<Book> bookList = (List<Book>) request.getAttribute("books");
%>
<table border="1">
    <tr>
        <th> id</th>
        <th> tittle</th>
        <th> description</th>
        <th> price</th>
        <th> author name and surname</th>
        <th> action</th>
    </tr>
    <% for (Book book : bookList) {
    %>
    <tr>
        <td><%=book.getId()%>
        </td>
        <td><%=book.getTitle()%>
        </td>
        <td><%=book.getDescription()%>
        </td>
        <td><%=book.getPrice()%>
        </td>
        <td>
            <% if (book.getAuthor() != null) { %>
            <%=book.getAuthor().getName()  %>    <%=book.getAuthor().getSurname()%>
            <%} else {%>
            <span style=" color: red"> There is no author </span>
            <%}%>
        </td>
        <td>
            <a href="/books/remove?bookId=<%=book.getId()%>"> Remove </a> |
            <a href="/books/edit?bookId=<%=book.getId()%>"> Edit </a>
        </td>


    </tr>
    <%
        }
    %>

</table>


</body>
</html>
