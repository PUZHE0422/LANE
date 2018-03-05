<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>LANE网站首页</title>
		<link rel="stylesheet" href="css/Homepage.css" />
		<style type="text/css"></style>	
		<script src="js/jquery-2.1.0.js" type="text/javascript" charset="UTF-8"></script>
        <script src="js/homepage.js" type="text/javascript" charset="UTF-8"></script>
	</head>
	<body>
    	<%
			if session("curUser")="" then
				response.Redirect("../Login/Login.asp?err=回话超时")
			end if
		%>
		<img src="img/backimg.jpg" class="backimg"/>
		<div id="allbox">
			<div id="top">
				<div><img src="img/toppic2.jpg" class="toppic"></img></div>
				<div class="toptext">L A N E 网 站</div>
			</div>
		
			<ul class="center">
				<li><a href="Homepage.asp">首页</a></li>
				<li><a href="../Setup/Setup.asp">用户</a></li>
				<li><a href="../Friends/Friends.asp">好友</a></li>
				<li><a href="../Leavemessage/Messageindex.asp">留言</a></li>
				<li><a href="../Vote/VoteIndex.asp">投票</a></li>
				<li><a href="../Dairy/index.asp">动态</a></li>
				<li class="zxm">
					<img src="img/首页-用户头标.png" class="userpic"></img>
					<div class="down1">
						<p>昵称：<br /><a href="../Setup/Setup.asp">&emsp;<%=session("curName")%></a></p>
						<p>用户名：<br /><a href="../Setup/Setup.asp">&emsp;<%=session("curUser")%></a></p>
                      
						<a href="#" class="exit" onclick="exit();">退出</a>
					</div>
				</li>               
			</ul>
		
			<div class="bottom">
				<marquee><p>您是本网站的第<%=application("count")%>位访问用户</p></marquee>	
				<div class="circletwo" style="cursor:default"><p>&emsp;主银<br />快来和LANE<br />一起互动吧！</p></div>				
			</div>
		
			<div class="foot"><p>Copyright@2017 2014329700010.website</p></div>
		</div>
	</body>
</html>
				
					
			
					
			
				
				
					
			