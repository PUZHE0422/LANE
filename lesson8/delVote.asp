<!--#include file="conn.asp"-->
<%
infoId=request.QueryString("infoId")
if infoId="" then
	response.write "<script>alert('ͶƱ���ⲻ����!');history.go(-1);</script>"
else
	strSql="delete from [voteContent] where infoId=" & infoId
	conn.execute strSql
	strSql="delete from [voteInfo] where infoId=" & infoId
	conn.execute strSql
	response.Redirect("voteList.asp")	
end if
%>