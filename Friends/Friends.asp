<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>好友</title>
		<link rel="stylesheet" href="css/Friends.css" />
		<style type="text/css"></style>	
		<script src="js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/Friends.js" type="text/javascript" charset="utf-8"></script>
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
				<li><a href="Friends.asp">好友</a></li>
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
		
			<div class="userinterfacebox">
					<p class="title">我的好友</p>
					<ul class="line">
						<li>
							<img src="img/imghead.png" />
							<output>好友1昵称</output>
							<div class="message">
								<button><a href="#" onclick="window.open('../Leavemessage/leavemessage.html','','width=700,height=500')">留言</a></button>
								<button style="cursor:pointer" class="del">删除好友</button>
							</div>
						</li>
						<li>
							<img src="img/imghead.png" />
							<output>好友2昵称</output>
							<div class="message">
								<button style="cursor:pointer"><a href="#" onclick="window.open('../Leavemessage/leavemessage.html','','width=700,height=500')">留言</a></button>
								<button style="cursor:pointer" class="del">删除好友</button>
							</div>
						</li>
						<li>
							<img src="img/imghead.png" />
							<output>好友3昵称</output>
							<div class="message">
								<button style="cursor:pointer"><a href="#" onclick="window.open('../Leavemessage/leavemessage.html','','width=700,height=500')">留言</a></button>
								<button style="cursor:pointer" class="del">删除好友</button>
							</div>
						</li>
						<li>
							<img src="img/imghead.png" />
							<output>好友4昵称</output>
							<div class="message">
								<button style="cursor:pointer"><a href="#" onclick="window.open('../Leavemessage/leavemessage.html','','width=700,height=500')">留言</a></button>
								<button style="cursor:pointer" class="del">删除好友</button>
							</div>
						</li>
						<li>
							<img src="img/imghead.png" />
							<output>好友5昵称</output>
							<div class="message">
								<button style="cursor:pointer"><a href="#" onclick="window.open('../Leavemessage/leavemessage.html','','width=700,height=500')">留言</a></button>
								<button style="cursor:pointer" class="del">删除好友</button>
							</div>
						</li>
						<li>
							<img src="img/imghead.png" />
							<output>好友6昵称</output>
							<div class="message">
								<button style="cursor:pointer"><a href="#" onclick="window.open('../Leavemessage/leavemessage.html','','width=700,height=500')">留言</a></button>
								<button style="cursor:pointer" class="del">删除好友</button>
							</div>
						</li>
					</ul>					
			</div>
		
		<div class="foot"><p>Copyright@2017 2014329700010.website</p></div>
		</div>
		
	</body>
</html>