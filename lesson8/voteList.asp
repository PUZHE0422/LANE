<!DOCTYPE HTML>
<HTML>
<HEAD>
	<TITLE>投票</TITLE>
	<META charset="utf-8">
     <script src="style/jquery-1.11.1.min.js" type="text/javascript"></script>
	<LINK rel="stylesheet" type="text/css" href="style/style.css">
</HEAD>

<BODY>

<script type="text/javascript">
	function endVote(infoId){
		if(confirm("您真的结束此投票吗？"))
		{
			window.location.href="endVote.asp?infoId="+infoId;
		}
	}
	function delVote(infoId){
		if(confirm("您真的要删除此投票吗？"))
		{
			window.location.href="delVote.asp?infoId="+infoId;
		}
	}
</script>
<!--#include file="../conn.asp"-->
<%
if session("curUser")="" then
	response.write "<script>window.opener.location.reload();window.close();</script>"
	response.End()
end if
%>

<%
strsql="select * from voteinfo"
rs.cursorlocation=3
rs.open strsql,conn,1
%>
<DIV class="voteboard">
    <DIV class="voteQuestion">
        	<H1>网络投票</H1>
    </DIV>
	<DIV class="voteitems">
    		<%
				if rs.recordcount=0 then	
					response.write "<p>没有进行中的投票!</p>"
				else
					rs.pagesize=5
					pageno=request.QueryString("pageno")
					if pageno="" then
						pageno=1
					else
						if isNumeric(pagno) then
							pageno=cint(pageno)
							if  pageno>rs.pagecount or pageno<0 then
								pageno=1
							end if
						else
							pageno=1
						end if
					end if
					rs.absolutepage=pageno
					do until i=rs.pagesize or rs.eof
						i=i+1
						response.write "<p>" & rs("title") 
						if rs("state")=1 then
						response.write "<span style='float:right'>【<a href='vote.asp?infoId=" & rs("infoId") & "'>投票</a>"
						if session("curUser")="admin" then
							response.write "|<a href='#' onclick='endVote(" & rs("infoId") & ")'>结束</a>|<a href='#' onclick='delVote(" & rs("infoId") & ")'>删除</a>"
						end if						
						response.write "】</span>"
						else	
						response.write "<span style='float:right'>【<a href='viewVote.asp?infoId=" & rs("infoId") & "'>查看</a>"
						if session("curUser")="admin" then
							response.write  "|<a href='#' onclick='delVote(" & rs("infoId") & ")'>删除</a>"
						end if
						response.write "】</span>"
						end if
						response.write "</p>"
						rs.movenext
					loop  
				end if			
			%>
            <%
				if session("curUser")="t@t.com" then
			%>
    		  <p>
                 <input class="votebutton" type="button" value="新建投票" name="newVote" onClick="window.location.href='votenew.asp';" >
     		 </p>
            <% end if%>       
	</DIV>
</DIV>
</BODY>
</HTML>
