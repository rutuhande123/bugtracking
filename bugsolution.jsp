<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>

<%ResultSet resultset =null;%>
    
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Free Bootstrap Admin Template : Binary Admin</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">ADMIN PANEL</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;">  <a href="Home.jsp" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
					
                    <li>
                        <a class="active-menu"  href="adminhome.jsp"> Dashboard</a>
                    </li>
                     <li>
                        <a  href="newflight.jsp">ADDFLIGHT</a>
                    </li>
                    <li>
                        <a  href="newairline.jsp">ADD AIRLINE</a>
                    </li>
						   <li  >
                        <a   href="schedule.jsp">NEW FLIGHT SCHEDULE</a>
                    </li>	
                  		
					
					                   
                    <li>
                        <a href="#">View Report<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="viewregister.jsp">Register</a>
                            </li>
                            <li>
                                <a href="viewbooking.jsp">Booking</a>
                            </li>
                           
                             </ul>
                      </li>       
                     <li>
                            
                              <a href="#">Update<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="updateflight.jsp">Flight</a>
                            </li>
                            <li>
                                <a href="updateschedule.jsp">FlightSchedule</a>
                            </li>
                            <li>  

                                
                               
                            </li>
                        </ul>
                      </li>  
                        </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>ONLINE BUG TRACKING</h2>   
                        <h5>Welcome ADMIN  </h5>
                       
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
               <div class="row">
                <div class="col-md-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            VIEW REPORTED BUG
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-11" id="collapse1">
                                   
               
        <h4><font color="Orange">BUG REPORT</font></h4>
        <div class="table-responsive">
 <%
           int sum=0;
           int tax=0;
           int gtotal=0;
    Connection con;
    Statement st;
   
    ResultSet rs;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");

        con=DriverManager.getConnection("jdbc:mysql://localhost:3307/bug","root" ,"root");


        st=con.createStatement();
        rs=st.executeQuery("select * from bugreport");
        %>
                
              <table class="table movie-table" id="collapse1">
                   
                   <thead>
                 
                 
                   <th><font color="Red">REPORTID</font></th>
                      <th><font color="Red">BUG</font></th>
                  
                     <th><font color="Red">EMPLOYEEID</font></th>
                       <th><font color="Red">NAME</font></th>
                    <th><font color="Red">PROJECTNAME</font></th>
                     <th><font color="Red">MANAGER</font></th>
                      <th><font color="Red">REPORTDATE</font></th>
                    <th><font color="Red">IMAGE</font></th>
                     <th><font color="Red">SOLUTION</font></th>
                    
                    
                   </thead>
                 
    <tbody>
    
   <%   
      String i;
        while(rs.next())
        {
        	i=rs.getString(1);
        	%>
        
        	
       	 <tr>
            
       	      <td size="2px"><font color="Red"></font><A href="./bugsolution1.jsp?bid=<%=i%>"><font color="Red">SOLUTION</font>&nbsp;&nbsp;<%=i%></A></td>   
         		<td size="10px"><font color="Black"><%=rs.getString(2)%></font></td>      	
         		<td size="10px"><font color="Black"><%=rs.getString(3)%></font></td>
         	    <td size="10px"><font color="Black"><%=rs.getString(4)%></font></td>
         	    <td size="10px"><font color="Black"><%=rs.getString(5)%></font></td>      	
         		<td size="10px"><font color="Black"><%=rs.getString(6)%></font></td>
         		 <td size="10px"><font color="Black"><%=rs.getString(7)%></font></td>
         	     <td><img src="<%=rs.getString(8)%>" height=70 width=50></img></td>
         	           	     	
         	    <td size="10px"><font color="Black"><%=rs.getString(9)%></font></td> 
         	   
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
  
<div class="clearfix"></div>
<ul class="pagination pull-right">
  <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
  <li class="active"><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
</ul>
                
            </div>
            
        </div>
                                       
                                    
                     <!-- End Form Elements -->
                </div>
            </div>
                <!-- /. ROW  -->
              
                <!-- /. ROW  -->
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
   
</body>
</html>
