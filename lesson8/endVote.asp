<!--#include file="conn.asp"-->
<%
infoId=request.QueryString("infoId")
if infoId="" then
	response.write "<script>alert('ͶƱ���ⲻ����!');history.go(-1);</script>"
else
	rs.open "select * from [voteInfo] where infoId=" & infoId,conn,1,3
	if rs.bof and rs.eof then
		response.write "<script>alert('ͶƱ���ⲻ����!');history.go(-1);</script>"
	else
		rs("state")=0
		rs.update
		response.Redirect("voteList.asp")	
	end if
end if
%>