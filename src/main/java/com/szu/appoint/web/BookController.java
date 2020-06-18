package com.szu.appoint.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.junit.runner.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.szu.appoint.dao.BookDao;
import com.szu.appoint.dto.AppointExecution;
import com.szu.appoint.dto.Result;
import com.szu.appoint.entiy.Admin;
import com.szu.appoint.entiy.Appointment;
import com.szu.appoint.entiy.Book;
import com.szu.appoint.entiy.Student;
import com.szu.appoint.enums.AppointStateEnum;
import com.szu.appoint.service.BookService;
import com.szu.appoint.exception.RepeatAppointException;
import com.szu.appoint.exception.AppointException;
import com.szu.appoint.exception.NoNumberException;
 

@Controller
@RequestMapping("/books")
public class BookController {
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	@Autowired
	private BookService bookService;
	//获取图书列表
	@RequestMapping(value="/list",method = RequestMethod.GET)
	private String List(Model model){
		List<Book> list = bookService.getList();
		model.addAttribute("list", list);
		
		return "list";
	}
	@RequestMapping(value="/admin/{adminId}",method=RequestMethod.GET)
	private String Toadmin(@PathVariable("adminId")long adminId,Model model){
		model.addAttribute("adminName", adminId);
		return "admin";
		
	}
	@RequestMapping(value="/login")
	private String Login(){
		return "login";
	}
	//搜索是否有某图书
	@RequestMapping(value="/search",method = RequestMethod.POST)
	private void  search(HttpServletRequest req,HttpServletResponse resp) 
								throws ServletException, IOException{
		//接收页面的值
		String name=req.getParameter("name");
		name=name.trim();
		
		//向页面传值
		req.setAttribute("name", name);
		req.setAttribute("list", bookService.getSomeList(name)); 
		req.getRequestDispatcher("/WEB-INF/jsp/list.jsp").forward(req, resp); 
	}
	//查看某图书的详细情况
	@RequestMapping(value = "/{bookId}/detail", method = RequestMethod.GET)
	private String detail(@PathVariable("bookId") Long bookId, Model model){
		if(bookId==null){
			return "redirect:/book/list";
		}
		Book book=bookService.getById(bookId);
		if(book==null){
			return "forward:/book/list"; 
		}
		model.addAttribute("book",book);
		System.out.println(book);
		return "detail";
	}
	//验证输入的用户名、密码是否正确
	@RequestMapping(value="/verify", method = RequestMethod.POST, produces = {
													"application/json; charset=utf-8" })
	@ResponseBody
	private Map<String,String> validate(Long studentId,Long password){   //(HttpServletRequest req,HttpServletResponse resp){
		Map<String,String> resultMap=new HashMap<String,String>(); 
		Student student =null;  
		System.out.println("验证函数"); 
		student =bookService.validateStu(studentId,password);
		
		System.out.println("输入的学号、密码："+studentId+":"+password);

		
		if(student!=null){
			System.out.println("SUCCESS");
			resultMap.put("result", "SUCCESS");
			return resultMap;
		}else{ 
			resultMap.put("result", "FAILED");
			return resultMap;
		}
		
	}
	//执行预约的逻辑
	@RequestMapping(value = "/{bookId}/appoint", method = RequestMethod.POST, produces = {
	"application/json; charset=utf-8" })
	@ResponseBody
	private Result<AppointExecution> execute(@PathVariable("bookId") Long bookId,@RequestParam("studentId") Long studentId){
		Result<AppointExecution> result;
		AppointExecution execution=null;
		
		try{//手动try catch,在调用appoint方法时可能报错
			execution=bookService.appoint(bookId, studentId);
			result=new Result<AppointExecution>(true,execution); 
				return result; 
				
		} catch(NoNumberException e1) {
			execution=new AppointExecution(bookId,AppointStateEnum.NO_NUMBER);
			result=new Result<AppointExecution>(true,execution);
				return result;
		}catch(RepeatAppointException e2){
			execution=new AppointExecution(bookId,AppointStateEnum.REPEAT_APPOINT);
			result=new Result<AppointExecution>(true,execution);
				return result;
		}catch (Exception e){
			execution=new AppointExecution(bookId,AppointStateEnum.INNER_ERROR); 
			result=new Result<AppointExecution>(true,execution);
				return result;
		} 
	}
	@RequestMapping(value ="/appoint")
	private String appointBooks(@RequestParam("studentId") long studentId,Model model){
		
		List<Appointment> appointList=new ArrayList<Appointment>();
		appointList=bookService.getAppointByStu(studentId);
		model.addAttribute("appointList", appointList);
		 
		return "appointBookList";
	}
	@RequestMapping(value="/cancel", method = RequestMethod.GET, produces = {
	"application/json; charset=utf-8" })
	@ResponseBody
	private boolean Cancel_appoint(@RequestParam("studentId")long studentId,@RequestParam("bookId")long bookId){
		try{
			bookService.Cancel_appointment(bookId, studentId);
		}catch(AppointException e){
			return false;        //网络问题取消预约失败 !!!!!
		}
		return true;
	}
	
	@RequestMapping(value="/vaildateAdmin", method=RequestMethod.POST ,produces={
	"application/json;charset=utf-8"    //produces属性 指定请求返回的类型
	})
	@ResponseBody     //写入responseBody
	private HashMap<String, String> quaryAdmin(@RequestParam("adminId")long adminId,@RequestParam("adminPassword") long adminPassword){
		Admin admin=bookService.quaryAdmin(adminId, adminPassword);
		HashMap<String, String> result=new HashMap<String, String>();
		if(admin!=null){
			System.out.println(admin);
			result.put("result", "success");
		}else{
			result.put("result", "fail");
			System.out.println(admin);
		}
		return result;
	}
	
	@RequestMapping(value="admin/works",method=RequestMethod.GET)
	private String getBooklist(Model model,@RequestParam("page")int page){  //model 用于传输数据
		int count=bookService.getCount();
		int flage=count%6;
		int pageNumber=0;
		if(flage==0){
			pageNumber=count/6;
		}else{
			pageNumber=count/6+1;
		}
		List<Book> list=bookService.queryPart((page-1)*6, 6);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("currentpage", page);
		model.addAttribute("list", list);
		return "work";
	}
	
	@RequestMapping(value="admin/search",method=RequestMethod.GET)
	private void search_admin(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{
		String name=req.getParameter("name");
		name=name.trim();
		List<Book> list=bookService.getSomeList(name);
		req.setAttribute("list", list);
		req.setAttribute("name", name);
		req.getRequestDispatcher("/WEB-INF/jsp/work.jsp").forward(req, resp);
	}
	@RequestMapping(value="admin/change", method=RequestMethod.POST)
	@ResponseBody
	private void change_number(@RequestParam(value="number")int number,@RequestParam(value="bookname")String bookname){
		bookService.changeNumber(number, bookname);
	}
	@RequestMapping(value="admin/addbook", method=RequestMethod.POST)
	private String addBook(@RequestParam("add_bookname")String bookname,@RequestParam("add_booknumber") int booknumber,@RequestParam("add_bookinfo")String bookinfo){
		bookService.addBook(bookname, booknumber, bookinfo);
		return "redirect:/books/admin/works?page=1";
	}
	
}
