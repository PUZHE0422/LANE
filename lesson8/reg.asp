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
	response.write "<script>alert('���ݿ��쳣�������ԣ�');history.go(-1);</script>"
else
	response.write "<script>alert('ע��ɹ���������¼��');window.location.href='login.asp';</script>"
end if
%>