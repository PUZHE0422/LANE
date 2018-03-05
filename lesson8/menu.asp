<%
if session("curUser")="" then
	response.Redirect("login.asp?err=会话超时")
end if
%>
<script language="javascript">
	function exit(){
			if(confirm("您真的要退出吗？"))
				{
					window.location.href="logout.asp";
					}
		}

</script>
<DIV id=page>
    <DIV id=header>
        	<H1>
        	我的首页
       		</H1>
       		<DIV class=description>My Personal WebSite</DIV>
            <DIV class="userinfo">
     			<A href="#" class="username" onclick="window.open('edituser.html','','width=600,height=600')"><%=session("curUser")%></A> |
         		<A href="#" onclick="exit();">退出</A>
 			</DIV>
    </DIV>
	<DIV id=navigation>
        <UL>
          <LI><A href="index.asp">首页</A> </LI>
          <LI><A href="friendslist.html"  target=_self>好友列表</A></LI> 
          <LI><A href="#" onclick="window.open('voteList.asp','','width=600,height=600')">热门话题投票</A> </LI>
          <LI><A href="note.html"  target=_self>留言板</A> </LI>        
        </UL>        
</DIV>