package com.szu.appoint.service.Impl;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.szu.appoint.dao.AdminDao;
import com.szu.appoint.dao.AppointmentDao;
import com.szu.appoint.dao.BookDao;
import com.szu.appoint.dao.StudentDao;
import com.szu.appoint.dto.AppointExecution;
import com.szu.appoint.entiy.Admin;
import com.szu.appoint.entiy.Appointment;
import com.szu.appoint.entiy.Book;
import com.szu.appoint.entiy.Student;
import com.szu.appoint.enums.AppointStateEnum;
import com.szu.appoint.exception.AppointException;
import com.szu.appoint.exception.NoNumberException;
import com.szu.appoint.exception.RepeatAppointException;
import com.szu.appoint.service.BookService;
 
@Service
public class BookServiceImpl implements BookService{
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	@Autowired
	private BookDao bookDao;
	@Autowired
	private AppointmentDao appointmentDao;
	@Autowired
	private StudentDao studentDao; 
	@Autowired
	private AdminDao admindao;
	public Book getById(long bookId) { 
		return bookDao.queryById(bookId);
	}  
	
	public List<Book> getList() { 
		return bookDao.queryAll(0, 1000);
	} 
	
	public Student validateStu(Long studentId,Long password){
		return studentDao.quaryStudent(studentId, password);
	}
	
	public List<Book> getSomeList(String name) {
		 
		return bookDao.querySome(name);
	} 
	
	public List<Appointment> getAppointByStu(long studentId) {//DOTO
		return appointmentDao.quaryAndReturn(studentId);
		 
	}
	
	@Transactional
	public AppointExecution appoint(long bookId, long studentId) {//在Dao的基础上组织逻辑，形成与web成交互用的方法
		try{													  //返回成功预约的类型。		
			int update=bookDao.reduceNumber(bookId);//减库存
			if(update<=0){//已经无库存！
				throw new NoNumberException("no number");
			}else{
				//执行预约操作
				int insert=appointmentDao.insertAppointment(bookId, studentId);
				if(insert<=0){//重复预约
					throw new RepeatAppointException("repeat appoint");
				}else{//预约成功
					return new AppointExecution(bookId,AppointStateEnum.SUCCESS);
				}
				
			}
		} catch (NoNumberException e1) {
			throw e1;
		} catch (RepeatAppointException e2) {
			throw e2;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			// 所有编译期异常转换为运行期异常
			throw new AppointException("appoint inner error:" + e.getMessage());
		}
	}
	
	@Transactional //默认遇到运行期异常回滚
	@Override
	public boolean Cancel_appointment(long bookId, long studentId) {
		try{
			int delete=appointmentDao.Delete_appointment(studentId, bookId);
			int update=bookDao.increaseNumber(bookId);
			return true;
		}catch(Exception e){
			throw new AppointException("appointment cancel error:"+e.getMessage()); //遇到异常 转换为运行期异常 事务回滚
		}
		
	}

	@Override
	public Admin quaryAdmin(long adminId, long adminPassword) {
		return admindao.quaryAdmin(adminId, adminPassword);
	}

	@Override
	public int changeNumber(int number, String bookname) {
		return bookDao.changeNumber(number, bookname);
	}

	@Override
	public int getCount() {
		return bookDao.getCount();
	}

	@Override
	public List<Book> queryPart(int offset, int limit) {
		return bookDao.queryAll(offset, limit);
	}

	@Override
	public void addBook(String bookname, int booknumber, String bookinfo) {
		bookDao.addBook(bookname, booknumber, bookinfo);
		
	}
	

 
}
