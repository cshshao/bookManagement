<html>
<body>
<h2>Test</h2>
	
		<input type="text" id="student_id"/>
		<input type="text" id="student_password"/>
		<button  id="studentsub" >sumbit</button>

	
</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/script/login.js"></script>
<script type="text/javascript">
	$(function(){
		login.Student.action();
	});
</script>
</html>
