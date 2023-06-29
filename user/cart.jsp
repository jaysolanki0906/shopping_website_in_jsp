
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@include file="header1.jsp"%>
<%
int tempid=0;
int id1=0;
int pid=0;
String str = request.getParameter("id");
String product = request.getParameter("productname");
String img = request.getParameter("img");
out.println(str);
out.println(product);
out.println(img);
String name=(String)session.getAttribute("Uname");
try
{
	pid = Integer.parseInt(str);
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");
	String qs = "select id from proreg where USERNAME='"+name+"'";
	Statement smnt = con.createStatement();
	ResultSet res = smnt.executeQuery(qs);
	boolean flag = res.next();

	if(flag)
	{
		tempid = res.getInt(1);
		flag=res.next();
	}
	out.println(tempid);
}catch(Exception e)
{
	out.println(e);
}

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");
	String qs = "select CARTID from cart";
	Statement smnt = con.createStatement();
	ResultSet res = smnt.executeQuery(qs);
	boolean flag = res.next();
	if(flag)
	{
		while(flag)
		{
			id1 = res.getInt(1);
			flag=res.next();
		}
		id1=id1+1;
	}
	else
	{
		id1=1;
	}
	String ins_qs = "insert into cart values(?,?,?,?,?,?,?)";
	PreparedStatement psmnt = con.prepareStatement(ins_qs);
	psmnt.setInt(1,id1);
	psmnt.setInt(2,pid);
	psmnt.setInt(3,tempid);
	int tr=1;
	psmnt.setInt(4,tr);
	psmnt.setString(5,"Unpaid");
	psmnt.setString(6,product);
	psmnt.setString(7,img);
	int i= psmnt.executeUpdate();
	if(i==0)
	out.println("insertion failed");
	else{
	out.println("insertion success");
	}
}
catch(Exception e)
{
	out.println(e);
}
%>
<%@include file="cart1.jsp"%>