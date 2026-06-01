package cn.sdcet.web.jdbcwork1.Service.impl;

import cn.sdcet.web.jdbcwork1.Service.BookService;
import cn.sdcet.web.jdbcwork1.entity.Book;
import com.mysql.cj.protocol.Resultset;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BookServiceImpl implements BookService {
    private final String driver = "com.mysql.cj.jdbc.Driver";
    private Connection connection;
    private PreparedStatement preparedStatement = null;
    private final String url = "jdbc:mysql://localhost:3306/exam04";
    private final String username = "root";
    private final String password = "yinjunhao123456";
    @Override
    public List<Book> GetBooks() {

        List<Book> bookList = new ArrayList<>();

        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url,username,password);


            String sql = "select * from books";
            preparedStatement = connection.prepareStatement(sql);
            ResultSet resultset =  preparedStatement.executeQuery();
            while(resultset.next()){
                int id = resultset.getInt(1);
                String book_name = resultset.getString(2);
                String author = resultset.getString(3);
                String publisher = resultset.getString(4);
                String isbn = resultset.getString(5);
                Double price = resultset.getDouble(6);
                Date publish_date = resultset.getDate(7);
                Book book = new Book(id,book_name,author,publisher,isbn,price,publish_date);
                System.out.println("正在添加第" + id + "本书！");
                bookList.add(book);
            }


        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return bookList;
    }

    @Override
    public List<Book> GetBooksByPrice() {
        List<Book> bookList = new ArrayList<>();
        List<Book> newBookList = new ArrayList<>();

        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url,username,password);


            String sql = "select * from books order by price ASC";
            preparedStatement = connection.prepareStatement(sql);
            ResultSet resultset =  preparedStatement.executeQuery();

            while(resultset.next()){
                int id = resultset.getInt(1);
                String book_name = resultset.getString(2);
                String author = resultset.getString(3);
                String publisher = resultset.getString(4);
                String isbn = resultset.getString(5);
                Double price = resultset.getDouble(6);
                Date publish_date = resultset.getDate(7);
                Book book = new Book(id,book_name,author,publisher,isbn,price,publish_date);
                System.out.println("正在添加第" + id + "本书！");
                bookList.add(book);
            }


        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return bookList;
    }
}
