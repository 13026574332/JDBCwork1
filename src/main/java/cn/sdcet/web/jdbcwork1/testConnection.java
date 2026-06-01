package cn.sdcet.web.jdbcwork1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/test")
public class testConnection extends HttpServlet {

    private final String driver = "com.mysql.cj.jdbc.Driver";
    private Connection connection;
    private PreparedStatement preparedStatement = null;
    private final String url = "jdbc:mysql://localhost:3306/exam04";
    private final String username = "root";
    private final String password = "yinjunhao123456";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url,username,password);
//            preparedStatement = connection.prepareStatement("");

            if(connection != null){
                System.out.println("数据库连接成功:" + connection);
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }


    }
}
