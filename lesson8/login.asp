<!DOCTYPE HTML>
<HTML>
<HEAD>
	<TITLE>���¼</TITLE>
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
	response.write "<script>alert('��ʹ�õ���IE�����,���ܻ�Ӱ�쵽�������Ч��������ʹ��Chrome��Fire Fox�����');</script>"
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
<div id="error"><%=request.QueryString("err")%>,�����ԣ�<a id="errorClose">��</a></div>
<%end if%>
<DIV id="loginpage" class="loginboard">
    <DIV id="loginheader" class="loginregheader">
        	<H1>��ӭ��¼�γ�ʵ��ƽ̨</H1>
    </DIV>
	<DIV id="loginform" class="loginregform">
    	<form id="login_form" action="checklogin.asp" method="post">
            <p>
                <label for="u_name">�û���</label>
                <input id="u_name" name="u_name" type="text" placeholder="�������û���" required/>
            </p>
            <p>
                <label for="u_pwd">����</label>
                <input id="u_pwd" name="u_pwd" type="password" placeholder="����������" required/>
            </p>
            <p>
                <input name="rememberme" type="checkbox" id="rememberme" value="Y"/>
              <label for="rememberme" class="chk_rem">��ס��</label>
                <span class="fgt-reg"><a href="forgetpwd.html">��������</a>|<a href="reg.html">����ע��</a></span>
            </p>
            <p>
            	<button id="btn_login" type="submit">��&nbsp;&nbsp;¼</button>
            </p>
            	
        </form>        
	</DIV>
</DIV>
</BODY>
</HTML>
