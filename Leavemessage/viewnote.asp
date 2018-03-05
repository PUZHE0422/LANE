<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>留言内容</title>
    <link rel="stylesheet" type="text/css" href="css/viewnote.css"/>	
    <script src="js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/viewnote.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<!--#include file="../conn.asp"-->
<%
	noteid=request.querystring("noteid")
	rs.open "select * from note where noteid="&noteid,conn,1
%>
<div class="allbox">
	<div class="notebox">
		<p>留言标题：<%=rs("title")%></p>
		<p>内容：<%=rs("content")%></p>
		<p><span>留言者：<a href="#" onclick=window.open('viewuser.asp?usename=<%=rs("usename")%>','','width=700,height=500,top=100,left=200')><%=rs("usename")%></a></span>&emsp;<span>留言时间：<%=rs("notetime")%></span>&emsp;<span>留言IP：<%=rs("ip")%></span></p>
	</div>
	<!-- 回复框 -->
	<div class="backnotebox">
	<%
		set rs1=server.createobject("ADODB.RecordSet")
		rs1.open "select * from note where root="&noteid,conn,1
		if rs1.recordcount=0 then
			response.write "<p>还没有回复哦！</p>"
		else
		do until i=rs1.recordcount or rs1.eof
			i=i+1
			response.write "<p><a href='#' onclick=window.open('viewuser.asp?usename="&rs1("usename")&"','','width=700,height=500,top=100,left=200')>"&rs1("usename")&"</a>回复："			
			response.write"<input type='button' value='删除回复' id='delback' onclick='delBack("&rs1("noteid")&")'/>"			
			response.write"</p>"
			response.write "<p>"&rs1("content")&"</p>"
			response.write "<p><span>留言时间："&rs1("notetime")&"</span>&emsp;<span>留言IP："&rs1("ip")&"</span></p>"
			rs1.movenext
		loop
		end if
	%>
	</div>
	<div class="backbtnbox">
		<form id="notebackbox" method="post" action="">
			<input type="hidden" id="rt" value="<%=noteid%>"/>
			<textarea type='text' placeholder='回复内容' id='backbtnmess' name='backbtnmess'></textarea>
			<input type="button" value="回复" id="backbtn"/>
		</form>
	</div>
</div>
</body>
</html>