<!--#include file="../conn.asp"-->
<%
topic=request.Form("topic")
dim o()
num=request.QueryString("optionNum")
if num="" then
	response.Write "<script>alert('参数错误！');history.go(-1);</script>"
else
	if isnumeric(num) then
		redim preserve o(num)
		for i=1 to num
			o(i)=request.Form("option" &i)
		next		
		rs.open "select * from voteinfo",conn,1,3
		rs.addnew
		rs("title")=topic
		rs.update
		infoId=rs("infoId")
		rs.close
		rs.open "select * from votecontent",conn,1,3
		for i=1 to num
			rs.addnew
			rs("option")=o(i)
			rs("infoId")=infoId
			rs.update
		next
		rs.close
		rs.open "select * from voteinfo",conn,1
		rs.pagesize=5
		response.Redirect("VoteIndex.asp?pageno=" &rs.pagecount)
	else
		response.Write "<script>alert('参数错误！');history.go(-1);</script>"
	end if
end if
%>
