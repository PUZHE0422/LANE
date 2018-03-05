<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>留言</title>
    <link rel="stylesheet" href="css/Messageindex.css" />
    <style type="text/css"></style>	
    <script src="js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/Messageindex.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<!--#include file="../conn.asp"-->
<%
	if session("curUser")="" then
		response.Redirect("../Login/Login.asp?err=回话超时")
		response.End()
	end if
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
        <li><a href="Messageindex.asp">留言</a></li>
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
        <ul>
        <div class="intervote"><h1>留言版</h1></div>
        <%
   	 		rs.open "select * from note where root=0",conn,1
			if rs.recordcount=0 then
				response.write "<p style='margin-left: 100px'>还没有留言！</p>"
			else
				rs.pagesize=5
				no=request.QueryString("no")
				if no="" or no=0 then
					no=1
				else
					if isNumeric(no) then 
						no=cint(no)
						if no>rs.pagecount or no<0 then
							no=1
						end if
					else
						no=1
					end if
				end if
				rs.absolutepage=no
				do until i=rs.pagesize or rs.eof 
					i=i+1
					response.Write "<li class='notemessage'>"
					response.Write "<p style='cursor:pointer' class='notetitle' onclick='allsee("&rs("noteid")&");'>" & rs("title")& "</p>"
					response.Write "<p><span>留言者："&rs("usename")&"</span>&emsp;<span>留言时间："&rs("notetime")&"</span></p>"
					response.Write "<p><input type='button' value='加好友' onclick=''/>"

					response.write "<input type='hidden' id='no' value='"&no&"'>"
					response.write "<input type='hidden' id='noteid' value='"&rs("noteid")&"'>"
'window.location.href='noteback.asp?no="&no&"&root="&rs("noteid")&"';''
					if session("curName")="admin" or session("curName")=rs("usename") then
						response.write "<input type='button' value='删除留言' onclick='delNote(" &rs("noteid")& ")'/>"
					end if
					response.Write "<p>"	
					response.Write "</li>"
					rs.movenext
				loop
			end if
		%> 
        <p><center>
         <%
         'if no>1 then     
		 	if no<>1 then
				response.Write "<a class='pagema' href=Messageindex.asp?no=1>首页</a>" & "&nbsp;"
				response.Write "<a class='pagema' href=Messageindex.asp?no="& no-1 &">上一页</a>" & "&nbsp;"
			end if
			t=no/5
			if no mod 5=0 then
				t=t-1
			end if
			for i=t*5+1 to t*5+5
				if i>rs.pagecount then
					exit for
				end if
				if i=no then
					response.Write i & "&nbsp;"
				else
					response.Write "<a class='pagema' href=Messageindex.asp?no="& i &">" & i &"</a>&nbsp;"
				end if
			next
			if no<>rs.pagecount then
				response.Write "<a class='pagema' href=Messageindex.asp?no="& no+1 &">下一页</a>" & "&nbsp;"
				response.Write "<a class='pagema' href=Messageindex.asp?no="& rs.pagecount &">末页</a>" & "&nbsp;"
			end if
			'end if		
		 %>  
         <input name="nopage" id="nopage" type="text" size="1" onKeyPress="goto();"><span class="pagecot"><%=no%>/<%=rs.pagecount%>页</span>		         
        </center></p>                        
       </ul>

	   <input type="button" value="新建留言" class="newnotebtn" onclick="window.location.href='leavemessage.asp?no=<%=no%>';" />
    </div>
        
	<div class="foot"><p>Copyright@2017 2014329700010.website</p></div>
</div>
</body>
</html>