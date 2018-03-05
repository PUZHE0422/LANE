function exit(){
	if(confirm("您真的要退出吗？")){
		window.location.href="../../Homepage/asp/loginout.asp";
	}
}
function delNote(noteid){
	if(confirm("您真的要删除此留言吗？"))
	{
		var no=document.getElementById('no').value;
		window.location.href="delNote.asp?noteid="+noteid+"&no="+no;
	}
}
function goto(){
	if(window.event.keyCode==13){
		var nopage=document.getElementById('nopage').value;
		if(isNaN(nopage)){
			alert('请输入一个数字！');
			document.getElementById('nopage').value='';
			return;
		}
		window.location.href='Messageindex.asp?no='+nopage;
	}
}
function allsee(noteid){
	window.open('viewnote.asp?noteid='+noteid,'','width=600,height=600');
}

