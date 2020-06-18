package com.szu.appoint.service;

import java.util.List;

import com.szu.appoint.dto.AppointExecution;
import com.szu.appoint.entiy.Admin;
import com.szu.appoint.entiy.Appointment;
import com.szu.appoint.entiy.Book;
import com.szu.appoint.entiy.Student; 

public interface BookService {
	/**
	 * 查询一本图书
	 * 
	 * @param bookId
	 * @return
	 */
	Book getById(long bookId);  
	/**
	 * 查询所有图书
	 * 
	 * @return
	 */
	List<Book> getList();
	/**
	 * 登陆时查询数据库是否有该学生记录。
	 */
	Student validateStu(Long studentId,Long password);
	/**按照图书名称查询
	 * 按条件搜索图书
	 * 
	 */ 
	List<Book> getSomeList(String name);
	/*
	 * 查看某学生预约的所有图书
	 * 
	 */
	List<Appointment> getAppointByStu(long studentId);
	/**
	 * 预约图书
	 * 
	 * @param bookId
	 * @param studentId
	 * @return
	 */
	AppointExecution appoint(long bookId, long studentId);//返回预约成功的实体类
	
	/**
	 * 取消预约
	 */
	boolean Cancel_appointment(long bookId,long studentId);
	
	/**
	 * 管理员账号验证
	 */
	Admin quaryAdmin(long adminId,long adminPassword);
	
	int changeNumber(int number,String bookname);
	
	int getCount();
	
	List<Book> queryPart(int offset,int limit);
	
	void addBook(String bookname,int booknumber,String bookinfo);
}
