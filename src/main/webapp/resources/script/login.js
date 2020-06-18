var login={
		Student:{
			URL:function(){
				return '/ssm-BookAppointment/books'+'/verify';
				},
			action:function(path){
				$('#studentsub').click(function(){
					console.log("in");
					var student_id=$('#student_id').val();
					var student_password=$('#student_password').val();
					if(login.Student.verifyWithDatabase(student_id,student_password)){
						window.location.href=path+"/books/list";
					}else{
						$('#showmessage').attr("class","alert alert-danger");
						setTimeout(function() {
							$('#showmessage').attr("class","alert alert-danger hidden");
						}, 1000)
					}
				})
			},
			verifyWithDatabase:function(student_id,student_password){
				var result=false; //上层变量记录返回值
				$.ajax({
					type:'post',
					url:login.Student.URL(),
					data:{
						studentId:student_id,
						password:student_password
					},
				
					datatype:'josn', 
					async:false,                       //同步调用(重要)
					success:function(data){
						if(data.result=='SUCCESS'){
							$.cookie('studentId', student_id, {  path: '/ssm-BookAppointment/books'}); 
							$.cookie('password', student_password, {  path: '/ssm-BookAppointment/books'}); 
							result=true;
						}else{
							resulr=false;
						}
					}
				});
				return result;
			}
		},
		Admin:{
			URL:function(){
				return '/ssm-BookAppointment/books'+'/vaildateAdmin';
			},
			verifyWithDatabase:function(adminId,adminPassword){
				var result=false;
				$.ajax({
					type:"post",
					url:login.Admin.URL(),
					data:{
						adminId:adminId,
						adminPassword:adminPassword
					},
					datatype: "json",
					async: false,
					success:function(data){
						if(data.result=="success"){
							console.log("not");
							result=true;
						}else{
							result=false;
						}
					}
				});
				return result;
			},
			action:function(path){
				$('#adminsub').click(function(){
					var adminId=$('#admin_id').val();
					var adminPassword=$('#admin_password').val();
					var result=login.Admin.verifyWithDatabase(adminId, adminPassword);
					if(result){
						window.location.href=path+"/books/admin/"+adminId;
					}
					else{
						$('#showmessage').attr("class","alert alert-danger");
						setTimeout(function() {
							$('#showmessage').attr("class","alert alert-danger hidden");
						}, 1000);
					}
				});
			}
			
		}
		

		
			

}