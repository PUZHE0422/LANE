<!--#include file="conn.asp"-->
<%
infoId=request.QueryString("infoId")
f=request.Cookies("alreadyVote" & infoId)
if f<>"" then
	response.write "<script>alert('ÿ��ֻ��ͶƱһ��!');history.go(-1);</script>"
	response.End()
end if

if infoId="" then
	response.write "<script>alert('ͶƱ���ⲻ����!');history.go(-1);</script>"
else
	rs.open "select * from [voteInfo] where infoId=" & infoId,conn,1,3
	if rs.eof and rs.bof then
		response.write "<script>alert('ͶƱ���ⲻ����!');history.go(-1);</script>"
	else
		rs("total")=rs("total")+1
		rs.update
		rs.close
		optionId=request.Form("R")
		rs.open "select * from [voteContent] where optionId=" & optionId,conn,1,3
		rs("num")=rs("num")+1
		rs.update
		response.Cookies("alreadyVote" & infoId)="Yes"
		response.Cookies("alreadyVote").expires=date()+1
		response.Redirect("viewVote.asp?infoId=" & infoId)	
	end if
end if
%>