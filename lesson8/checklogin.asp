<!--#include file="conn.asp"-->
<%
on error resume next
u=request.Form("u_name")
p=request.Form("u_pwd")
strSql="select * from [userinfo] where username='" & u & "'"
rs.open  strSql,conn,1
if rs.eof and rs.bof then
	response.Redirect("login.asp?err=用户名不存在")
else
	if rs("password")<>p then
		response.Redirect("login.asp?err=密码不正确")
	else
		session("curUser")=u
		r=request.Form("rememberme")
		if r="Y" then
			response.Cookies("cUsername")=u
			response.Cookies("cUsername").expires=date()+365
		end if
		application.Lock()
		application("count")=application("count")+1
		application.UnLock()
		response.Redirect("index.asp")
	end if
end if

%>