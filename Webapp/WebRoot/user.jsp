<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page session="false" %>
<%@ page errorPage="ShowError.jsp" %>
<%@page import="java.sql.Connection"   %>
<%@page import="java.sql.PreparedStatement"   %>
<%@page import="java.sql.ResultSet"   %>
<%@page import="javax.servlet.http.HttpServlet"   %>
<%@page import="javax.servlet.http.HttpServletRequest"   %>
<%@page import="javax.servlet.http.HttpServletResponse"   %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

<%@page import="java.sql.DriverManager" %>
<%@page import="com.ibm.nosql.json.api.BasicDBList"%>
<%@page import="com.ibm.nosql.json.api.BasicDBObject"%>
<%@page import="com.ibm.nosql.json.util.JSON"%>
<%HttpSession session=request.getSession(false);
if(session==null)
response.sendRedirect("login.jsp");


 %>

<%
HttpSession hs=request.getSession(false);
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String uname="ll",add="null", mob1="00000000000", mob2="0000000000", mob3="00000000000",mob4="00000000000";
String camera="0";String detection="0";String cloude="";
String nocam="0",sub="0",detect="0",ser="0",email="not available",detected="kk",detected1="no";
%>
  


<%
 
	Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection	con=DriverManager.getConnection("<credentials>","<credentials>","<credentials>");
String name=(String)session.getAttribute("user");


PreparedStatement ps= con.prepareStatement("select * from USER where USERNAME=? ");
ps.setString(1,name);


ResultSet rs= ps.executeQuery();

if(rs.next()){
uname=rs.getString(2);
add=rs.getString(5);
email=rs.getString(4);
mob1=rs.getString(12);
mob2=rs.getString(9);
mob3=rs.getString(10);

mob4=rs.getString(11);
sub=rs.getString(21);
ser=rs.getString(18);
detect=rs.getString(7);
nocam=rs.getString(14);
//out.println(uname);
detected=rs.getString(6);
camera=rs.getString(15);
detection=rs.getString(16);
cloude=rs.getString(17);
}else{
	out.println("<b>Invalid User name or Password try again</b>");
	RequestDispatcher rd= request.getRequestDispatcher("login.jsp");
	rd.include(request,response);
}
session.setAttribute("owner",uname);
%>







<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
    <!-- Morris chart -->
    <link rel="stylesheet" href="plugins/morris/morris.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker-bs3.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="html5shiv.min.js"></script>
        <script src="respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="hold-transition skin-blue sidebar-mini">
  
  
  
   
  
    <div class="wrapper">

  <header class="main-header">
        <!-- Logo -->
        <a href="index.jsp" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span >HOME SECURITY</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"></span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
         
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->
              <li class="dropdown messages-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="glyphicon glyphicon-envelop"></i>
                  <span class="	glyphicon glyphicon-envelope"></span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 0 messages</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li><!-- start message -->
                       <h3>No notification</h3>
                      </li>
                    </ul>
                 </li>
                 </li>
                  <li class="footer"><a href="#">See All Messages</a></li>
                </li> 
                </ul>
                
              <!-- User Account - right drop block-->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="img/user/pic.jpg" class="user-image" alt="User Image">
                  <span class="hidden-xs"><%=uname%></span>
                </a>
                <ul class="dropdown-menu">
                 
                  <li class="user-header">
                    <img src="img/user/pic.jpg" class="img-circle" alt="User Image">
                    <p>
                    <%=uname%>
                      <small><%=add %></small>
                    </p>
                  </li>
                 <li margin="center">
                 		<center><span>Email : </span><%=email %></center>
                 
                 </li>
                  <!-- Menu Footer-->
                  <li class="user-footer">
                   
                    <div class="pull-center">
                     <center> <a href="logoutprocess.jsp" class="btn btn-default btn-flat">Sign out</a></center>
                    </div>
                  </li>
                </ul>
              </li>
              
          
        
     </div>
	
      </header>
      <!-- Left navigation bar-->
      <aside class="main-sidebar" style="margin-top:25px">
       
        <section class="sidebar">
          <!-- left user panel -->
          <div class="user-panel">
            <div class="pull-left image" >
              <img src="img/user/pic.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p> <%=uname%></p>
              <a href="#"><i class="fa fa-circle text-success"></i>Home Online</a>
            </div>
          </div>
         
          <!-- left navigation option -->
       <ul class="sidebar-menu">
         <li class="header">Explore</li>
         <li class="active treeview">
              <a href="#">
                 <span>Edit Setting</span> 
                  <i class="glyphicon glyphicon-pencil pull-right"></i>

              </a>
           <!----- <ul class="treeview-menu">
                <li><a href="pages/layout/top-nav.html"><i class="fa fa-circle-o"></i> Top Navigation</a></li>
                <li><a href="pages/layout/boxed.html"><i class="fa fa-circle-o"></i> Boxed</a></li>
                <li><a href="pages/layout/fixed.html"><i class="fa fa-circle-o"></i> Fixed</a></li>
                <li><a href="pages/layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>
              </ul>
