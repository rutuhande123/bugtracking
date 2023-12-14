<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    |<%@ page import="java.sql.*" %>
<%
String pname=request.getParameter("pname");
String vname=request.getParameter("vname");

String tech=request.getParameter("tech");

String sd=request.getParameter("sdate");
String ed=request.getParameter("edate");
String dur=request.getParameter("dur");
String pdate=request.getParameter("pdate");

String mname=request.getParameter("mname");




	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bug","root","root"); 
    PreparedStatement ps= con.prepareStatement("insert into project(name,vendorname,technology,sdate,fdate,duration,rdate,manager) values (?,?,?,?,?,?,?,?)");
   
    ps.setString(1,pname);
    
    ps.setString(2,vname);
  
  
    ps.setString(3,tech);
    ps.setString(4,sd);
    ps.setString(5,ed);
   
    ps.setString(6,dur);
    ps.setString(7,pdate);
   
    ps.setString(8,mname);
  
    ps.executeUpdate();
    con.close();
    response.sendRedirect("newproject.jsp?msg=valid");
%>