<!DOCTYPE HTML>
<HTML>
<HEAD>
	<TITLE>ͶƱ</TITLE>
	<META charset="gb2312">
     <script src="style/jquery-1.11.1.min.js" type="text/javascript"></script>
	<LINK rel=stylesheet type=text/css href="style/style.css">
</HEAD>
<%
'if session("curUser")="" then
'	response.write "<script>window.opener.location.reload();window.close();"
'	response.End()
'end if
'if session("curUser")<>"admin" then
'	response.write "<script>alert('�޴�Ȩ��!');history.go(-1);"
'	response.End()
'end if
%>
<script type="text/javascript">
	var optionNum=4;
	$(document).on('click','.delOpiton',function(){
		optionNum--;
		$(this).parent().remove();	
		
	});
	$(document).ready(function(){
		$('#addOption').click(function(){
				var addHtml;
				optionNum++;
				addHtml="<p>ѡ��"+ optionNum + "<input name='option"+ optionNum + "' type='text' size='50'><span class='delOpiton' style='cursor:pointer'>��</span></p>";	
				$(addHtml).insertBefore($('#aArea'));
				
		});	
		$('#saveOption').click(function(){
			var flag=true;
			$.each($('input[type=text]'),function(i,item){
				if($(item).val()=='')
				{
					alert('����ѡ�����ݱ���');
					flag=false;
					return false;
				}
			});
			if(flag){
				$("#vote_form").attr('action','voteCreate.asp?optionNum='+optionNum);
				$("#vote_form").submit();
			}
		});
	});
</script>
<BODY>
<form id="vote_form" action="" method="post">
<DIV class="voteboard">
    <DIV class="voteQuestion">
        	<H1>���⣺<input name="topic" type="text" size="50"></H1>
    </DIV>
	<DIV class="voteitems">
    		<p>
            	ѡ��1<input name="option1" type="text" size="50">
            </p>
            <p>
            	ѡ��2<input name="option2" type="text" size="50">
            </p>
            <p>
            	ѡ��3<input name="option3" type="text" size="50"><span class='delOpiton' style="cursor:pointer">��</span>
            </p>
            <p>
            	ѡ��4<input name="option4" type="text" size="50"><span class='delOpiton' style="cursor:pointer">��</span>
            </p>
             <p id="aArea">
                 <input class="votebutton" type="button" value="+����ѡ��" name="addOption" id="addOption">
                 <input class="votebutton" type="button" value="����" name="saveOption" id="saveOption">
                  <input class="votebutton" type="button" value="����" name="view" onClick="history.go(-1);">
     		 </p>       
	</DIV>
</DIV>
</form> 
</BODY>
</HTML>
