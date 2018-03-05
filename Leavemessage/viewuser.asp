<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>留言内容</title>
    <link rel="stylesheet" type="text/css" href="css/viewuser.css"/>	
    <!-- <script src="js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script> -->
    <!-- <script src="js/viewuser.js" type="text/javascript" charset="utf-8"></script> -->
</head>
<body>
<!--#include file="../conn.asp"-->
<%
	usename=request.Querystring("usename")
	strql="select * from register where name='"&usename&"'"
	rs.open strql,conn,1
%>
<div class="allbox">
	<p class="top">用户信息</p>
	<p class="name">昵称：<%=rs("name")%></p>
	<p class="usename">昵称：<%=rs("Email")%></p>
	<p class="sex">性别：<%=rs("sex")%></p>
	<p class="birth">生日：<%=rs("birth")%></p>
	<p class="sign">个性签名：<%=rs("personsign")%></p>
	<p class="motto">人生格言：<%=rs("motto")%></p>
</div>
</body>
</html>