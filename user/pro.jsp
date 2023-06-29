<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<meta charset="UTF-8" />
	<meta name="viewport"
		content="width=device-width,
				initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible"
		content="ie=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

.column {
  float: left;
  width: 25%;
  padding: 5px;
}

/* Clearfix (clear floats) */
.row::after {
  content: "";
  clear: both;
  display: table;
}
.column1 {
  float: left;
  width: 50%;
  padding: 5px;
}

/* Clearfix (clear floats) */
.row1::after {
  content: "";
  clear: both;
  display: table;
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 90%;
}

.card:hover {
  box-shadow: 0 12px 19px 0 rgba(0,0,0,0.2);
}

.container {
  padding: 6px 19px;
}
hr.class-1 {
        border-top: 5px solid #8c8b8b;
    }
	div.a {
  text-align: justify; /* For Edge */
  -moz-text-align-last: right; /* For Firefox prior 58.0 */
  text-align-last: right;
}
</style>
</head>
<body>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%
	try{
	
	
Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");


       Statement statement = connection.createStatement() ;

       ResultSet resultset =statement.executeQuery("select * from product ORDER BY PID") ;
	   int i=0;
%>
<div class="row">
 <%  while(resultset.next()){
		i++;%>
 <div class="column">
<div class="card">
  <img src="<%= resultset.getString(4)%>" width="80%" height="40%">
  <div class="container">
    <h4><b><%= resultset.getString(3)%></b></h4> 
	 <hr class="class-1" />
	 <h4><b><%= resultset.getString(5)%></b></h4>
    <div class="a">
	<a href="cart.jsp?id=<%= resultset.getString(1)%>&productname=<%= resultset.getString(3)%>&img=<%= resultset.getString(4)%>"><i class="fas fa-shopping-cart"></i></a>
	</div>
  </div>
</div>
</div>
<%
if(i==4)
{ break;} 
}
 %>
</div>
<%
       }
       catch(Exception e)
       {
            out.println("wrong entry"+e);
       }
%>


<%
	try{
	
	
Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");


       Statement statement = connection.createStatement() ;

       ResultSet resultset =statement.executeQuery("select * from product where CATID=2") ;
	   int i=0;
%>
<div class="row1">
 <%  while(resultset.next()){
		i++;%>
 <div class="column1">
<div class="card">
  <img src="<%= resultset.getString(4)%>" width="50%" height="50%">
  <div class="container">
    <h4><b><%= resultset.getString(3)%></b></h4> 
	 <hr class="class-1" />
	 <h4><b><%= resultset.getString(5)%></b></h4>
    <div class="a">
		<a href="cart.jsp?id=<%= resultset.getString(1)%>&productname=<%= resultset.getString(3)%>&img=<%= resultset.getString(4)%>"><i class="fas fa-shopping-cart"></i></a>
	</div>
  </div>
</div>
</div>
<%
if(i==2)
{ break;} 
}
 %>
</div>
<%
       }
       catch(Exception e)
       {
            out.println("wrong entry"+e);
       }
%>

</body>
<%@include file="footer.jsp"%>
</html> 
