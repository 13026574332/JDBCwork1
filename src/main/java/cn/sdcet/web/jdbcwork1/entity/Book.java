package cn.sdcet.web.jdbcwork1.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Book {
    private Integer id;
    private String book_name;
    private String author;
    private String publisher;
    private String isbn;
    private Double price;
    private Date publish_date;

}
