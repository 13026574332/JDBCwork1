<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: yin
  Date: 2026/6/1
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>插入</title>
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

    String sql = "INSERT INTO books(book_name, author, publisher,isbn,price,publish_date) VALUES" +
            " ('Tomcat与Java Web开发技术详解', '孙卫琴', '电子工业出版社', '7-5053-9392-8', 45.00, '2004-04-01'),\n" +
            "('Java Web开发详解', '孙鑫', '电子工业出版社', '7-121-02396-2', 99.00, '2006-04-01'),\n" +
            "('XML实用教程', '丁跃潮', '北京大学出版社', '7-301-10462-6', 26.00, '2006-01-01'),\n" +
            "('HTML编程指南', '武焰', '电子工业出版社', '7-5053-5186-9', 28.00, '1999-06-01');";

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
        out.println("数据插入失败");
    }


%>
</body>
</html>
