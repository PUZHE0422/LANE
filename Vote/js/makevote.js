// JavaScript Document
var optionNum=4;
$(document).on('click','.deloption',function(){
	  $(this).parent().remove();
	  optionNum--;
});
$(document).ready(function(){
	$(document).on('click','#btn_choose',function(){
		optionNum++;
		var addHtml="<p><input type='text' placeholder='请输入选项' size='50' name='option"+optionNum+"'><span class='deloption' style='cursor:pointer'>×</span></p>";		
		$("#voteitems").append(addHtml);
		window.event.returnValue=false;
	});	
	$("#btn_addvote").click(function(){
		var flag=true;
		$.each($('input[type=text]'),function(i,item){
			if($(item).val()==''){
				alert('所有选项内容必填！');
				flag=false;
				return false;
			}
		});
		if(flag){
			$("#makebox").attr('action','voteCreate.asp?optionNum='+optionNum+'&pageno='+'<%=pageno%>');
			$("#makebox").submit();	
		}
	});
});

