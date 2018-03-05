<!--#include file="../conn.asp"-->
<%
root=request.Querystring("root")
backbtnmess=request.Querystring("backbtnmess")
rs.open "select * from note",conn,1,3
rs.addnew
rs("usename")=session("curName")
rs("notetime")=now()
rs("ip")=request.ServerVariables("REMOTE_ADDR")
rs("content")=backbtnmess
rs("root")=root
rs.update	
rs.close
rs.open "select * from note",conn,1
response.Redirect("viewnote.asp?noteid="&root)
%>