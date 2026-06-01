package cn.sdcet.web.jdbcwork1.Service;

import cn.sdcet.web.jdbcwork1.entity.Book;

import java.util.List;

public interface BookService {
    public List<Book> GetBooks();
    public List<Book> GetBooksByPrice();
}
