<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Fashion Hut</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="function.js"></script>
</head>
<body>
<div id="wrapper">
  <div id="header">
    <div id="logo">
      <h1>Online Bug Tracking</h1>
      <p>The Ultimate Solution</p>
    </div>
    <div id="cart">
      <div id="cart-top">
        <div id="cart-bot">
          <div id="cart-cart">
            <p>Shopping Cart</p>
            <p class="orange">Lorem ipsum dolor sit</p>
            <p><a href="#">click here</a></p>
          </div>
        </div>
      </div>
    </div>
    <div id="nav">
      <ul>
        <li><a href="home.jsp">Home</a> | </li>
       
        <li><a href="register.jsp">Register</a> | </li>
        <li><a href="login.jsp">UserLogin</a> | </li>
        <li><a href="adminlogin.jsp">AdminLogin</a></li>
      </ul>
    </div>
    <div id="gallery">
      <ul>
        <li class="gwomen"><a href="#">Women</a></li>
        <li class="gkids"><a href="#">Kids</a></li>
        <li class="gmen"><a href="#">Men</a></li>
      </ul>
    </div>
  </div>
  <div id="body">
   <p>${message}</p>
   <div class="container">
	<div class="row">
        <div class="col-md-6">
         <%
      Statement stmt=null;
      ResultSet rs=null;
      String i1=null;
      String message=null;
      String msg=request.getParameter("msg");
      if("valid".equals(msg))
      {
    	  Class.forName("com.mysql.cj.jdbc.Driver");
  	      Connection con= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bug","root","root"); 
    	  String Query = "Select max(registerid) from register";
		  stmt = con.createStatement();
		 rs = stmt.executeQuery(Query);
		
		 while(rs.next())
		 {
		     i1=rs.getString(1);
		 }
    	 message="Registered  Successfully with RegisterID=" +i1+"";
    	
    	
    	
      %>
      <h5><font color="red"><%=message%></font></h5>
      <%} %>
      <%
      if("invalid".equals(msg))
      {
      %>
      <h1>Error in code</h1>
      <%} 
      %>
            <form action="saveregister.jsp" method="post" id="fileForm" role="form">
            <fieldset><legend class="text-center">Registration <span class="req"><small> </small></span></legend>

           
            <div class="form-group"> 	 
                <label for="firstname"><span class="req">* </span> Name: </label>
                    <input class="form-control" type="text" name="firstname" id = "txt" /> 
                        <div id="errFirst"></div>    
            </div>

           

            <div class="form-group">
                <label for="email"><span class="req">* </span> Email Address: </label> 
                    <input class="form-control" required type="text" name="email" id = "email" />   
                        <div class="status" id="status"></div>
            </div>
              <div class="form-group">
            <label for="mob"><span class="req">* </span> Mobile Number: </label>
                    <input required type="text" name="mob" id="phone" class="form-control phone" maxlength="28"/> 
            </div>

          

            <div class="form-group">
                <label for="password"><span class="req">* </span> Password: </label>
                    <input required name="password" type="password" class="form-control inputpass" minlength="4" maxlength="16"  id="pass1"/> </p>

                <label for="password"><span class="req">* </span> Password Confirm: </label>
                    <input required name="password" type="password" class="form-control inputpass" minlength="4" maxlength="16" placeholder="Enter again to validate"/> 
                        <span id="confirmMessage" class="confirmMessage"></span>
            </div>

            <div class="form-group">
            
                 <label for="dateregistered"><span class="req">* </span> Date: </label>
                <input type="date"  name="dateregistered" class="form-control">
             
                <hr>

              
            </div>

            <div class="form-group">
                <input class="btn btn-success" type="submit" name="submit_reg" value="Register">
            </div>
                     
 

            </fieldset>
            </form><!-- ends register form -->


        </div>
   
           

	</div>
</div>

  </div>
 
  <div id="copyright">
    <p>Copyright &copy; 2007. Company name all rights reserved | designed by <a href="http://www.freewebsitetemplates.com">free website templates</a></p>
  </div>
</div>
</body>
</html>
