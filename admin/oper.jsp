I need to make my jsp page work without reloading page using jquery.

$(".btn.btn-default.btn-lg").click(function( event ) {
    event.preventDefault();
    $.post(main.jsp,{operand1: request.getParameter("operand1")});
    alert(<%= request.getParameter("operand1") %>);
});
I'm trying to post parameter to the page and alert it. Nothing happens. However function works fine. what's my mistake?

Here is full jsp code.

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<form class="form-horizontal" role="form" method="get">
 <div class="form-group">
 <div class="col-lg-10">
<input name="operand1" id="operand1" class="values"></input>
<input name="operand2" id="operand2" class="values"></input>
</div>
</div>
 <div class="form-group">
<div class="col-lg-10">
<select name="operation" id="operation" class="values">
<option value="plus">+</option>
<option value="minus">-</option>
<option value="multiply">*</option>
<option value="divide">/</option>
<option value="mod">mod</option>
</select>
</div>
</div>
 <div class="form-group">
 <div class="col-lg-10">
<input type="submit" class="btn btn-default btn-lg" value="Submit"></input>
</div>
</div>
</form>
<script>
$(".btn.btn-default.btn-lg").click(function( event ) {
    event.preventDefault();
    $.ajax({
        method:"POST",
        url: "main.jsp",
        data: {operand1: document.getElementById("operand1").value, operand2: document.getElementById("operand2").value, operation: document.getElementById("operation")}
    }).done(function (result) {
              alert(result);
    });
    alert($('input.values').val());
});
</script>
<%
Double operand1=0.0;
Double operand2=0.0;
String operation=new String();
if ((request.getParameter("operand1")!=null)&&(request.getParameter("operand2")!=null)&&(request.getParameter("operation")!=null)){
    operand1 = Double.parseDouble(request.getParameter("operand1"));
    operand2 = Double.parseDouble(request.getParameter("operand2"));
    operation=request.getParameter("operation");
}
Double result=0.0;
if (operation.equals("plus")){
    result=operand1+operand2;
}
if (operation.equals("minus")){
    result=operand1-operand2;
}
if (operation.equals("divide")){
    result=operand1/operand2;
}
if (operation.equals("multiply")){
    result=operand1*operand2;
}
if (operation.equals("mod")){
    result=operand1%operand2;
}
if ((request.getParameter("operand1")!=null)&&(request.getParameter("operand2")!=null)&&(request.getParameter("operation")!=null)){
    String resultString="Result:";
    out.println(resultString+result);
}
%>
</body>
</html