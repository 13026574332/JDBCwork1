<%@ page import="java.util.List" %>
<%@ page import="cn.sdcet.web.jdbcwork1.entity.Book" %><%--
  Created by IntelliJ IDEA.
  User: yin
  Date: 2026/6/1
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>booksList</title>
</head>
<body>
<jsp:useBean id="BookService" class="cn.sdcet.web.jdbcwork1.Service.impl.BookServiceImpl" scope="session"/>
<table border="1" cellpadding="8" cellspacing="0">

    <tr>
        <th>书名</th>
        <th>作者</th>
        <th>出版社</th>
        <th>刊号</th>
        <th>价格</th>
        <th>出版日期</th>
    </tr>

    <%
        List<Book> bookList = BookService.GetBooksByPrice();
        for(Book book:bookList){
    %>
    <tr>
        <td><%=book.getBook_name()%></td>
        <td><%=book.getAuthor()%></td>
        <td><%=book.getPublisher()%></td>
        <td><%=book.getIsbn()%></td>
        <td><%=book.getPrice()%></td>
        <td><%=book.getPublish_date()%></td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>
