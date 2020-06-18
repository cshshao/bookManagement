<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="common/tag.jsp"%>
<html>
	<head>
		<title>登陆界面</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="utf-8">
    	<%@include file="common/head.jsp" %>
		<style>
			body {  
			  background-image: url("<%=request.getContextPath()%>/resources/image/Login.jpg");    
			  background-repeat: no-repeat;  
			  background-attachment: fixed;  
			  background-size:100% 100%;
			} 
		</style>
	</head>
	<body >
	    <div class="container">
	      <h1 class="page-header" > 图书预约</h1>
		  <ul id="mytab" class="nav nav-pills">
		  	<li class="active">
		  		<a href="#student" data-toggle="tab"> <!-- 页面内定位 -->
		  			学生登陆
		  		</a>
		  	</li>
		  	<li>
		  		<a href="#admin" data-toggle="tab">
		  			管理员登陆
		  		</a>
		  	</li>
		  </ul>
		  <div id="myTabContent" class="tab-content">
		  	 <div class="tab-pane fade in active" id="student">
		        <input type="text" id="student_id" name="student_id" class="form-control" placeholder="学号" required autofocus>
		        <input type="password" id="student_password" name="student_password" class="form-control" placeholder="密码" required>
		        <div class="checkbox">
		          <label>
		            <input type="checkbox" value="remember-me"> Remember me
		          </label>
		        </div>
		        <button id="studentsub" class="btn btn-lg btn-primary btn-block" >Sign in</button>
		      </div>
		     <div class="tab-pane fade" id="admin">
		        <input type="text" id="admin_id" name="admin_id" class="form-control" placeholder="教工号 " required autofocus>
		        <input type="password" id="admin_password" name="admin_password" class="form-control" placeholder="密码" required>
		        <div class="checkbox">
		          <label>
		            <input type="checkbox" value="remember-me"> Remember me
		          </label>
		        </div>
		        <button id="adminsub" class="btn btn-lg btn-primary btn-block" type="submit" >Sign in</button>
	      	 </div>
	      	 <div  id="showmessage" class="alert alert-danger hidden">
             <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
             </button>
           		 账号密码不一致！
             </div>

	    </div> 
	  </div>
	  <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
	  <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	  <%--jQuery Cookie操作插件--%>
	  <script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
	  <script src="<%=request.getContextPath() %>/resources/script/login.js"></script>
	  <script type="text/javascript">
		$(function(){
			login.Student.action("<%=request.getContextPath()%>");
			login.Admin.action("<%=request.getContextPath()%>");
		});
		
	  </script>
	    
</html>
