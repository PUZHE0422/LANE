<%
SET conn=server.CreateObject("ADODB.Connection")
conn.open "Driver={Microsoft Access Driver (*.mdb)};Dbq=" & server.MapPath("data/user.mdb")
'conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.Mappath("data/user.mdb")
set rs=server.CreateObject("ADODB.RecordSet")
%>