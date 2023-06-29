<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="regcss.css">
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
    
<head>
	<title>Registration page</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
	<script type="text/javascript" src="Validate.js"></script>
	<style>
	
	#wgtmsr{
 width:150px;   
}
</style>
</head>
<body >
<%@ page import="java.sql.*,java.io.*,java.util.*"%>
	<div class="container ">
		<div class="d-flex justify-content-center h-100">
			<div class="user_card">
				<div class="d-flex justify-content-center">
					<div class="brand_logo_container">
						<center><img src="sym.jpg" class="brand_logo" alt="Logo" height="10%" width="30%"></center>
					</div>
				</div>
				<div class="d-flex justify-content-center form_container">
					<form onsubmit="validate_reg()" method="post" action="Register.jsp" id="reg"  name="reg">
					<center><label>Select User type</label><br>
			<select id="wgtmsr" name="drop">
				<option>User</option>
				<option>Admin</option>
			</select><br /><br /><center>
						<div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" name="fname" class="form-control input_user" value="" placeholder="Enter Full Name">
						</div>
						<div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-envelope-square"></i></span>
							</div>
							<input type="text" id="Email" name="Email" class="form-control input_user" value="" placeholder="Enter E-Mail">
						</div>
						<div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-users"></i></span>
							</div>
							<input type="text" name="Uname" class="form-control input_user" value="" placeholder="Enter Username">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" name="Pass" class="form-control input_pass" value="" placeholder="Password">
						</div>
						<div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-check-circle"></i></span>
							</div>
							<input type="password" name="Con_Pass" class="form-control input_user" value="" placeholder="Confirm Password">
						</div>
						<div class="form-group">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" id="customControlInline">
								<label class="custom-control-label" for="customControlInline">Remember me</label>
							</div>
						</div>
							<div class="d-flex justify-content-center mt-3 login_container">
				 	<button type="Submit" name="button" class="btn login_btn">Register</button>
				   </div>
					</form>
				</div>
		
				<div class="mt-4">
					<div class="d-flex justify-content-center links">
						Do you have an account? <a href="Index.jsp" class="ml-2">Sign in</a>
					</div>
					
				</div>
			</div>
		</div>
	</div>
<%
String password1 = request.getParameter("Pass"); 
String password2 = request.getParameter("Con_Pass");

if(request.getParameter("button") != null)
if (password1!=null  && password2!=null) 
{
    
    if (password1.equals(password2)) 
   {

		out.println("forward");
		if((request.getParameter("Email")!=null) && request.getParameter("Email")!=""&& (request.getParameter("Uname")!=null) &&
			(request.getParameter("Pass")!=null) && (request.getParameter("Email")!="")&& (request.getParameter("Pass")!=""))
		{

			String fname = request.getParameter("fname");
			String Email = request.getParameter("Email");
			String Uname = request.getParameter("Uname");
			String Pass = request.getParameter("Pass");
			String CPass = request.getParameter("Con_Pass");
			String drop=request.getParameter("drop");
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","system","manager");
				String qs = "select id from proreg";
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
				String ins_qs = "insert into proreg values(?,?,?,?,?,?)";
				PreparedStatement psmnt = con.prepareStatement(ins_qs);
				psmnt.setInt(1,id);
				psmnt.setString(2,fname);
				psmnt.setString(3,Email);
				psmnt.setString(4,Uname);
				psmnt.setString(5,Pass);
				psmnt.setString(6,drop);
	
				int i= psmnt.executeUpdate();

				if(i==0)
					out.println("insertion failed");

				else{
				out.println("insertion success");
				if(drop.equals("Admin"))
				{
				response.sendRedirect("admin/home.jsp");
				session.setAttribute("Uname",Uname);
				session.setAttribute("Uname",Pass);
				}
				else
				{
					response.sendRedirect("user/home.jsp");
					session.setAttribute("Uname",Uname);
					session.setAttribute("Pass",pass); 
				}
			}
			}
			catch(Exception e)
			{
				out.println(e);
			}
		}
		else
		{
			out.println("not match requirement");
		}
		
	}
	else
	{
		out.println("Please enter password and confirm password correct");
	}
}
else
{
	out.println("Passowrs are null");
}
%>
</body>
</html>