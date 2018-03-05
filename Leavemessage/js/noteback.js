$(document).ready(function(){
	$(".notebackbtn").click(function(){
		var flag=true;
		$.each($('textarea[type=text]'),function(i,item){
			if($(item).val()==''){
				alert('所有选项内容必填！');
				flag=false;
				return false;
			}
		});
		if(flag){
			var rt=document.getElementById('rt').value;
			var no=document.getElementById('no').value;
			$("#notebackbox").attr('action','notebackmessage.asp?root='+rt+'&no='+no);			
			$("#notebackbox").submit();	
		}
	});
});