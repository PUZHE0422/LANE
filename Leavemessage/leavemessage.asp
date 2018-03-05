<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>新建留言</title>
    <link rel="stylesheet" href="css/leavemessage.css" />
    <style type="text/css"></style>	
    <script src="js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/leavemessage.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<!--#include file="../conn.asp"-->
<%
	if session("curUser")="" then
		response.Redirect("../Login/Login.asp?err=回话超时")
		response.End()
	end if
	no=request.querystring("no")
%>
<img src="img/backimg.jpg" class="backimg"/>
<div class="message">
	<form id="newnotebox" method="post" action="">	
		<p>您的留言标题是：<input type='text' placeholder='留言标题' size='20' id='notetitle' name='notetitle'></p>
		<textarea type='text' placeholder='留言内容' id='notemess' name='notemess'></textarea>
		<input type="hidden" id="no" value="<%=no%>"/>
		<input type='button' value='留言' class='leavmess' name="leavmess" />
		<input type='button' value='返回' class='back' onclick="history.go(-1);" />
	</form>
</div>
</body>
</html>