<!DOCTYPE HTML>
<HTML>
<HEAD>
	<TITLE>投票</TITLE>
	<META charset="gb2312">
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
			if rs("total")=0 then
			response.write "<H1>还没有开始的投票!</H1>"
			response.End()
			end if
	%>
        	<H1><%=rs("title")%></H1>
    </DIV>
	<DIV class="voteitems">
        	<%
			set rs1=server.CreateObject("ADODB.RecordSet")
			rs1.open "select * from votecontent where infoId=" & rs("infoId"),conn,1
			if rs1.recordcount=0 then
				response.write "<p>选项未设置</p>"
				response.End()
			end if
			randomize
			for i= 1 to rs1.recordcount
					r=int(rnd()*256)
					g=int(rnd()*256)
					b=int(rnd()*256)
					'response.write "<li><p>" & rs1("option") & "</p><span>79（2%）</span></li>"
					response.write "<p><span style='float:left;width:150px;'>" & rs1("option") & "</span><span style='float:left;width:200px;'><span style='float:left;background-color:rgb(" & r & "," & g & "," & b & ");width:" & rs1("num")/rs("total") * 200 & "px;'>&nbsp;</span></span><span>" & rs1("num") & "(" & FormatNumber(rs1("num")/rs("total")*100,1) & "%)</span></p>"
				rs1.movenext
			next 
			%>
             <p>
                 <input class="votebutton" type="button" value="返回" name="view" onClick="history.go(-1);">
     		 </p>     
	</DIV>
</DIV>
</BODY>
</HTML>