---->
          </li>
         
           <li>
              <a href="services.jsp">
                <span>Add Services</span> <small class="label pull-right bg-green">new</small>
              </a>
           </li>
            <li class="treeview">
              <a href="live.jsp"> 
                <span>Live Stream</span>
                <i class=" glyphicon glyphicon-facetime-video  pull-right"></i>
              </a>
            </li>
             <li class="treeview">
              <a href="detection.jsp?detectno=<%=detected%>"> 
                <span>Detection</span>
                 <i class="glyphicon glyphicon-saved  pull-right"></i>
              </a>
            </li>
            <li class="  treeview">
              <a href="download.jsp"> 
                <span>Download</span>
                 <i class="glyphicon glyphicon-save  pull-right"></i>
              </a>
            </li>
           </ul>
        </section>
      </aside>
      
       <!-- left navbar end -->

      <!-- main area  -->
      <div class="content-wrapper">
      <section class="content-header">
          <h1>
          EDIT SETTING
            <small>Home security</small>
            
          </h1>
         
         
       
        </section>
        <section class="content">
          <!-- Small boxes (Stat box) -->
          <div class="row">
           <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12" height="250px">
              <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="glyphicon glyphicon-facetime-video"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Camera installed</span>
				  <br>
                  <span class="info-box-number"><%=nocam %></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
           	<span class="info-box-icon bg-green"><i class="glyphicon glyphicon glyphicon-calendar"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Cloud Service subscription remaining</span><br>
                  <span class="info-box-number"><%=ser %></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-yellow"><i class="glyphicon glyphicon-warning-sign"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">detection</span>
                  <span class="info-box-number"><%=detected %></span>
				   <span class="info-box-number">Allowded : <%=detect%> </span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-yellow"><i class="glyphicon glyphicon-briefcase"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">services subscribe </span>
                  <span class="info-box-text">(remaining)</span><br>
                  <span class="info-box-number"><%=sub %>(months) </span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
          
          </div><!-- /.row -->
            <section class="content">
          <div class="row">
            <div class="col-md-4">
             <div class="box box-solid">
              <div class="box-body">
             <br>
         Getting Started  know how to begin Click <a href="#start" data-toggle="modal">here</a>
         <br> <br>
         </div>
            </div>
      
  
            
            
            
            
            
            <br>
              <div class="box box-solid">
             
                <div class="box-header with-border">
                  <h4 class="box-title">Emergency Notification Contact</h4>
                </div>
                <div class="box-body">
                  <!-- the events -->
         <form action="updateno.jsp" method="get">       
      <div class="col-sm-11">
        Contact 1<input class="form-control" name="mob1" id="focusedInput" type="text" value="<%=mob2 %>">
      </div>
       <div class="col-sm-11">
       Contact 2<input class="form-control" name="mob2" id="focusedInput" type="text" value="<%=mob3 %>">
      </div>
       <div class="col-sm-11">
       Contact 3 <input class="form-control" name="mob3"  id="focusedInput" type="text" value="<%=mob4%>">
      </div>
      <div class="col-sm-11">
      Contact 4 <input class="form-control" name="mob4" id="focusedInput" type="text" value="<%=mob1 %>">
      </div>
     

                  </div><!-- /.box-body -->
               
            
