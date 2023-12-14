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
                        <a  href="newproject.jsp">ADD PROJECT</a>
                    </li>
                    <li>
                        <a  href="employee.jsp">ADD EMPLOYEE</a>
                    </li>
						   <li  >
                        <a   href="manager.jsp">ADD MANAGER</a>
                    </li>	
                    			
					<li  >
                        <a   href="assignemployee.jsp">ASSIGN EMPLOYEE</a>
                    </li>	
					                   
                     <li>
                        <a href="#">View Report<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="viewregister.jsp">Register</a>
                            </li>
                            <li>
                                <a href="viewbugreport.jsp">View Bug</a>
                            </li>
                           
                             </ul>
                      </li>       
                     <li>
                            
                              <a href="#">Update<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="updateproject.jsp">Project</a>
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
                     <h2>BUG TRACKING</h2> <img src="images/eg3.gif" height="130" width="600"> 
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
                            ASSIGN EMPLOYEE
                        </div>
                        <div class="panel-body">
                            <div class="row" >
                                <div class="col-md-6" >
                                   
                                        <h3><p>${message}</p></h3>
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
    	  String Query = "Select max(empid) from assign";
		  stmt = con.createStatement();
		 rs = stmt.executeQuery(Query);
		
		 while(rs.next())
		 {
		     i1=rs.getString(1);
		 }
    	 message="Projetc Assigned  Successfully with EmployeeID=" +i1+"";
    	
    	
    	
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
                     <form action="saveassign.jsp" method="post" id="fileForm" role="form">
            <fieldset><legend class="text-center">ASSIGN EMPLOYEE  <span class="req"><small> </small></span></legend>

           
            <div class="form-group"> 	 
                <label for="eid"><span class="req">* </span> Employee ID: </label>
                    <input class="form-control" type="text" name="eid" id = "txt"  required  value="${message1}"/> 
                        <div id="errFirst"></div>    
            </div>

           

            <div class="form-group">
                <label for="ename"><span class="req">* </span> Employee Name: </label> 
                    <input class="form-control" required type="text" name="ename" id = "ename" value="${message2}"  />   
                        <div class="status" id="status"></div>
            </div>
             

                <%
                try{


                        Class.forName("com.mysql.cj.jdbc.Driver");
			            Connection con= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bug","root","root"); 
                        Statement statement = con.createStatement() ;
                        resultset =statement.executeQuery("select name from project") ;
                    %>
					     <div class="form-group">
					      <label for="pname"><span class="req">* </span> Project Name: </label>
					 	 <select  name="pname" id="aname" class="form-control">
					 	 <option value="None">Select Project Name</option>
              <%          while(resultset.next()){ %>
                          <option><%= resultset.getString(1)%></option>
                <% } %>
        
                </select>
               <%

                  }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
		</div>	
                  <div class="form-group">
                <label for="mname"><span class="req">* </span> Manager Name: </label> 
                    <input class="form-control" required type="text" name="mname" id = "ename"  value="${message4}"  />   
                        <div class="status" id="status"></div>
            </div>

            
           
            <div class="form-group">
            <label for="adate"><span class="req">* </span> Assign Date: </label>
                    <input required type="date" name="adate" id="adate" class="form-control phone" value="${message5}" /> 
            </div>
            <div class="form-group">
            
                <?php //$date_entered = date('mm/dd/YYYY'); ?>
                <input type="hidden" value="<?php //echo $date_entered; ?>" name="dateregistered">
                <input type="hidden" value="0" name="activate" />
                <hr>

                <input type="checkbox" required name="terms" onchange="this.setCustomValidity(validity.valueMissing ? 'Please indicate that you accept the Terms and Conditions' : '');" id="field_terms">   <label for="terms">I agree with the <a href="terms.php" title="You may read our terms and conditions by clicking on this link">terms and conditions</a> for Registration.</label><span class="req">* </span>
            </div>

            <div class="form-group">
                <input class="btn btn-success" type="submit" name="submit_reg" value="Assign">
            </div>
                     
 

            </fieldset>
            </form><!-- ends register form -->

<script type="text/javascript">
  document.getElementById("field_terms").setCustomValidity("Please indicate that you accept the Terms and Conditions");
</script>
                                    
                     <!-- End Form Elements -->
                </div>
            </div>
                <!-- /. ROW  -->
                <div class="row">
                    <div class="col-md-12">
                        <img src="images/e38.jpg" height="200" width="700"> 
                    </div>
                </div>
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
