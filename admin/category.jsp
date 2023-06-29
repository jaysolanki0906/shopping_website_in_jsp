<html>
<head>
</head>
<body>
<%@ page import="java.sql.*,java.io.*,java.util.*"%>
<%@include file="header1.jsp"%>
<form method="post">
<br><br><center>
	<h1>Insert the new category of the product</h1>
	<br><br>
	<h4>Enter the new category</h4>
	<br>
	<input type="text" name="newcat"><br>
	<br>
	<input type="submit">
	</center>
</form>
	<%
		if((request.getParameter("newcat")!=null) && request.getParameter("newcat")!="")
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");
				String qs = "select CATID from category";
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
				String ins_qs = "insert into category values(?,?)";
				PreparedStatement psmnt = con.prepareStatement(ins_qs);
				psmnt.setInt(1,id);
				psmnt.setString(2,request.getParameter("newcat"));
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
	%>
</body>
</html>