<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
String eid=request.getParameter("eid");
String ename=request.getParameter("ename");

String prj=request.getParameter("pname");

String mname=request.getParameter("mname");
String adate=request.getParameter("adate");






	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bug","root","root"); 
    PreparedStatement ps= con.prepareStatement("insert into assign(empid,name,projectname,managername,assigndate) values (?,?,?,?,?)");
   
    ps.setString(1,eid);
    
    ps.setString(2,ename);
  
  
    ps.setString(3,prj);
    ps.setString(4,mname);
    ps.setString(5,adate);
    ps.executeUpdate();
  
  
    con.close();
    response.sendRedirect("assignemployee.jsp?msg=valid");

%>