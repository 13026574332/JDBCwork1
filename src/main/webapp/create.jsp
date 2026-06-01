<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: yin
  Date: 2026/6/1
  Time: 18:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String driver = "com.mysql.cj.jdbc.Driver";
    Connection connection;
    PreparedStatement preparedStatement = null;
    String url = "jdbc:mysql://localhost:3306/bookstore?serverTimezone=UTC&useSSL=false";
    String username = "root";
    String password = "yinjunhao123456";

    try {
        Class.forName(driver);
        try {
            connection = DriverManager.getConnection(url,username,password);
            out.println("数据库连接成功<br>");
            String sql = "CREATE TABLE IF NOT EXISTS BOOKS (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY,\n" +
                    "book_name VARCHAR(100) NOT NULL,\n" +
                    "author VARCHAR(50) NOT NULL,\n" +
                    "publisher VARCHAR(100) NOT NULL,\n" +
                    "isbn VARCHAR(30) UNIQUE NOT NULL,\n" +
                    "price DECIMAL(10,2) NOT NULL,\n" +
                    "publish_date DATE NOT NULL\n" +
                    ")";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.executeUpdate();

            out.println("BOOKS表创建成功（或已存在）！");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    }
%>



</body>
</html>
