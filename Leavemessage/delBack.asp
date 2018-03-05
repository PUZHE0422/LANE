<!--#include file="../conn.asp"-->
<%
noteid=request.QueryString("noteid")
rt=request.QueryString("root")
strsql="select * from note where noteid="&noteid
rs.open strsql,conn,1
usename=rs("usename")
if usename="admin" or usename=session("curName") Then	
	if noteid=" " then
		response.write "<script>alert('留言不存在!');history.go(-1);</script>"
	else
	strSql="delete from note where noteid=" & noteid
	conn.execute strSql
	response.Redirect("viewnote.asp?noteid="&rt)
	end if		
else
	response.Write "<script>alert('您无此权限!');history.go(-1);</script>"
end if
%>