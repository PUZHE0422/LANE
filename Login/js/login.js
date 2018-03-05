var flagU = false;
var flagPwd = false;
$(document).ready(function() {
	$('#usename').blur(function() { //用户名弹出框
		var usename = $('#usename').val();
		var reg = /^^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$$/;
		if(!reg.test(usename)) {
			$('.UserGet').html('请输入正确的用户名!');
			$('.UserGet').fadeIn();
			$('.UserGet').fadeOut(3000);
			flagU = false;
		} else {
			flagU = true;
		}
	});
	$('#keybord').blur(function() { //密码弹出框
		var pwd = $('#keybord').val();
		var reg = /^(?![0-9]+$)(?![A-Za-z]+$).{6,16}/;
		if(!reg.test(pwd)) {
			$('.KeyGet').html('请输入正确的密码！');
			$('.KeyGet').fadeIn();
			$('.KeyGet').fadeOut(3000);
			flagPwd = false;
		} else {
			flagPwd = true;
		}
	});
});