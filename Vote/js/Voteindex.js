function exit(){
	if(confirm("您真的要退出吗？")){
		window.location.href="../../Homepage/asp/loginout.asp";
	}
}

function endVote(infoId){
	if(confirm("您真的结束此投票吗？"))
	{
		var pageno=document.getElementById('no').value;
		window.location.href="endVote.asp?infoId="+infoId+"&pageno="+pageno;
	}
}
function delVote(infoId){
	if(confirm("您真的要删除此投票吗？"))
	{
		var pageno=document.getElementById('no').value;
		window.location.href="delVote.asp?infoId="+infoId+"&pageno="+pageno;
	}
}
function goto(){
	if(window.event.keyCode==13){
		var pageno=document.getElementById('pageno').value;
		if(isNaN(pageno)){
			alert('请输入一个数字！');
			document.getElementById('pageno').value='';
			return;
		}
		window.location.href='VoteIndex.asp?pageno='+pageno;
	}
}