<%@ page import="java.sql.*,java.io.*,java.util.*"%>
<%
	String id = request.getParameter("id");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");
		Statement st = con.createStatement();
		int i = st.executeUpdate("delete from product where pid="+id);
		response.sendRedirect("seepro.jsp");
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>