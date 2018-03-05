<!--#include file="../../conn.asp"-->
<%
	u=Request.Form("name")
	if u<>"" then
		strSql="select * from register where name='" &u& "'"
		rs.open strSql,conn,1
		if strSql.recordcount>0 then
			response.write "{""flag"":"false"}"
		else
			response.write "{""flag"":"true"}"
		end if
	end if
%>