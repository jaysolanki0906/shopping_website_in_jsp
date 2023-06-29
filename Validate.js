function validate_log()
{
	if(document.login.Uname.value =="")
	{
		alert("Please provide your User Name!!");
		document.login.Uname.focus();
		return false;
	}
	if(document.login.Pass.value =="")
	{
		alert("Please provide your Password!!");
		document.login.Pass.focus();
		return false;
	}
	return (true);
}
function validate_reg()
{
	if(document.reg.Uname.value =="")
	{
		alert("Please provide your User Name!!");
		document.reg.Uname.focus();
		return false;
	}
	if(document.reg.Pass.value =="")
	{
		alert("Please provide your Password!!");
		document.reg.Pass.focus();
		return false;
	}
	if(document.reg.Pass.value.length < 5)
	{
		alert("Minimun password should be 5 characters");
		document.reg.Pass.focus();
		document.reg.Pass.value="";
		return false;
	}
	if(document.reg.Email.value!="")
	{	
		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

		if (!filter.test(document.reg.Email.value))
		{
			alert("Please provide a valid email address");
			email.focus;
			return false;
		}
	}
	return (true);
}