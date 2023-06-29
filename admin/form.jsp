<html>
<body>
<form method="post">
<input type="file" name="img" multiple><br>
<input type="submit" name="btn"><br>
</form>
<%
String var=request.getParameterValues("img");
String[] innerArray=new String[100];
String btns = request.getParameter("btn");
if(btns!=null)
{
	out.println(var);
}
%>
</body>
</html>