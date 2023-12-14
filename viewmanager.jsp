<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
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
          
         
            <p><a href="#">Online Bug TRacking</a></p>
          </div>
        </div>
      </div>
    </div>
    <div id="nav">
      <ul>
       <li><a href="home.jsp">Home</a> | </li>
        <li><a href="viewmanager.jsp">ViewManager</a> | </li>
        <li><a href="viewproject.jsp">ViewProjects</a> | </li>
        <li><a href="bugreport.jsp">BugReport</a> | </li>
        <li><a href="home.jsp">Logout</a></li>
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
        <div class="col-md-7">
            
           <div class="table-responsive table-bordred table-striped"">
		<%
           int sum=0;
           int tax=0;
           int gtotal=0;
    Connection con;
    Statement st;
   
    ResultSet rs;
    try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug","root" ,"root");


        st=con.createStatement();
        rs=st.executeQuery("select * from manager");
        %>
            <table class="table movie-table" id="collapse1" border="1px">
            <thead>
                    <th><font color="pink">ID</font></th>
                    <th><font color="pink">NAME</font></th>
                     <th><font color="pink">EMAIL</font></th>
                     <th><font color="pink">MOBILE</font></th>
                     <th><font color="pink">GENDER</font></th>
                     <th><font color="pink">QUALIFICATION</font></th>
                    <th><font color="pink">JOINING DATE</font></th>
                     <th><font color="pink">PROJECT</font></th>
                  
                     
                  </thead>
                
                  <tbody>
                <%   
      
        while(rs.next())
        {
        	%>
        	 <tr>
             
        	    <td size="2px"><font color="Black"><%=rs.getString(1)%></font></td>   
          		<td size="10px"><font color="Black"><%=rs.getString(2)%></font></td>      	
          		<td size="10px"><font color="Black"><%=rs.getString(3)%></font></td>
          	    <td size="10px"><font color="Black"><%=rs.getString(4)%></font></td>
          	    <td size="10px"><font color="Black"><%=rs.getString(5)%></font></td>      	
          		<td size="10px"><font color="Black"><%=rs.getString(6)%></font></td>
          		 <td size="10px"><font color="Black"><%=rs.getString(7)%></font></td>
          	    <td size="10px"><font color="Black"><%=rs.getString(8)%></font></td> 
          	           	     	
          	    
          	   
    </tr>
          <%
        }
        
        
    }
   catch(Exception e)
    {
        e.printStackTrace();
    }

%>
  
              </tbody>
            </table>
            
            </div>

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
