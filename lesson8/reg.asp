<!--#include file="conn.asp"-->
<%
on error resume next
u=request.Form("u_name")
p=request.Form("u_pwd")
phone=request.Form("u_phone")
'strSql="insert into [userinfo] (username,password,phone) values ('" & u & "','" & p & "','" & phone & "')"
'conn.execute strsql
rs.open "select * from [userinfo]",conn,1,3
rs.addnew
rs("username")=u
rs("password")=p
rs("phone")=phone
rs.update
if conn.errors.count>0 then
	response.write "<script>alert('数据库异常，请重试！');history.go(-1);</script>"
else
	response.write "<script>alert('注册成功，立即登录！');window.location.href='login.asp';</script>"
end if
%>