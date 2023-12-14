
<%@page import="java.sql.*" %>
<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="java.net.*" %>


<%
	String user = request.getParameter("username");
    String pwd = request.getParameter("password");
    String u="";
    String p="";
    
	u=user;
	p=pwd;
	
	
	if (user.equals("Admin") && pwd.equals("Admin"))
			{
		response.sendRedirect("adminhome.jsp");
			}
		
	else
	{
		
		response.sendRedirect("adminlogin.jsp");
	}
	
%>