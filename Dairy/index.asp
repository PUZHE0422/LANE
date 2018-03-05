<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>动态</title>
		<link rel="stylesheet" href="css/dairy.css" />
		<style type="text/css"></style>	
        <script src="js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/index.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<img src="img/backimg.jpg" class="backimg"/>
		<div id="allbox">
			<div id="top">
				<div><img src="img/toppic2.jpg" class="toppic"></img></div>
				<div class="toptext">L A N E 网 站</div>
			</div>
			
			<ul class="center">
				<li><a href="../Homepage/Homepage.asp">首页</a></li>
				<li><a href="../Setup/Setup.asp">用户</a></li>
				<li><a href="../Friends/Friends.asp">好友</a></li>
				<li><a href="../Leavemessage/Messageindex.asp">留言</a></li>
				<li><a href="../Vote/VoteIndex.asp">投票</a></li>
				<li><a href="index.asp">动态</a></li>
				<li class="zxm">
					<img src="img/首页-用户头标.png" class="userpic"></img>
					<div class="down1">
						<p>昵称：<br /><a href="../Setup/Setup.asp">&emsp;<%=session("curName")%></a></p>
						<p>用户名：<br /><a href="../Setup/Setup.asp">&emsp;<%=session("curUser")%></a></p>
						<a href="#" class="exit" onclick="exit();">退出</a>
					</div>
				</li>
			</ul>
		
			<div class="userinterfacebox">
					<h1>动态列表</h1>
			        <div class="planlist">
			            <ul>
			            	<li>
			                	<h2>动态1</h2>
			                    <p><span>2017.3.30</span><output>&nbsp;&nbsp;完成网站html设计</output></p>
			                </li>
			            	<li>
			                	<h2>动态2</h2>
			                    <p><span>2017.4.28</span><output>&nbsp;&nbsp;PS设计</output></p>
			                </li>
			            	<li>
			                	<h2>动态3</h2>
			                    <p><span>2017.6.10</span><output>&nbsp;&nbsp;CSS, I did it!</output></p>
			                </li>                  
			            </ul>
			        </div>
			        <form id="addplan_form" action="index.html" method="post">			        	
			        	<textarea id="addplan" type="text" cols="50" rows="3"></textarea>
			            <button id="btn_addplan" type="submit" style="cursor: pointer;">发表动态</button>
			        </form>
			</div>
				
		<div class="foot"><p>Copyright@2017 2014329700010.website</p></div>
	</div>
	</body>
</html>