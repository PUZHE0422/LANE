<%
if session("curUser")="" then
	response.Redirect("login.asp?err=�Ự��ʱ")
end if
%>
<script language="javascript">
	function exit(){
			if(confirm("�����Ҫ�˳���"))
				{
					window.location.href="logout.asp";
					}
		}

</script>
<DIV id=page>
    <DIV id=header>
        	<H1>
        	�ҵ���ҳ
       		</H1>
       		<DIV class=description>My Personal WebSite</DIV>
            <DIV class="userinfo">
     			<A href="#" class="username" onclick="window.open('edituser.html','','width=600,height=600')"><%=session("curUser")%></A> |
         		<A href="#" onclick="exit();">�˳�</A>
 			</DIV>
    </DIV>
	<DIV id=navigation>
        <UL>
          <LI><A href="index.asp">��ҳ</A> </LI>
          <LI><A href="friendslist.html"  target=_self>�����б�</A></LI> 
          <LI><A href="#" onclick="window.open('voteList.asp','','width=600,height=600')">���Ż���ͶƱ</A> </LI>
          <LI><A href="note.html"  target=_self>���԰�</A> </LI>        
        </UL>        
</DIV>