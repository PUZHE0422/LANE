$(document).ready(function(){
	$(".radio-1 label").click(function(){
		$(this).css("checked":"checked").siblings().css("checked":"");
		alert("11");
	});
});

function exit(){
	if(confirm("您真的要退出吗？")){
		window.location.href="../../Homepage/asp/loginout.asp";
	}
}
function save(){
	if(confirm("您真的要保存修改吗？")){
		var usename=document.getElementById("usename").value;
		var email=document.getElementById("email").value;
		
		var sign=document.getElementById("signature").value;
		var motto=document.getElementById("motto").value;
		window.location.href="save.asp";
	}
}