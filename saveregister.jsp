<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%
PreparedStatement stmt =null;
ResultSet rs =null;
String i1;
String fname=request.getParameter("firstname");
String email=request.getParameter("email");

String mob=request.getParameter("mob");

String pass=request.getParameter("password");
String rdate=request.getParameter("dateregistered");






	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bug","root","root"); 
	
    PreparedStatement ps= con.prepareStatement("insert into register(name,email,mobile,password,rdate) values (?,?,?,?,?)");
   
    ps.setString(1,fname);
    
    ps.setString(2,email);
  
  
    ps.setString(3,mob);
    ps.setString(4,pass);
    ps.setString(5,rdate);
   
  
  
   ps.executeUpdate();
   con.close();
   response.sendRedirect("register.jsp?msg=valid");
%>