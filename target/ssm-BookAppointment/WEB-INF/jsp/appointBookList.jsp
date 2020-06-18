<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>预约图书列表</title>
    <%@include file="common/head.jsp" %>
</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>您已预约图书列表</h2>
        </div>
		<div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr> 
                    <th>预定学号</th>
                    <th>预约时间</th>
                    <th>图书ID</th> 
                    <th>图书名称</th>
                    <th>图书简介</th>
                    <th>预约数量</th> 
                    <th></th> 
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${appointList}" var="sk">
                    <tr>
                    	<td>${sk.studentId}</td> 
                        <td>${sk.appointTime}</td>
                        <td>${sk.bookId}</td>
                        <td>${sk.book.getName()}</td>
                        <td>${sk.book.getIntrod()}</td> 
                        <td>1</td>
                        <td><button type="button" id="${sk.bookId}" class="btn btn-danger" onclick='sure(${sk.bookId},${sk.studentId },"${sk.book.getName()}")'>取消预约</button></td> 
                    </tr>
                </c:forEach>
                </tbody>
            </table> 
        </div>
       
      <div class="modal fade" id="delcfmModel">  
		  <div class="modal-dialog">  
		    <div class="modal-content message_align">  
		      <div class="modal-header">  
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>  
		        <h4 class="modal-title">提示信息</h4>  
		      </div>  
		      <div class="modal-body">  
		        <p id="test"></p>  
		      </div>  
		      <div class="modal-footer">   
		         <button type="button" class="btn btn-default" data-dismiss="modal" id="false">取消</button> 
		         <button type="button" class="btn btn-default" data-dismiss="modal" id="true">确定</button>   
		      </div>  
		    </div><!-- /.modal-content -->  
		  </div><!-- /.modal-dialog -->  
		</div><!-- /.modal --> 

        
    </div>
</div>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript">
		function sure(bookId,studentId,bookName){
			$('#test').text("确定取消预约"+bookName+"吗？")
			var  IdAndPasswordModal=$('#delcfmModel'); //document.getElementByid('id')
					IdAndPasswordModal.modal({     //设置CSS样式
						show: true,//显示弹出层
	                    backdrop: 'static',//禁止位置关闭
	                    keyboard: false//关闭键盘事件
					});
			$('#true').click(function(){
				$('#'+bookId).addClass('disabled');
			$.get("<%=request.getContextPath()%>/books/cancel?bookId="+bookId+"&studentId="+studentId,{},function(result){
			if(result){
				$('#'+bookId).text("已取消预约");
			}else{
				alert("取消失败 请重新尝试");
			}
		  		});
		  	$('#false').click(function(){})
		  		IdAndPasswordModal.modal({
		  			show:false
		  		})
			});
		}
</script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</body>
</html>