$(document).ready(function(){
	$(".leavmess").click(function(){
		var flag=true;
		$.each($('input[type=text],textarea[type=text]'),function(i,item){
			if($(item).val()==''){
				alert('所有选项内容必填！');
				flag=false;
				return false;
			}
		});
		if(flag){
			var no=document.getElementById('no').value;
			//(no);
			$("#newnotebox").attr('action','updatemessage.asp?no='+no);//
			$("#newnotebox").submit();	
		}
	});
});