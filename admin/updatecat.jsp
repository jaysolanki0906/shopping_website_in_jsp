<%@ page import="java.sql.*,java.io.*,java.util.*"%>
<%
	String id = request.getParameter("id");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");
		String qs = "select * from category where catid ="+id;
		Statement statement = con.createStatement();
		ResultSet resultSet = statement.executeQuery(qs);
		while(resultSet.next())
		{
%>
<html>
<body>
<center>
<br>
<br>
<th><h1>Update product</h1></th>
<br>
<br>
<form method="post" >
<table border="2">
<td>Category id</td>
<td> : </td>
<td><input type="hidden" name="cid" value="<%=resultSet.getString("CATID") %>"><%=resultSet.getString("CATID") %></td>
</tr>
<tr>
<td>Product Name</td>
<td> : </td>
<td><input type="text" name="Cname" value="<%=resultSet.getString("CATNAME") %>"></td>
</tr>
<br><br>
<tr>
<td colspan="3" style="text-align:center;"><input type="submit" value="update detalis" name="submit"></td>
</tr>
</table>
</form>
<%

}
con.close();
} catch (Exception e) 
{
	e.printStackTrace();
}
%>
</center>
<%
String subm=request.getParameter("submit");
if(subm!=null)
{
String cid = request.getParameter("cid");
String name=request.getParameter("Cname");

if(id != null)
{
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");
		String sql="Update category set CATNAME=? where catid="+id;
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, name);
		int i = ps.executeUpdate();
		if(i > 0)
		{
			out.print("Record Updated Successfully");
			response.sendRedirect("seecat.jsp");
		}
		else
		{
			out.print("There is a problem in updating Record.");
		}
	}
	catch(SQLException sql)
	{
		request.setAttribute("error", sql);
		out.println(sql);
	}
}
}
%>
</body>
</html>