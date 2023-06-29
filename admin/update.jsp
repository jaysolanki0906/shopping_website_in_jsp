<%@ page import="java.sql.*,java.io.*,java.util.*"%>
<%
	String id = request.getParameter("id");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");
		String qs = "select * from product where pid ="+id;
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
<tr>
<td>Product id</td>
<td> : </td>
<td><input type="hidden" name="id" value="<%=resultSet.getString("pid") %>"><%=resultSet.getString("pid") %></td>
</tr>
<tr>
<td>Category id</td>
<td> : </td>
<td><input type="hidden" name="cid" value="<%=resultSet.getString("catid") %>"><%=resultSet.getString("catid") %></td>
</tr>
<tr>
<td>Product Name</td>
<td> : </td>
<td><input type="text" name="Pname" value="<%=resultSet.getString("product_name") %>"></td>
</tr>
<tr>
<td>Product price</td>
<td> : </td>
<td><input type="text" name="Pprice" value="<%=resultSet.getString("product_price") %>"></td>
</tr>
<tr>
<td>Product description</td>
<td> : </td>
<td><input type="text" name="Pdesc" value="<%=resultSet.getString("product_desc") %>"></td>
</tr>
<tr>
<td>Product Image</td>
<td> : </td>
<td><img src="<%=resultSet.getString("product_image")%>" height="300" width="250" /><input type="submit" value="Want to change image" name="cimag">
<%
String tempvar=request.getParameter("cimag");
if(tempvar!=null)
{
	%><input type="file" name="img"><%
}%>

</td>
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
String name=request.getParameter("Pname");
String price=request.getParameter("Pprice");
String desc=request.getParameter("Pdesc");
String img=request.getParameter("img");

if(id != null)
{
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");
		String sql="Update product set product_name=?, product_image=?,product_price=?,product_desc=? where pid="+id;
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2,"images/"+img);
		ps.setString(3, price);
		ps.setString(4, desc);
		int i = ps.executeUpdate();
		if(i > 0)
		{
			out.print("Record Updated Successfully");
			response.sendRedirect("seepro.jsp");
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