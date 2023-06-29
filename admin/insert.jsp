<html>
<head>
</head>
<body>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@include file="header1.jsp"%>
<br><br>
<form name="vinform" method="post"> 
	<center><h1>Insertion operation in database</h1>
	<br><br>
	<h4>Enter Product Name</h4><input type="text" name="pro"><br>
	<h4>Enter Product Image</h4><input type="file" name="img"><br>
	<h4>Choose Category</h4>
	<%
	try{
	
	
Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");


       Statement statement = connection.createStatement() ;

       ResultSet resultset =statement.executeQuery("select * from category") ;
%>

<center>
        <select name="dr">
        <%  while(resultset.next()){ %>
            <option><%= resultset.getString(2)%></option>
        <% } %>
        </select>
</center>
	
	<%
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>

	<h4>Enter product Price</h4><input type="number" name="price"><br>
	<h4>Enter product Description</h4> <input type="text" name="desc"><br>
	
	<input type="submit" name="submit">
</form>
	<%
	String x=request.getParameter("submit");
if (x!=null)
{
String id1 = request.getParameter("file");
out.println(id1);
String drop=request.getParameter("dr");
out.println(drop);
int str=0;
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");


       Statement statement = connection.createStatement() ;

       ResultSet resultset =statement.executeQuery("select * from category") ;
	   while(resultset.next()){
		   if(drop.equals(resultset.getString(2)))
		   {
			   str= resultset.getInt(1);
			   out.println(str);
			   break;
			   
		   }
	   }
}
catch(Exception e)
{
		out.println(e);
}

if((request.getParameter("pro")!="") && request.getParameter("file")!="" && (request.getParameter("dr")!="") &&
(request.getParameter("price")!="") && (request.getParameter("desc")!="" ))
{
		String productname = request.getParameter("pro");
		out.println(productname);
		String priceproduct = request.getParameter("price");
		String description = request.getParameter("desc");
		String img=request.getParameter("img");
		try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");
				String qs = "select pid from product";
				Statement smnt = con.createStatement();
				ResultSet res = smnt.executeQuery(qs);
				boolean flag = res.next();
				int id=0;
				if(flag)
				{
					while(flag)
					{
						id = res.getInt(1);
						flag=res.next();
					}
					id=id+1;
				}
				else
				{
					id=1;
				}
				String ins_qs = "insert into product values(?,?,?,?,?,?)";
				PreparedStatement psmnt = con.prepareStatement(ins_qs);
				psmnt.setInt(1,id);
				psmnt.setInt(2,str);
				psmnt.setString(3,productname);
				psmnt.setString(4,"images/"+img);
				psmnt.setString(5,priceproduct);
				psmnt.setString(6,description);
				
	
				int i= psmnt.executeUpdate();

				if(i==0)
					out.println("insertion failed");

				else
					out.println("insertion success");
			}
			catch(Exception e)
			{
				out.println(e);
			}
	}
}
%>
</body>
</html>