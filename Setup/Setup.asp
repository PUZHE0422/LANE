<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>用户信息设置</title>
		<link rel="stylesheet" href="css/Setup.css" />
		<style type="text/css"></style>	
		<script src="js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/setup.js" type="text/javascript" charset="utf-8"></script>
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
				<li><a href="Setup.asp">用户</a></li>
				<li><a href="../Friends/Friends.asp">好友</a></li>
				<li><a href="../Leavemessage/Messageindex.asp">留言</a></li>
				<li><a href="../Vote/VoteIndex.asp">投票</a></li>
				<li><a href="../Dairy/index.asp">动态</a></li>
				<li class="zxm">
					<img src="img/首页-用户头标.png" class="userpic"></img>
					<div class="down1">
						<p>昵称：<br />&emsp;<%=session("curName")%></p>
						<p>用户名：<br />&emsp;<%=session("curUser")%></p>
						<a href="#" class="exit" onclick="exit();">退出</a>
					</div>
				</li>
			</ul>
		
			<div class="userinterfacebox">
					<p>用户名:	<input type="text" value="<%=session("curUser")%>" maxlength="20" id="email"></input></p>
					<p>昵称:		<input type="text" value="<%=session("curName")%>" maxlength="10" id="usename"></input></p>
					<p class="radio-1">性别:   
						<input type="radio" name="radio-1" id="radio-1-1"/>
						<label for="radio-1-1"></label>男
						<input type="radio" name="radio-1" id="radio-1-2"/> 	  
						<label for="radio-1-2"></label>女 
					</p>
					<p>生日:   
						<select name="year" id="year" >
						<script>
						for(i=1900;i<2098;i++){
							document.write("<option value='"+i+"'>"+i+"</option>");
						}
						</script>
						</select>年
						<select name="month" id="month" >
						<script>
						for(i=1;i<13;i++){
							document.write("<option value='"+i+"'>"+i+"</option>");
						}
						</script>
						</select>月
						<select name="day" id="day" >
						<script>
						for(i=1;i<32;i++){
							document.write("<option value='"+i+"'>"+i+"</option>");
						}
						</script>
						</select>日
</p>
					<p>个性签名:<br /><textarea type="text" maxlength="50" cols="50" rows="2" id="signature"></textarea></p>
					<p>人生格言:<br /><textarea type="text" maxlength="100" cols="50" rows="4" id="motto"></textarea></p>			
		</div>
		<button class="save" style="cursor:pointer" onClick="save();">保存</button>	
		
		<div class="foot"><p>Copyright@2017 2014329700010.website</p></div>
		</div>
	</body>
</html>