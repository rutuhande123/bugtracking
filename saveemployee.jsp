<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%

String fname=request.getParameter("firstname");
String email=request.getParameter("email");

String mob=request.getParameter("mob");

String gen=request.getParameter("gen");
String qua=request.getParameter("qua");
String jdate=request.getParameter("jdate");






	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bug","root","root"); 
    PreparedStatement ps= con.prepareStatement("insert into employee(name,email,mobile,gender,quali,jdate) values (?,?,?,?,?,?)");
   
    ps.setString(1,fname);
    
    ps.setString(2,email);
  
  
    ps.setString(3,mob);
    ps.setString(4,gen);
    ps.setString(5,qua);
   
    ps.setString(6,jdate);

  
  
    ps.executeUpdate();
    con.close();
    response.sendRedirect("employee.jsp?msg=valid");
%>