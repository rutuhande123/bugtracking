<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%

String bname = request.getParameter("bugname");	
	String eid = request.getParameter("eid");
	String ename = request.getParameter("empname");
	String pname = request.getParameter("pname");
	String mname = request.getParameter("mname");
String rdate = request.getParameter("rdate");

String st="Notgiven";




	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bug","root","root"); 
    PreparedStatement ps= con.prepareStatement("insert into bugreport(bugname,empid,empname,projectname,manager,rdate,status) values (?,?,?,?,?,?,?)");
   
    ps.setString(1,bname);
    ps.setString(2,eid);
    ps.setString(3,ename);
    ps.setString(4,pname);
  
    ps.setString(5,mname);
    ps.setString(6,rdate);
  
    ps.setString(7,st);
    
    ps.executeUpdate();
    con.close();
    response.sendRedirect("bugreport.jsp?msg=valid");

%>