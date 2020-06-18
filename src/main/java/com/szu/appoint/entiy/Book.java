package com.szu.appoint.entiy;

public class Book {
	
	private long bookId;//图书ID
	private String name;//图书名称
	private int number;//馆藏数量 
	private String introd; //图书介绍
	public Book() {  //为什么要有个无参构造器
	}
	public Book(long bookId, String name, int number) { 
		this.bookId = bookId;
		this.name = name;
		this.number = number;
	}
	public long getBookId() {
		return bookId;
	}
	public void setBookId(long bookId) {
		this.bookId = bookId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getIntrod() {
		return introd;
	}
	public void setIntrod(String introd) {
		this.introd = introd;
	}

	@Override
	public String toString() {  //重写toString方法 返回具体信息
		return "Book [bookId=" + bookId + ", name=" + name + ", number=" + number + ", introd=" + introd + "]";
	}
}
