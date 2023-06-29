<HTML>
<BODY>
<%@ page import="java.sql.*,java.io.*,java.util.*,java.sql.*"%>
<%
	boolean log=false;
	String uname = request.getParameter("Uname");
	String pass = request.getParameter("Pass");
	String login=request.getParameter("drop");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");
		String ins_qs = "select * from proreg where USERNAME=? and PASSWORD=? and LOGTYPE=?";
		PreparedStatement psmnt = con.prepareStatement(ins_qs);
		psmnt.setString(1,uname);
		psmnt.setString(2,pass);
		psmnt.setString(3,login);
		int i= psmnt.executeUpdate();
		if(i==0)
			out.println("insertion failed");
		else{
			out.println("insertion success");
			if(login.equals("Admin"))
			{
				out.println(login);
				session.setAttribute("Uname",uname); 
				session.setAttribute("Pass",pass); 
				response.sendRedirect("admin/home.jsp");
			}
			else
			{
				out.println(login);
				session.setAttribute("Uname",uname);
				session.setAttribute("Pass",pass); 
				response.sendRedirect("user/home.jsp");
			}
			}
	}
	catch(Exception e)
	{
		out.println(e);
	}
	
	%>
</BODY>
</html>