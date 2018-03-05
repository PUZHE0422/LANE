<%
	response.Cookies("cUsername")=""
	session.Abandon()
	response.Redirect("../../Login/Login.asp")
%>
