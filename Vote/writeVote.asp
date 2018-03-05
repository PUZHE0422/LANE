<!--#include file="../conn.asp"-->
<%
infoId=request.QueryString("infoId")
f=request.Cookies("alreadyVote" & infoId)
if f<>""  then
	response.Write "<script>alert('每天只能投一次票!');history.go(-1);</script>"
	response.End()
end if
if infoId="" then
	response.Write "<script>alert('投票主题不存在!');history.go(-1);</script>"
else
	rs.open "select * from voteinfo where infoId=" & infoId,conn,1,3
	if rs.bof and rs.eof then
		response.Write "<script>alert('数据读取出错');history.go(-1);</script>"
	else
		rs("total")=rs("total")+1
		rs.update
		optionId=request.Form("R")
		rs.close
		rs.open "select * from votecontent where optionId=" &optionId,conn,1,3
		rs("num")=rs("num")+1
		rs.update
		response.Cookies("alreadyVote" & infoId)="Yes"
		response.Cookies("alreadyVote").expires=date()+1
		response.Redirect("voteresult.asp?infoId=" & infoId)
	end if
end if
%>