$(document).ready(function(){
	$('.del').click(function(){
		$(this).parents('li').remove();
	});
});	

function exit(){
	if(confirm("您真的要退出吗？")){
		window.location.href="../../loginout.asp";
	}
}