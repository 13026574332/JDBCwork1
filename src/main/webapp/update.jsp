<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: yin
  Date: 2026/6/1
  Time: 19:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UpdatePrice</title>
</head>
<body>
<%
    String driver = "com.mysql.cj.jdbc.Driver";
    Connection connection;
    PreparedStatement preparedStatement = null;
    String url = "jdbc:mysql://localhost:3306/bookstore";
    String username = "root";
    String password = "yinjunhao123456";

    try {
        Class.forName(driver);
        try {
            connection = DriverManager.getConnection(url,username,password);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    }

    String sql = "UPDATE books SET price = 20.00 WHERE book_name = 'XML实用教程'";

    try {
        preparedStatement = connection.prepareStatement(sql);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }

    int line = 0;

    try {
        line = preparedStatement.executeUpdate(sql);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }

    if(line > 0){
        out.println("有" + line + "行数据发生了修改！");
    }else{
        out.println("数据更改失败");
    }
%>
</body>
</html>
