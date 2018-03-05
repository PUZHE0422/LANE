<!--#include file="conn.asp"-->
<%
topic=request.Form("topic")
dim o()
num=request.QueryString("optionNum")
if num="" then
	response.write "<script>alert('参数错误!');history.go(-1);</script>"
else
	if isnumeric(num) then
		redim preserve o(num)
		for i= 1 to num
			o(i)=request.Form("option" & i)
		next 
		rs.open "select * from [voteInfo]",conn,1,3
		rs.addnew
		rs("title")=topic
		rs.update
		infoId=rs("infoId")
		rs.close
		rs.open "select * from [voteContent]",conn,1,3
		for i= 1 to num
			rs.addnew
			rs("option")=o(i)
			rs("infoId")=infoId
			rs.update
		next 
		response.Redirect("voteList.asp")
	else
		response.write "<script>alert('参数错误!');history.go(-1);</script>"
	end if
end if
%>