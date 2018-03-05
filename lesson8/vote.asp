<!DOCTYPE HTML>
<HTML>
<HEAD>
	<TITLE>投票</TITLE>
	<META charset="utf-8">
     <script src="style/jquery-1.11.1.min.js" type="text/javascript"></script>
	<LINK rel=stylesheet type=text/css href="style/style.css">
</HEAD>

<BODY>
<!--#include file="../conn.asp"-->
<%
infoId=request.QueryString("infoId")
if infoId="" then
	response.write "<script>alert('投票主题不存在!');history.go(-1);</script>"
	response.End()
end if
strsql="select * from voteinfo where infoId=" & infoId
rs.open strsql,conn,1
%>
<DIV class="voteboard">
    <DIV class="voteQuestion">
    <%
    		if rs.recordcount=0 then
			response.write "<H1>还没有开始的投票!</H1>"
			response.End()
			end if
	%>
        	<H1><%=rs("title")%></H1>
    </DIV>
	<DIV class="voteitems">
    	<form id="vote_form" action="writeVote.asp?infoId=<%=rs("infoId")%>" method="post">
        	<%
			'set rs1=server.CreateObject("ADODB.RecordSet")
			set rs1=server.createobject("ADODB.RecordSet")
			rs1.open "select * from votecontent where infoId=" & rs("infoId"),conn,1
			if rs1.recordcount=0 then
				response.write "<p>选项未设置</p>"
				response.End()
			end if
			for i= 1 to rs1.recordcount
				if i=1 then
					response.write "<p><input type='radio' name='R' value='" & rs1("optionId") & "' checked>" & rs1("option") & "</p>"
				else
					response.write "<p><input type='radio' name='R' value='" & rs1("optionId") & "'>" & rs1("option") & "</p>"
				end if
				rs1.movenext
			next 
			%>
             <p>
                 <input class="votebutton" type="submit" value="投票" name="submit">
                 <input class="votebutton" type="button" value="查看" name="view" onClick="window.location.href='viewVote.asp?infoId=<%=rs("infoId")%>'">
                  <input class="votebutton" type="button" value="返回" name="view" onClick="history.go(-1);">
     		 </p>
        </form>        
	</DIV>
</DIV>
</BODY>
</HTML>
