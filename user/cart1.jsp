<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
a:link {
  text-decoration: none;
}

a:visited {
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

a:active {
  text-decoration: underline;
}
</style>

</head>
<%@include file="header1.jsp" %>
<body>
<%@ page import="java.sql.*,java.io.*,java.util.*,java.sql.*"%>
<br><br><br>
<%
int tempid1=0;
String name12=(String)session.getAttribute("Uname");
String name123=(String)session.getAttribute("Pass");
out.println(name12);
out.println(name123);
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");
	String qs = "select id from proreg where USERNAME='"+name12+"' and PASSWORD='"+name123+"'";
	Statement smnt = con.createStatement();
	ResultSet res = smnt.executeQuery(qs);
	boolean flag = res.next();
	if(flag)
	{
		tempid1 = res.getInt(1);
		flag=res.next();
	}
	out.println(tempid1+"");
}catch(Exception e)
{
	out.println(e);
}
%>
<center>
	<table border="1" id="customers">
	<tr>
	<th>Name</th>
	<th>price</th>
	<th>Qty</th>
	<th>Image</th>
	<th>Delete</th>
	<th>BuyNow</th>
	</tr>
	<%
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");
			String qs="select c.cartid,p.PRODUCT_NAME,p.PRODUCT_PRICE,c.QUANTITY,p.PRODUCT_IMAGE from product p,cart c where p.PID=c.PID and c.rid='"+tempid1+"'";
			Statement statement = con.createStatement();
			ResultSet resultSet = statement.executeQuery(qs);
			while(resultSet.next()){
			%>
			<tr>
			<td><%=resultSet.getString(2) %></td>
			<td><%=resultSet.getString(3) %></td>
			<td><%=resultSet.getInt(4) %></td>
			<td><img src="<%=resultSet.getString(5)%>"></td>
			<td><a href="deletecart.jsp?id=<%=resultSet.getInt(1)%>"><i class="fas fa-shopping-bag"></i>Buy Now</a></td>
			<td><a href="deletecart.jsp?id=<%=resultSet.getInt(1)%>"><i class="fas fa-trash-alt"></i>DELETE</a></td>
			</tr>
			<%
			}
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
			e.printStackTrace();
		}
%>