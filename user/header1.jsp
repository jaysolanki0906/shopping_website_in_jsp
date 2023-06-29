<html>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body id="myPage">

<!-- Sidebar on click -->
<nav class="w3-sidebar w3-bar-block w3-white w3-card w3-animate-left w3-xxlarge" style="display:none;z-index:2" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-display-topright w3-text-teal">Close
    <i class="fa fa-remove"></i>
  </a>
  <a href="#" class="w3-bar-item w3-button">Link 1</a>
  <a href="#" class="w3-bar-item w3-button">Link 2</a>
  <a href="#" class="w3-bar-item w3-button">Link 3</a>
  <a href="#" class="w3-bar-item w3-button">Link 4</a>
  <a href="#" class="w3-bar-item w3-button">Link 5</a>
</nav>

<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  <a href="home.jsp" class="w3-bar-item w3-button w3-teal"><i class="fa fa-home w3-margin-right"></i>Home</a>
  <a href="product.jsp" class="w3-bar-item w3-button w3-hide-small w3-hover-white">See All Product</a>
  <a href="cart1.jsp" class="w3-bar-item w3-button w3-hide-small w3-hover-white">See Cart</a>
   <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button" title="Notifications">See Category Wize Product <i class="fa fa-caret-down"></i></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block">
	<%
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");
		Statement statement = connection.createStatement() ;
		ResultSet resultset =statement.executeQuery("select CATNAME from category ORDER BY catid") ;
%>
 <%  while(resultset.next()){ %>
      <a href="searchbycat.jsp?name=<%= resultset.getString(1)%>" class="w3-bar-item w3-button"><%= resultset.getString(1)%></a>
	   <% } %>
<%
    }
    catch(Exception e)
    {
        out.println("wrong entry"+e);
    }
%>
    </div>
	</div>
  <a href="Logout.jsp" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Logout</a>
    <div class="w3-dropdown-hover w3-hide-small">
  </div>
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal" title="Search"><input type="submit" name="submit" ><i class="fa fa-search"></i></input></a>
 </div>
</div>
</body>
</html>