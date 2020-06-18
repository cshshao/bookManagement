<%@ page language="java"  contentType="text/html; charset=UTF-8"%>
<%@ include file="common/tag.jsp" %> 	<!-- taglib 标签库 -->
<html>
  <head>
    <title>管理列表</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- bootstrap 响应式 -->
	<meta charset="utf-8">
   	<%@include file="common/head.jsp" %>
   	<script type="text/javascript">
   		var currentpage="${currentpage}";
   		var pageNumber="${pageNumber}";
   		var url="<%=request.getContextPath()%>";
   	</script>
  </head>
  <body>
	<body>
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-heading text-center">
					<h2> 馆藏情况</h2>
				</div>
			</div>
			<form name="secondForm" action="<%=request.getContextPath() %>/books/admin/search" method="get">
				<div class="panel-heading">
					<table>
						<thead>
							<tr>
								<th width="90" align="left">
									图书名称
								</th>
								<th width="150" align="left">
									<input type="text" name="name" class="allinput" value="${name}"  placeholder="请输入检索名">
								</th>
								<th >
									<input type="submit" class="btn-primary"  value="检索"/>
								</th>	
							</tr>
						</thead>
					</table>
				</div>
			</form>
			<div class="text-right">
				<h3>
					<button class="btn btn-primary" id="add_button" onclick="work.add();">新增书籍>></button>
				</h3>
			</div>
			<div class="panel-body">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>图书ID</th>
							<th>图书名称</th>
							<th>馆藏数量</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list}" var="sk">
						<tr>
							<td>${sk.bookId}</td>
							<td>${sk.name}</td>
							<td>${sk.number}</td>
							<td>
								<button type="button" class="btn-link" data-toggle="collapse" data-target="#demo${sk.bookId }"> 增加/减少</button>
								<div id="demo${sk.bookId }"  class="collapse">
									<div class="form group">
										<label>选择</label>
										<select class="form-control"  id="${sk.bookId}" >
											<option value="1">+1</option>
											<option value="2">+2</option>
											<option value="-1">-1</option>
											<option value="-2">-2</option>
										</select>
									</div>
									<div align="right">
										<input type="submit" id="change_button" class="btn btn-primary"  onclick="work.sure('<%=request.getContextPath() %>','${sk.name}',${sk.bookId });"  value="确定"/>
									</div>
								</div> 
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="panel-body text-center">
				<ul id="pageexp">
				</ul>
			</div>
			<div class="modal fade" id="delcfmModel">
				<div class="modal-dialog">
					<div class="modal-content message_align">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-laber="close">
								<span aria-hidden="true">x</span>
							</button>
							<h4>提示信息</h4>
						</div>
						<div class="modal-body">
							<p id="message"></p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal" id="false"> 取消 </button>
							<button type="button" class="btn btn-default" data-dismiss="modal" id="true"> 确定 </button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="bookform">
				<div class="modal-dialog">
				  <div class="modal-content message_align">
					<div class="modal-header ">
						<button type="button" class="close" data-dismiss="modal" aria-laber="close">
								<span aria-hidden="true">x</span>
						</button>
						<h4>提示信息</h4>
					</div>
					<div class="modal-body">
						<div class="text-center">
							<h2>书籍信息</h2>
						</div>
						<br>
						<form class="form-horizontal"  role="form" action="<%=request.getContextPath() %>/books/admin/addbook" method="post" onsubmit="return work.check();">
							<div class="form-group">
								<label class="col-xs-2 col-xs-push-1 control-label">书名:</label>
								<div class="col-xs-4 col-xs-push-1 control-laber">
									<input type="text" class="form-control" name="add_bookname" id="add_bookname">
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 col-xs-push-1 control-label">数量:</label>
								<div class="col-xs-2 col-xs-push-1 control-laber">
									<input type="text" class="form-control" name="add_booknumber" id="add_booknumber">
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 col-xs-push-1 control-label">详细信息:</label>
								<div class="col-xs-6 col-xs-push-1 control-laber">
									<textarea class="form-control row=5" name="add_bookinfo" id="add_bookinfo"></textarea>
								</div>
							</div>
							<div class="form-group">
								<div  class="alert alert-danger hidden" id="checkinfo">
									<div style="text-align:center">
										<span  class="glyphicon">内容不能为空! </span>
									</div>
								</div>
								<div class="col-xs-1 col-xs-push-10">
									<button type="submit" class="btn btn-primary" value="提交" >提交</button>
								</div>
							</div>
						</form>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/script/bootstrap-paginator.js"></script>
   	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/script/work.js"></script>
	<script type="text/javascript">
		$(function(){
			work.paginator();
		});
		
	</script>
</html>
