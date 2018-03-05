<!--#include file="conn.asp"-->
<%
u=request.QueryString("username")
if u<>"" then
	strSql="select * from [userinfo] where username='" & u & "'"
	rs.open  strSql,conn,1
	if rs.recordcount>0 then
		response.write "{""flag"":false}"
	else
		response.write "{""flag"":true}"
	end if
end if
%>