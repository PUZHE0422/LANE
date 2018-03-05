<!--#include file="../conn.asp"-->
<%
'no=request.querystring("no")
notetitle=request.Form("notetitle")
notemess=request.Form("notemess")			
rs.open "select * from note",conn,1,3
rs.addnew
rs("usename")=session("curName")
rs("notetime")=now()
rs("ip")=request.ServerVariables("REMOTE_ADDR")
rs("title")=notetitle
rs("content")=notemess
rs.update	
rs.close
rs.open "select * from note where root=0",conn,1
rs.pagesize=5
response.Redirect("Messageindex.asp?no=" &rs.pagecount)
%>