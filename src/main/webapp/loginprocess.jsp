<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page session="false" %>
<%@ page errorPage="ShowError.jsp" %>
<%@page import="java.sql.Connection"   %>
<%@page import="java.sql.PreparedStatement"   %>
<%@page import="java.sql.ResultSet"   %>
<%@page import="javax.servlet.http.HttpServlet"   %>
<%@page import="javax.servlet.http.HttpServletRequest"   %>
<%@page import="javax.servlet.http.HttpServletResponse"   %>

<%@page import="java.sql.DriverManager" %>
<%@page import="com.ibm.nosql.json.api.BasicDBList"%>
<%@page import="com.ibm.nosql.json.api.BasicDBObject"%>
<%@page import="com.ibm.nosql.json.util.JSON"%>

<%HttpSession session=request.getSession(false);
if(session!=null)
{

response.sendRedirect("user.jsp");

}

 %>
 <%
 
	Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con=DriverManager.getConnection("jdbc:db2://awh-yp-small02.services.dal.bluemix.net:50000/BLUDB","dash110868","NPfmN4joH0P9");String id=request.getParameter("id");	
String check="0",email="info@kaushal94.com";
String name=request.getParameter("name");	
String pass=request.getParameter("password");
out.print(name);
PreparedStatement ps= con.prepareStatement("select * from USER where USERNAME=? and PASSWORD=?");
ps.setString(1,name);
ps.setString(2,pass);

ResultSet rs= ps.executeQuery();

if(rs.next()){
check =rs.getString(28);
email =rs.getString(4);
if(check.equals("0")){
%>

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Purchase</title>
     <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker-bs3.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="plugins/iCheck/all.css">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="plugins/colorpicker/bootstrap-colorpicker.min.css">
    <!-- Bootstrap time Picker -->
    <link rel="stylesheet" href="plugins/timepicker/bootstrap-timepicker.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="plugins/select2/select2.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
   
  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

     <br><header class="main-header">
        <!-- Logo -->
        <a href="index.jsp" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span >HOME SECURITY</span>
          <!-- logo for regular state and mobile devices -->
          <span>Purchase</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          
         
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper" style="margin-left:-0px">
        <!-- Content Header (Page header) -->
        <section class="content">
        <br><br><br><br>
			<div class="row">
            	<div class="col-md-3">
        		</div>
        
        		<div class="col-md-6">
             			<div class="box box-solid">
  	            			<div class="box-body">
    		        			 <br>
         					<em><h3>To Explore the care free security plz first verify your credentials</h3></em>
         						<h5>Send Verification Code to </h5>
         					<br> 
         					<form action="verifycode.jsp">
			 					<div class="row"> 
									 <div class="col-lg-1">
									 </div>
									 <div class="col-lg-10">
				 						<div class="input-group">
				 							<span class="input-group-addon"> 
				 							<input type="checkbox" name="motion" disabled> </span>
				 							<input type="text" class="form-control" placeholder="Looking for sposer to upgrade our twilio account(hope Soon)..." disabled>
				 						</div>
				 					</div>
								
				 						<div class="col-lg-1">
				 						</div>
								</div>
								 <div class="row"> 
				 						<div class="col-lg-1">
				 						</div>
										 <div class="col-lg-10">
				 								<div class="input-group">
				 									<span class="input-group-addon"> 
				 										<input type="checkbox" name="motion" checked disabled> </span>
				 										<input type="text" class="form-control" placeholder="<%=email %>" disabled>
				 								</div>
										  </div>
				
										 <div class="col-lg-1">
				 						</div>
								</div>
								<br><br>
								<input type="hidden" value="<%=email %>" name="email">
								<input type="hidden" value="<%=name %>" name="uname">
								<center><input type="submit" class="btn btn-primary" value="Send Verification Code"></center>
							<hr>
								</form>
						</div>	<br><br><hr>
					</div>
				</div>
		  <div class="col-md-3">
        	</div>
      </div>
        </section>
      </div><!-- /.content-wrapper -->
      <footer class="main-footer">
         ALL RIGHTS RESERVED. COPYRIGHT � 2015. Project undertaking FINAL YEAR BTECH MIET,MEERUT      
      </footer>


     
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
    </div><!-- ./wrapper -->


    <!-- jQuery 2.1.4 -->
    <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- Select2 -->
    <script src="plugins/select2/select2.full.min.js"></script>
    <!-- InputMask -->
    <script src="plugins/input-mask/jquery.inputmask.js"></script>
    <script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <!-- date-range-picker -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
    <script src="plugins/daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap color picker -->
    <script src="plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
    <!-- bootstrap time picker -->
    <script src="plugins/timepicker/bootstrap-timepicker.min.js"></script>
    <!-- SlimScroll 1.3.0 -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- iCheck 1.0.1 -->
    <script src="plugins/iCheck/icheck.min.js"></script>
    <!-- FastClick -->
    <script src="plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js"></script>
    <!-- Page script -->
    
    
  </body>
</html>

<%

}else{
session=request.getSession(true);
session.setAttribute("user",name);
if(id.equals("download"))
response.sendRedirect("download.jsp");
else
response.sendRedirect("user.jsp");
}
}else{
out.println("<b>Invalid User name or Password try again</b>");
RequestDispatcher rd= request.getRequestDispatcher("login.jsp");
rd.include(request,response);
}
%>