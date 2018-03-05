<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>登录LANE网站</title>
		<link rel="stylesheet" href="css/Login.css" />
		<style type="text/css"></style>	
		<script src="js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/login.js" type="text/javascript" charset="utf-8"></script>
	</head>
	
	<body>
    	<%
			if request.Cookies("cUsername")<>"" then
				session("curUser")=request.Cookies("cUsername")
				application("count")=application("count")+1
				response.Redirect("../Homepage/Homepage.asp")
			end if
			'browserStr=request.ServerVariables("HTTP_USER_AGENT")
			'if instr(browserStr,"MSIE")>0 then 
			'	response.Write "<script>alert('您使用的是IE浏览器，可能会影响到部分浏览效果，建议使用Chrome或Fire Fox浏览器');
			'end if
		%>
		<%
			if Request.QueryString("err")<>"" then
		%>
		<script type="text/javascript">
			$(document).ready(function() {
				$('.erroGet').css("display","block");
				$('.erroGet').animate({top:'15%'});
				$('.erroGet').fadeOut(3000);
			});
		</script>
		<div class="erroGet"><%=request.QueryString("err")%>!请重试!</div>
		<%end if%>
		<div id="allbox">
			<div id="loginheader">
        		<h1>欢迎登录LANE网站</h1>
    		</div>	
   
			<div id="loginform">
				<form id="login_form" action="asp/checklogin.asp" method="post">
					<label for="usename">请输入Email</label>
					<input  type="text" placeholder="请输入Email" id="usename" name="usename" required/>	
					<div class="UserGet"></div>
					
					<label for="keybord">请输入密码</label>
					<input type="password"  placeholder="请输入密码" id="keybord" name="keybord" required/>
					<div class="KeyGet"></div>
					
					<div id="others">					
						<div class="checkboxFive">
                        	<input type="checkbox" value="1" id="checkboxin" name="checkboxin" />						
							<label for="checkboxin"></label>
                        </div>
                        <p class="remeberme">记住我</p>
						<span class="fgt-reg"><a href="../Forgetpwd/index.html" class="wangjimima">忘记密码</a>|<a href="../Register/index.html" class="lijizhuce">立即注册</a></span>
					</div>
					
					<input class="denglubox" style="cursor: pointer;" type="submit" value="登 录"></input>
				</form>
			</div>
		</div>
	</body>	
</html>