<input type="submit" style="margin-bottom:15px;margin-left:120px" value="update">
</form>  
            
                 <!-- /input-group -->
               
             </div>
            
            </div><!-- /.col -->
           
            <div class="col-md-8">
              <div class="box box-primary">
              <br>
                <div class="box-body no-padding">
         			<div class="col-md-3">
   					 	<p></p>
 					 </div>
 					 <div class="panel panel-primary">
  						<div class="panel-heading">Camera </div>
  						<% if (camera.equals("0"))
  						{
  						%>
  						<div class="panel-body">
    							Disconnected
    							 <a href="connect.jsp?id=cam0" class="btn btn-warning" style="margin-left:70%" role="button">Connect</a>

  						</div>

				</div><%}else{ %><div class="panel-body">
    							Connected
    							 <a href="connect.jsp?id=cam1" class="btn btn-success" style="margin-left:70%" role="button">disconnect</a>

  						</div>
					
 					<% }%></div>
 					 <div class="panel panel-primary">
  						<div class="panel-heading">Detection</div>
  						<% if(detection.equals("0"))
  						{ %>
  						<div class="panel-body">
    							 off
    							 <a href="connect.jsp?id=detect0" class="btn btn-warning" style="margin-left:80%" role="button">Activate</a>

  						</div>
					<%}else{ %><div class="panel-body">
    							Active
    							 <a href="connect.jsp?id=detect1" class="btn btn-success" style="margin-left:70%" role="button">" off "</a>

  						</div>
					
 					<% }%>

				</div>
 				
 					 <div class="panel panel-primary" width="80%">
  						<div class="panel-heading">Device Status</div>
  						<% if(cloude.equals("0")){ %>
  						<div class="panel-body">
    						 DisConnected
    						  <a href="#" class="btn btn-warning" style="margin-left:72%" role="button">Connect</a>
	
 					 </div><%}else{ %><div class="panel-body">
    							Connected
    							 <a href="#" class="btn btn-success" style="margin-left:70%" role="button">disconnect</a>

  						</div>
					
 					<% }%>
 					

  						</div>
				


 					
 					

 					 
                </div><!-- /.box-body -->
              </div><!-- /. box -->
            </div><!-- /.col -->
      
        
         
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      <footer class="main-footer">
         ALL RIGHTS RESERVED. COPYRIGHT © 2015. Project undertaking FINAL YEAR BTECH MIET,MEERUT      
      </footer>

            
            <div class="modal fade" id="start" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        
        <div class="modal-body">
          <div class="clearfix">
                <em>
           <h3> 
          <pre> 
         STEP -1 
         Sign up for free Trial .
         (Enjoy the free trial for 30 days)
         STEP -2
         Download the Desktop app from download tab .
         STEP -3
         Install the Open CV and Java jdk in your system .
         STEP -4
         Login into Desktop app .
         STEP -5
         Operate the app by Login into web account 
         STEP -6
         Enjoy :)
         
         <b>Purchase the Service to carry the usages</b> 
         </pre>  </h3>
          </em>
           </div>
          
        </div>
        
         
       </div>
      </div>
      
    </div>

    <!-- jQuery 2.1.4 -->
    <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
      $.widget.bridge('uibutton', $.ui.button);
    </script>
    <!-- Bootstrap 3.3.5 -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- Morris.js charts -->
    <script src="raphael-min.js"></script>
    <script src="plugins/morris/morris.min.js"></script>
    <!-- Sparkline -->
    <script src="plugins/sparkline/jquery.sparkline.min.js"></script>
    <!-- jvectormap -->
    <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <!-- jQuery Knob Chart -->
    <script src="plugins/knob/jquery.knob.js"></script>
    <!-- daterangepicker -->
    <script src="moment.min.js"></script>
    <script src="plugins/daterangepicker/daterangepicker.js"></script>
    <!-- datepicker -->
    <script src="plugins/datepicker/bootstrap-datepicker.js"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    <!-- Slimscroll -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="js/app.min.js"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="js/user_consel.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="js/demo.js"></script>
  </body>
</html>
