<!--#include file="../conn.asp"-->
<%
pageno=request.QueryString("pageno")
infoId=request.QueryString("infoId")
if infoId="" then
	response.write "<script>alert('投票主题不存在!');history.go(-1);</script>"
else
	rs.open "select * from voteinfo where infoId=" & infoId,conn,1,3
	if rs.bof and rs.eof then
		response.write "<script>alert('投票主题不存在!');history.go(-1);</script>"
	else
		rs("state")=0
		rs.update
		response.Redirect("VoteIndex.asp?pageno="&pageno)	
	end if
end if
%>