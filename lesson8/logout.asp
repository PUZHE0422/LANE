<%
response.Cookies("cUsername")=""
session.Abandon()
response.Redirect("login.asp")
%>