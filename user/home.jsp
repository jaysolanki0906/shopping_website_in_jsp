<html>
<head>
<link rel="stylesheet" href="hom.css">
</head>
<style>h2
{
	font-family: Brush Script MT, Brush Script Std, cursive;
	font-style: oblique;
	height: 20%
}</style>
<body>
<%@include file="header1.jsp"%>
<br><br>
<center>
<%String name=(String)session.getAttribute("Uname");%>
<svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 130.2 130.2">
  <circle class="path circle" fill="none" stroke="#73AF55" stroke-width="6" stroke-miterlimit="10" cx="65.1" cy="65.1" r="62.1"/>
  <polyline class="path check" fill="none" stroke="#73AF55" stroke-width="6" stroke-linecap="round" stroke-miterlimit="10" points="100.2,40.2 51.5,88.8 29.8,67.5 "/>
</svg>
<p class="success"><h2>Welcome <%out.println(name);%> to Grocery Store.</h2></p>
</center>
<%@include file="pro.jsp"%>
</body>
</html>