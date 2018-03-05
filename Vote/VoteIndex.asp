<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>投票</title>
<link rel="stylesheet" type="text/css" href="css/VoteIndex.css" />
<script src="js/jquery-2.1.0.js" type="text/javascript"></script>
<script src="js/Voteindex.js" type="text/javascript"></script>
</head>
<body>
<!--#include file="../conn.asp"-->
<%
	if session("curUser")="" then
		response.Redirect("../Login/Login.asp?err=回话超时")
		response.End()
	end if
%>
<%
    strsql="select * from voteinfo"
	rs.cursorlocation=3
    rs.open strsql,conn,1
%>
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
    <li><a href="VoteIndex.asp">投票</a></li>
    <li><a href="../Dairy/index.asp">动态</a></li>
    <li class="zxm"> <img src="img/首页-用户头标.png" class="userpic"></img>
      <div class="down1">
        <p>昵称：<br />
          <a href="../Setup/Setup.asp">&emsp;<%=session("curName")%></a></p>
        <p>用户名：<br />
          <a href="../Setup/Setup.asp">&emsp;<%=session("curUser")%></a></p>
        <a href="#" class="exit" onclick="exit();">退出</a> </div>
    </li>
  </ul>
  <div class="userinterfacebox">
  	<div class="listbox">
         <div class="intervote"><h1>网络投票</h1></div>
         
		 <%
		 	if rs.recordcount=0 then
				response.write "<p>没有进行中的投票！</p>"
			else
				rs.pagesize=5
				pageno=request.QueryString("pageno")
				if pageno="" then
					pageno=1
				else
					if isNumeric(pageno) then 
						pageno=cint(pageno)
						if pageno>rs.pagecount or pageno<0 then
							pageno=1
						end if
					else
						pageno=1
					end if
				end if
				rs.absolutepage=pageno
				do until i=rs.pagesize or rs.eof 
					i=i+1
					response.Write "<p>" & rs("title")& "</p>"
					if rs("state")=1 then
						response.Write "<button id='btn_vote' onclick=window.open('vote.asp?infoId=" &rs("infoId")& "')>投票</button>"
						if session("curUser")="t@t.com" then
							response.Write "<button id='btn_end' onclick='endVote(" &rs("infoId")& ")'>结束</button>"
							response.write "<input type='hidden' id='no' value='"&pageno&"'>"
							response.Write "<button id='btn_del' onclick='delVote(" &rs("infoId")& ")'>删除</button>"
						end if
					else
						response.Write "<button id='btn_see' onclick=window.open('voteresult.asp?infoId=" &rs("infoId")& "')>查看</button>"
						if session("curUser")="t@t.com" then
							response.Write "<button id='btn_end' onclick='delVote(" &rs("infoId")& ")'>删除</button>"
							response.write "<input type='hidden' id='no' value='"&pageno&"'>"
						end if
					end if
					rs.movenext
				loop
			end if
		 %> 
         <p><center>
         <%
		 	if pageno<>1 then
				response.Write "<a class='pagema' href=VoteIndex.asp?pageno=1>首页</a>" & "&nbsp;"
				response.Write "<a class='pagema' href=VoteIndex.asp?pageno="& pageno-1 &">上一页</a>" & "&nbsp;"
			end if
			t=pageno/5
			if pageno mod 5=0 then
				t=t-1
			end if
			for i=t*5+1 to t*5+5
				if i>rs.pagecount then
					exit for
				end if
				if i=pageno then
					response.Write i & "&nbsp;"
				else
					response.Write "<a class='pagema' href=VoteIndex.asp?pageno="& i &">" & i &"</a>&nbsp;"
				end if
			next
			if pageno<>rs.pagecount then
				response.Write "<a class='pagema' href=VoteIndex.asp?pageno="& pageno+1 &">下一页</a>" & "&nbsp;"
				response.Write "<a class='pagema' href=VoteIndex.asp?pageno="& rs.pagecount &">末页</a>" & "&nbsp;"
			end if
		 %>  
         <input name="pageno" id="pageno" type="text" size="1" onKeyPress="goto();"><span class="pagecot"><%=pageno%>/<%=rs.pagecount%>页</span></center></p>   
    </div>   
    
    <%
		if session("curUser")="t@t.com" then
	%>
    	<button id="btn_addairy" type="button" onclick="window.location.href='makevote.asp';">新建投票</button>
    <% end if %>
  </div>
  <div class="foot">
    <p>Copyright@2017 2014329700010.website</p>
  </div>
</div>
</body>
</html>