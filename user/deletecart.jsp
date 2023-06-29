<%@ page import="java.sql.*,java.io.*,java.util.*"%>
<%
String str = request.getParameter("id");
try
{
	int id = Integer.parseInt(str);
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");
		Statement st = con.createStatement();
		int i = st.executeUpdate("delete from cart where cartid="+id);
		response.sendRedirect("cart1.jsp");
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
catch(Exception e)
{
	out.println(e);
}
%>