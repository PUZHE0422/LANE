var flagU = false;
var flagPwd = false;
var flagPwd1 = false;
$(document).ready(function() {
	$('input#name').blur(function() {//昵称是否冲突
		var name=$('input#name').val();
		$.get("../asp/validUser.asp",name,function(data,status){
				var ret=$.parseJSON(data);
				if(!ret.flag){
					$('.NameGet').html('您输入的昵称已经注册!');
					$('.NameGet').fadeIn();
					$('.NameGet').fadeOut(3000);										
				}
		});
	});
	$('input#usename').blur(function() { //Email弹出框
		var usename = $('input#usename').val();
		var reg = /^^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$$/;
		if(!reg.test(usename)) {
			$('.EmailGet').html('请输入正确的Email格式!');
			$('.EmailGet').fadeIn();
			$('.EmailGet').fadeOut(3000);
			flagU = false;
		} else {
			/*$.get("../asp/ValidUser.asp",usename,function(data,status){
				var ret=$.parseJSON(data);
				if(!ret.flag){
					$('.EmailGet').html('您输入的Email已经注册!');
					$('.EmailGet').fadeIn();
					$('.EmailGet').fadeOut(3000);
					flagU = false;
					return;
				}
			});*/
			flagU = true;
		}
	});
	$('input#keybord').blur(function() { //密码弹出框
		var pwd = $('input#keybord').val();
		var reg = /^(?![0-9]+$)(?![A-Za-z]+$).{6,16}/;
		if(!reg.test(pwd)) {
			$('.PwdGet').html('密码必须由6-16个英文字母和数字的字符串组成！');
			$('.PwdGet').fadeIn();
			$('.PwdGet').fadeOut(3000);
			flagPwd = false;
		} else {
			flagPwd = true;
		}
	});
	$('input#keybordone').blur(function() { //再次输入密码弹出框
		var pwd1 = $('input#keybordone').val();
		var pwd = $('input#keybord').val();
		if(pwd1 != pwd) {
			$('.PwdGet1').html('两次输入的密码不一致！');
			$('.PwdGet1').fadeIn();
			$('.PwdGet1').fadeOut(3000);
			flagPwd1 = false;
		} else {
			flagPwd1 = true;
		}
	});
	$('.zhucebox').click(function() { //按鈕
		if(flagU && flagPwd && flagPwd1) {
			$('#register_form').submit();
		} else {
			$('.buttonGet').html('请填写完整注册信息！');
			$('.buttonGet').fadeIn();
			$('.buttonGet').fadeOut(2000);
		}
	});
	$('#register_form').keypress(function(event) { //回车
		if(event.keyCode == 13) {
			if(flagU && flagPwd && flagPwd1) {
				$('#register_form').submit();
			} else {
				$('.buttonGet').html('请填写完整注册信息！');
				$('.buttonGet').fadeIn();
				$('.buttonGet').fadeOut(2000);
			}
		}
	});

});