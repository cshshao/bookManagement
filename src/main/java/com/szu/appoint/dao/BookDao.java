package com.szu.appoint.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.szu.appoint.entiy.Book;

public interface BookDao {
	/*
	 * 根据id查询书
	 * 
	 */
	Book queryById(long id);
	List<Book> querySome(String name);
	List<Book> queryAll(@Param("offset") int offset,@Param("limit") int limit);

	
	int getCount();
	
	/*减少管存数量
	 * 用返回值可判断当前库存是否还有书
	 */
	 int reduceNumber(long bookId);
	 
	 /**
	 * 取消预约 馆藏数量+1
	 * 
	 */
	 int increaseNumber(long bookId);
	 
	 int changeNumber(@Param("number")int number,@Param("bookname")String bookname);
	 
	 void addBook(@Param("bookName")String bookName,@Param("bookNumber")int bookNumber,@Param("bookinfo")String bookinfo);
	 
}
