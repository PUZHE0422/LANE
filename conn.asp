<%@CODEPAGE=65001%>
<%Response.CodePage=65001%>  
<%Response.Charset="UTF-8"%>
<%     
	strconnection="driver={mysql odbc 5.1 driver};database=user;server=localhost;PORT=3306;uid=root;password=2014zxm"  
	set conn = server.createobject("adodb.connection") 
	conn.open strconnection
	conn.CursorLocation=3
	set rs=server.createobject("ADODB.RecordSet")
%> 
   
