package com.szu.appoint.entiy;

/**
 * 管理员角色
 *
 */
public class Admin {
	private long AdminId;
	private long AdminPassword;
	public Admin(){
		
	}
	
	
	public long getAdminId() {
		return AdminId;
	}


	public void setAdminId(long adminId) {
		AdminId = adminId;
	}


	public long getAdminPassword() {
		return AdminPassword;
	}


	public void setAdminPassword(long adminPassword) {
		AdminPassword = adminPassword;
	}


	@Override
	public String toString(){//易于开发测试
		return "[Admin:id="+this.AdminId+"  password="+this.getAdminPassword()+"]";
	}

}
