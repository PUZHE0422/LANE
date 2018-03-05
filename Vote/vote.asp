<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>投票</title>
        <script src="js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" href="css/vote.css" />
		<style type="text/css"></style>	
	</head>
	<body>
    	<!--#include file="../conn.asp"-->
        <%
			infoId=request.QueryString("infoId")
			if infoId=" " then
				response.Write "<script>alert('投票主题不存在！');window.opener.location.reload();window.close();</script>"
				response.End()
			end if
        	strsql="select * from voteinfo where infoId=" & infoId
            rs.open strsql,conn,1
        %>
		<div class="userinterfacebox">       	
            <%
				if rs.recordcount=0 then
					response.Write "<p>还没开始的投票！</p>"
					response.End()
				end if
			%>	
            <p><%=rs("title")%></p>						
			<form id="vote_form" action="writeVote.asp?infoId=<%=rs("infoId")%>" method="post">
				<%
					set rs1=server.createobject("ADODB.RecordSet")
					rs1.open "select * from votecontent where infoId=" & rs("infoId"),conn,1
					if rs1.recordcount=0 then
						response.Write "<p>选项未设置</p>"
						response.End()
					end if
					for i= 1 to rs1.recordcount
						if i=1 then
							response.write "<p class='radiobutton'><input value='" & rs1("optionId") &"' type='radio' name='R' checked><span></span><p>" & rs1("option") & "</p></p>"			
						else
							response.write "<p class='radiobutton'><input value='" & rs1("optionId") &"' type='radio' name='R'><span></span><p>" & rs1("option") & "</p></p>"
						end if
						rs1.movenext
					next 
				%>		
				<button id="btn_vote" name="submit">投票</button>
                <button id="btn_result" onclick="window.location.href='voteresult.asp?infoId=<%=rs("infoId")%>'" name="view">查看</button>
            </form>
		</div>
		
	</body>
</html>