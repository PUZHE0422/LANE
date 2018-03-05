<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>服务器环境变量</title>
</head>

<body>
<table border="1">
<%for each name in request.ServerVariables%>
<tr>
<td><%=name%></td>
<td><%=request.ServerVariables(name)%></td>
</tr>
<%next%>
</table>
</body>
</html>
