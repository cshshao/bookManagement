var work={
	sure:function(url,bookname,change_number) {
			var modal_get=$('#delcfmModel');
			var number=$('#'+change_number).val();
			if(number>0){
				$('#message').html("确定"+bookname+"数量+"+number);
			}else{
				$('#message').html("确定"+bookname+"数量"+number);
			}
			modal_get.modal({
				show:true,
				backdrop:'static',
				keyboard:false
			});
			$('#true').click(function(){
				$.post(url+'/books/admin/change',
					   {
					   	 number:number,
					   	 bookname:bookname
					   },
					   function(){
					   	window.location.href=url+'/books/admin/works?page=1';
					   });
			});
		},
	paginator:function(){
		var options={
			bootstrapMajorVersion:3,
			currentPage:currentpage,
			totalPages:pageNumber,
			itemTexts:function(type,page,current){
				switch(type){
					case "first":
						return "首页";
					case "prev":
						return "上一页";
					case "next":
						return "下一页";
					case "last":
						return "末页";
					case "page":
						return page;
				}
			},
			onPageClicked:function(event,originalEvent,type,page){
				//点击事件
				window.location.href=url+'/books/admin/works?page='+page;
			}
		}
		$('#pageexp').bootstrapPaginator(options);
	},
	add:function(){
		var bookform=$('#bookform');
		bookform.modal({
			show:true,
			backdrop:'static',
			keyboard:false
		});	
	},
	check:function(){
		var add_bookname=$('#add_bookname').val();
		var add_booknumber=$('#add_booknumber').val();
		var add_bookinfo=$('#add_bookinfo').val();
		console.log(add_bookinfo);
		if(add_bookname==null || add_booknumber==null || add_bookinfo==null){
			$('#checkinfo').attr("class","alert alert-danger");
			setTimeout(function(){
				$('#checkinfo').attr("class","alert alert-danger hidden");
			},2000);
			
			return false;
		}else{
			return true;
		}
		
	}
	


}