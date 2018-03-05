<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>VoteNew</title>
    <link rel="stylesheet" type="text/css" href="css/makevote.css" />	
   
</head>
<%
if session("curUser")="" then
	response.Redirect("../Login/Login.asp?err=回话超时")
	response.End()
end if
if session("curUser")<>"t@t.com" then
	response.write "<script>alert('无此权限!');history.go(-1);</script>"
	response.End()
end if
%>
<body>
    <div id="allbox">
        <div class="userinterfacebox">
          <form id="makebox" action="" method="post">	
                <p>投票标题：<input type="text" placeholder="请输入标题" size="50" name="topic"/></p>                   
                <p>投票选项:</p>
                <div id="voteitems">
                    <p><input type="text" placeholder="请输入选项" size="50" name="option1"></p>
                    <p><input type="text" placeholder="请输入选项" size="50" name="option2"></p>
                    <p><input type="text" placeholder="请输入选项" size="50" name="option3"><span class="deloption" style="cursor:pointer">×</span></p>
                    <p><input type="text" placeholder="请输入选项" size="50" name="option4"><span class="deloption" style="cursor:pointer">×</span></p>
                </div>  
                    <p id="aArea">
                        <button id="btn_choose" name="addOption" onClick="">增加选项</button>
                        <button id="btn_addvote" name="saveOption">保存</button>
                       <button id="btn_back" name="view" onclick="history.go(-1);">返回</button>
                    </p>
                                    
           </form>				
        </div>
    </div>
</body>
 <script src="js/jquery-2.1.0.js" type="text/javascript"></script>
<script src="js/makevote.js" type="text/javascript"></script>
</html>
