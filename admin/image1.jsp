<html>
<head>
</head>
<body>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, java.util.*"%>
<%
int id= request.getParameter("num");
out.println(id);
for(int i=0;i<id;i++)
{
%>
	<input type="file">
<%
}
%>
</body>
</html>