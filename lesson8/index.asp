<!DOCTYPE HTML>
<HTML>
<HEAD>
	<TITLE>�ҵ���ҳ</TITLE>
	<META charset="gb2312">
	<LINK rel=stylesheet type=text/css href="style/style.css">
</HEAD>

<BODY>
<!--#include file="menu.asp"-->
    

    <DIV id=content class=widecolumn>
        <marquee><H2>����IP��ַ��:<%=request.ServerVariables("REMOTE_ADDR")%></H2></marquee>
        <DIV class="postdata">
            <P>���Ǳ���վ�ĵ�<%=application("count")%>λ�����û�!</P>
            <p>��ǰ����������<%=application("onlineUser")%></p>
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
