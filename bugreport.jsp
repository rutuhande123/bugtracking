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
          
            <p class="orange">Online Bug Tracking</p>
           
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
   
   <div class="container">
	<div class="row">
        <div class="col-md-6">
          <p>${message}</p>
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
    	  String Query = "Select max(bugid) from bugreport";
		  stmt = con.createStatement();
		 rs = stmt.executeQuery(Query);
		
		 while(rs.next())
		 {
		     i1=rs.getString(1);
		 }
    	 message="Registered  Successfully with BugID=" +i1+"";
    	
    	
    	
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
            <form   action="bugsave.jsp" method="post" id="fileForm" role="form">
             <img src="${message7}" height="100" width="200">
            <fieldset><legend class="text-center">BUG REPORT <span class="req"><small> </small></span></legend>

           
            <div class="form-group"> 	 
                <label for="bugname"><span class="req">* </span> Bug Description: </label>
                    <input class="form-control" type="text" name="bugname" id = "txt" onkeyup = "Validate(this)" required value="${message1}" /> 
                        <div id="errFirst"></div>    
            </div>

           

            <div class="form-group">
                <label for="eid"><span class="req">* </span> Employee ID: </label> 
                    <input class="form-control" required type="text" name="eid" id = "eid"  value="${message2}" />   
                        <div class="status" id="status"></div>
            </div>
              <div class="form-group">
            <label for="empname"><span class="req">* </span> Employee Name: </label>
                    <input required type="text" name="empname" id="enmae" class="form-control phone" maxlength="28" value="${message3}"/> 
            </div>

             <div class="form-group">
            <label for="pname"><span class="req">* </span> Project Name: </label>
                    <input required type="text" name="pname" id="pnmae" class="form-control phone" maxlength="28" value="${message4}" /> 
            </div>
            <div class="form-group">
            <label for="mname"><span class="req">* </span> Manager Name: </label>
                    <input required type="text" name="mname" id="mname" class="form-control phone" maxlength="28" value="${message5}"/> 
            </div>

             <div class="form-group">
            <label for="rdate"><span class="req">* </span> Report Date: </label>
                    <input required type="date" name="rdate" id="rdate" class="form-control" maxlength="28" value="${message6}" /> 
            </div>

           
             <div class="form-group">
            <label for="img"><span class="req">* </span> Upload Bug Image: </label>
                    <input required type="file" name="img" id="mname" class="form-control" maxlength="28" /> 
            </div>
             <div class="form-group">
            
                <?php //$date_entered = date('mm/dd/YYYY'); ?>
                <input type="hidden" value="<?php //echo $date_entered; ?>" name="dateregistered">
                <input type="hidden" value="0" name="activate" />
                <hr>

                <input type="checkbox" required name="terms" onchange="this.setCustomValidity(validity.valueMissing ? 'Please indicate that you accept the Terms and Conditions' : '');" id="field_terms">   <label for="terms">I agree with the <a href="terms.php" title="You may read our terms and conditions by clicking on this link">terms and conditions</a> for Registration.</label><span class="req">* </span>
            </div>
            <div class="form-group">
                <input class="btn btn-success" type="submit" name="submit_reg" value="ReportBug">
            </div>
                     
 

            </fieldset>
            </form><!-- ends register form -->

<script type="text/javascript">
  document.getElementById("field_terms").setCustomValidity("Please indicate that you accept the Terms and Conditions");
</script>
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
