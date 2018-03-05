$(document).ready(function(){
	$("#backbtn").click(function(){
		var flag=true;
		$.each($('textarea[type=text]'),function(i,item){
			if($(item).val()==''){
				alert('内容必填！');
				flag=false;
				return false;
			}
		});
		if(flag){
			var rt=document.getElementById('rt').value;			
			var backbtnmess=document.getElementById('backbtnmess').value;
			//window.location.href="notebackmessage.asp?root="+rt+"&backbtnmess="+backbtnmess;
			$("#notebackbox").attr('action','notebackmessage.asp?root='+rt+'&backbtnmess='+backbtnmess);			
			$("#notebackbox").submit();	
		}
	});
});

function delBack(noteid){
	if(confirm("您真的要删除此回复吗？"))
	{
		var rt=document.getElementById('rt').value;
		window.location.href="delBack.asp?noteid="+noteid+"&root="+rt;
	}
}