<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>投票结果</title>
		<link rel="stylesheet" href="css/voteresult.css"  type="text/css"/>
		<script src="js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
    <!--#include file="../conn.asp"-->
    <%
		infoId=request.QueryString("infoId")
		if infoId="" then
			response.write "<script>alert('投票主题不存在!');history.go(-1);</script>"
			response.End()
		end if
		strsql="select * from voteinfo where infoId=" & infoId
		rs.open strsql,conn,1
	%>
		<div class="resultext">
        	<%
			set rs1=server.CreateObject("ADODB.RecordSet")
			rs1.open "select * from votecontent where infoId=" & rs("infoId"),conn,1
			if rs1.recordcount=0 then
				response.write "<p>选项未设置</p>"
				response.End()
			end if
			if rs("total")=0 then
				response.write "<script>alert('无人投票!');window.opener.location.reload();window.close();</script>"
				response.End()
			end if
			randomize
			for i= 1 to rs1.recordcount
					r=int(rnd()*256)
					g=int(rnd()*256)
					b=int(rnd()*256)
					response.write "<p style='margin-bottom:10px;'><span style='float:left;width:150px;'>" & rs1("option") & "</span><span style='float:left;width:300px;margin-right:50px;'><span style='float:left;background-color:rgb(" & r & "," & g & "," & b & ");width:" & rs1("num")/rs("total") * 200 & "px;'>&nbsp;</span></span><span>" & rs1("num") & "(" & FormatNumber(rs1("num")/rs("total")*100,1) & "%)</span></p>"
				rs1.movenext
			next 
			%>
            <button id="btn_back" name="view" onclick="history.go(-1);">返回</button>
		</div>		
	</body>
</html>