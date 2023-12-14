<%@page import="java.sql.*" %>
<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@include file="DConnection.jsp" %>

<%
String user = request.getParameter("username");
String pwd = request.getParameter("password");


System.out.println("<br>"+user);
System.out.println("<br>"+pwd);


DConnection db=new DConnection();
ResultSet rs1=null;
String qry ="select * from register where registerid='" + user + "' and password='" + pwd + "'";
rs1 = db.getData(qry);
String u="",p="",i="",id1="",nm="";
while(rs1.next()){
	u = rs1.getString("registerid");
	out.println("<br>"+u);
	p = rs1.getString("password");
	out.println("<br>"+p);
	id1=rs1.getString("registerid");
	out.println("<br>"+id1);
	nm=rs1.getString("name");
	
}
if(u.equals(""))
	response.sendRedirect("login.jsp?msg=User id or PassWord Worng");
else if(!u.equals("")){
	session.setAttribute("id",u);
	session.setAttribute("name",nm);
	
	response.sendRedirect("userhome.jsp");
}
else {
	session.setAttribute("id",u);
	
	response.sendRedirect("home.jsp");
}
	
%>