<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, java.util.*"%>
<%
String id= request.getParameter("name");
out.println(id);
%>