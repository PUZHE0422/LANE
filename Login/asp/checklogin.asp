<!--#include file="../../conn.asp"-->
<%
	on error Resume Next
	e=Request.Form("usename")
	p=Request.Form("keybord")
	strSql="Select * from register where Email='" &e& "'"
	rs.open strSql,conn,1
	nn=rs("name")
	if rs.eof and rs.bof then  
		response.Redirect ("../Login.asp?err=用户名不存在")
	else 
		if rs("keyword")<>p then
			response.Redirect ("../Login.asp?err=密码错误")
		else
			session("curUser")=e
			session("curName")=nn
			'cookies
			r=request.Form("checkboxin")
			if r="1" then
				response.Cookies("cUsername")=e				
				response.Cookies("cUsername").expires=date()+3
			end if
			application("count")=application("count")+1
			response.Redirect("../../Homepage/Homepage.asp")
		end if 
	end if
%>
