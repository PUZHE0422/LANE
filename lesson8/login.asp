<!DOCTYPE HTML>
<HTML>
<HEAD>
	<TITLE>请登录</TITLE>
	<META charset="gb2312">
	<LINK rel=stylesheet type=text/css href="style/style.css">
    <script src="style/jquery-1.11.1.min.js" type="text/javascript"></script>
</HEAD>
<BODY>
<%
if request.Cookies("cUsername")<>"" then
	session("curUser")=request.Cookies("cUsername")
	application.Lock()
	application("count")=application("count")+1
	application.UnLock()
	response.Redirect("index.asp")
end if
browserStr=request.ServerVariables("HTTP_USER_AGENT")
if instr(browserStr,"MSIE")>0 then
	response.write "<script>alert('您使用的是IE浏览器,可能会影响到部分浏览效果，建议使用Chrome或Fire Fox浏览器');</script>"
end if
%>
<%
if request.QueryString("err")<>"" then
%>
<script type="text/javascript">
	$(document).ready(function(){
		$('#error').animate({top:'10%'});
		$("#error").fadeOut(5000);
		$("#errorClose").click(function() {
			$("#error").fadeOut();
		});
	});
</script>
<div id="error"><%=request.QueryString("err")%>,请重试！<a id="errorClose">×</a></div>
<%end if%>
<DIV id="loginpage" class="loginboard">
    <DIV id="loginheader" class="loginregheader">
        	<H1>欢迎登录课程实验平台</H1>
    </DIV>
	<DIV id="loginform" class="loginregform">
    	<form id="login_form" action="checklogin.asp" method="post">
            <p>
                <label for="u_name">用户名</label>
                <input id="u_name" name="u_name" type="text" placeholder="请输入用户名" required/>
            </p>
            <p>
                <label for="u_pwd">密码</label>
                <input id="u_pwd" name="u_pwd" type="password" placeholder="请输入密码" required/>
            </p>
            <p>
                <input name="rememberme" type="checkbox" id="rememberme" value="Y"/>
              <label for="rememberme" class="chk_rem">记住我</label>
                <span class="fgt-reg"><a href="forgetpwd.html">忘记密码</a>|<a href="reg.html">立即注册</a></span>
            </p>
            <p>
            	<button id="btn_login" type="submit">登&nbsp;&nbsp;录</button>
            </p>
            	
        </form>        
	</DIV>
</DIV>
</BODY>
</HTML>
