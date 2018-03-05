<!DOCTYPE HTML>
<HTML>
<HEAD>
	<TITLE>我的首页</TITLE>
	<META charset="gb2312">
	<LINK rel=stylesheet type=text/css href="style/style.css">
</HEAD>

<BODY>
<!--#include file="menu.asp"-->
    

    <DIV id=content class=widecolumn>
        <marquee><H2>您的IP地址是:<%=request.ServerVariables("REMOTE_ADDR")%></H2></marquee>
        <DIV class="postdata">
            <P>您是本网站的第<%=application("count")%>位访问用户!</P>
            <p>当前在线人数：<%=application("onlineUser")%></p>
            <p>&nbsp;</p>
        </DIV>
    </DIV>


    <DIV id=footer>
   <p>Copyright&copy; 2017 My.Website<BR><a href="mailto:webmaster@xyz.com.cn">Contact Me:Administrator</A> 
    </P>
    </DIV>
</DIV>
</BODY>
</HTML>
