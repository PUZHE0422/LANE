<!--#include file="../conn.asp"-->
<%
no=request.QueryString("no")
noteid=request.QueryString("noteid")
strsql="select * from note where noteid="&noteid
rs.open strsql,conn,1
usename=rs("usename")
if session("curName")="admin" or session("curName")=usename Then
	if noteid=" " then
		response.write "<script>alert('留言不存在!');history.go(-1);</script>"
	else
		strSql="delete from note where noteid=" & noteid
		conn.execute strSql
		set rs1=server.createobject("ADODB.RecordSet")
		strSql1="delete from note where root=" & noteid
		conn.execute strSql1
		rs.pagesize=5
		if no>rs.pagecount then
			response.Redirect("Messageindex.asp?no=" &no)
		else 
			response.Redirect("Messageindex.asp?no=" &no-1)
		end if	
	end if
else
	response.Write "<script>alert('您无此权限!');history.go(-1);</script>"
end if
%>