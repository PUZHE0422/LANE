<!--#include file="../../conn.asp"-->
<%
	on error Resume Next
	u=Request.Form("name")
	e=Request.Form("usename")
	p=Request.Form("keybord")
	rs.open "Select * from register",conn,1,3
	rs.addnew
	rs("name")=u 
	rs("Email")=e 
	rs("keyword")=p
	rs.update
	if conn.errors.count>0 then
		response.write "<script>alert('数据库异常，请重试！');history.go(-1);</script>"
	else 
		response.write "<script>alert('注册成功，立即登录！');window.location.href='../../Login/Login.asp';</script>"
	end if
%>
