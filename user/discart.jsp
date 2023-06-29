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
<body>
<br><br>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@include file="header1.jsp"%>
<table id="customers">
  <tr>
	<th>CartId</th>
	<th>PID</th>
	<th>RID</th>
	<th>QUANTITY</th>
	<th>STATUS</th>
	<th>PRODUCT_NAME</th>
	<th>PRODUCT_IMAGE</th>
	<th>Delete</th>
	<th>Buy Now</th>
	
  </tr>
  
  <%
	try{
	
	
Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");


       Statement statement = connection.createStatement() ;

       ResultSet resultset =statement.executeQuery("select * from cart") ;
%>
 <%  while(resultset.next()){ %>
		<tr>
		<td><%= resultset.getString(1)%></td>
		<td><%= resultset.getString(2)%></td>
		<td><%= resultset.getString(3)%></td>
		<td><%= resultset.getString(4)%></td>
		<td><%= resultset.getString(5)%></td>
		<td><%= resultset.getString(6)%></td>
		<td> <img src="<%= resultset.getString(7)%>" width="70%" height="30%"></td>
		<td><a href="deletecart.jsp?id=<%=resultset.getString(1)%>"><i class="fas fa-shopping-bag"></i>Buy Now</a></td>
		<td><a href="deletecart.jsp?id=<%=resultset.getString(1)%>"><i class="fas fa-trash-alt"></i>DELETE</a></td>
		</tr>
		 <% } %>
<%
       }
       catch(Exception e)
       {
            out.println("wrong entry"+e);
       }
%>

</table>

</body>
</html>