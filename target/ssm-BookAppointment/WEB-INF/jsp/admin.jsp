<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="common/tag.jsp"%>  <!--引入jstl标签库  -->
<!DOCTYPE html>
<html>
	<head>
		<title>管理员界面</title>
		<%@include file="common/head.jsp" %> <!-- 引入bootstrap -->
		<style>
		.put-right{
			text-align:right;
			color:black;
		}
		</style>
	</head>
  <body>
    <div class="container">
      <h1 class="page-header">
        	管理员界面
      </h1>
      <hr>
      <div class="row">
        <div class="col-xs-4">
          <div class="thumbnail">
            <img src="<%=request.getContextPath() %>/resources/image/book1.jpg" alt="">
            <div class="caption">
              <h3>查看库存</h3>
              <p>查看各类书籍的剩余情况</p>
              <p>
                <a href="<%=request.getContextPath() %>/books/admin/works?page=1" class="btn btn-primary" role="button">前往</a>
              </p>
            </div>
          </div>
        </div>
        <div class="col-xs-4">
          <div class="thumbnail">
            <img src="<%=request.getContextPath() %>/resources/image/book2.jpg" alt="">
            <div class="caption">
              <h3>新增书籍</h3>
              <p>添加新的书籍及可预约数量</p>
              <p>
                <a href="<%=request.getContextPath() %>/books/admin/works?page=1" class="btn btn-primary" role="button">前往</a>
              </p>
            </div>
          </div>
        </div>
        <div class="col-xs-4">
          <div class="thumbnail">
            <img src="<%=request.getContextPath() %>/resources/image/book3.jpg" alt="">
            <div class="caption">
              <h3>预约管理</h3>
              <p>查看预约情况与对预约的处理</p>
              <p>
                <a href="" class="btn btn-primary" role="button">前往</a>
              </p>
            </div>
          </div>
        </div> 
      </div>
    </div>
       
  </body>
	
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
	
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</html>

