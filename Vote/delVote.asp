<!--#include file="../conn.asp"-->
<%
infoId=request.QueryString("infoId")
pageno=request.QueryString("pageno")
if infoId="" then
	response.write "<script>alert('投票主题不存在!');history.go(-1);</script>"
else
	strSql="delete from votecontent where infoId=" & infoId
	conn.execute strSql
	strSql="delete from voteinfo where infoId=" & infoId
	conn.execute strSql
	rs.open "select * from voteinfo",conn,1
	rs.pagesize=5
	if pageno>rs.pagecount then
		response.Redirect("VoteIndex.asp?pageno="&pageno)
	else 
		response.Redirect("VoteIndex.asp?pageno="&pageno-1)
	end if
end if
%>