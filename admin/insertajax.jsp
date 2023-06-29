<%@ page import="java.sql.*,java.io.*,java.util.*"%>
<html>
<%
 
String s=request.getParameter("val");%><br><% 
if(s==null || s.trim().equals("")){  
out.print("Please enter some number");  
}else{  
int id=Integer.parseInt(s);
 %><br><br><%
String[] name=new String[12];
for(int i=0;i<id;i++)
{
	name[i] = "img" + Integer.toString(i);
	%>
	<input type="file" name="<%=name[i]%>"><br>
	<%
}
%>
<%

String si="";
String but="";
but=request.getParameter("submit");
out.println(but);
if(but!=null){
	si=request.getParameter(name[1]);
out.println(si);}



}
%>  
</html>
