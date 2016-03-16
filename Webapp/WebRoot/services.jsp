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
if(session==null)
response.sendRedirect("login.jsp");


 %>

<%
HttpSession hs=request.getSession(false);
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String uname="ll",add="null", mob1="00000000000", mob2="0000000000", mob3="00000000000",mob4="00000000000";
String camera="0";String detection="0";String cloude="";
String nocam="0",sub="0",detect="0",ser="0",email="not available",data="k";
Connection	con;
ResultSet rs;
String name;
String motiondetect="kk",sms="0",remoteaccess="kk",livestream="l",analysis="lok",neigbour="lok",detected="hh";
int motionc=0,smsc=0,remotec=0,neighbourc=0,mp,ms,sp,ss,rp,rrs,np,ns,total;
PreparedStatement ps,ps1;
uname=(String)session.getAttribute("owner");
%>
  


<%
 name=(String)session.getAttribute("user");
Class.forName("com.ibm.db2.jcc.DB2Driver");
			con=DriverManager.getConnection("<credentials>","<credentials>","<credentials>");


 ps= con.prepareStatement("SELECT * from CART where EMAIL=?");
ps.setString(1,name);


rs= ps.executeQuery();


     
         
        rs= ps.executeQuery();
         
         if(rs.next()){
  		 motionc=rs.getInt(3);
  		smsc=rs.getInt(4);
  		 remotec=rs.getInt(5);
  		 neighbourc=rs.getInt(6);
         
         }
         
         mp=motionc*50;
         ms=motionc*1000;
         sp=(smsc*50)/6;
         ss=smsc;
         rp=(remotec*50)/6;
         rrs=remotec;
         np=(neighbourc*50)/6;
         ns=neighbourc;
         total=mp+sp+rp+np;
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
                  <span class="glyphicon glyphicon-shopping-cart"></span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header"><center><b>Sopping cart</b></center></li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                    <%if(motionc!=0) {%>
                      <li>
                       Motion detection (<%=ms %>):<%=mp %>$
                       <a href="editcart.jsp?id=service1" >Remove </a>
                     </li>
                     <%} %>
                       <%if(smsc!=0) {%>
                     <li>
                       SMS Alert(<%=ss%> months):<%=sp%>$
                       <a href="editcart.jsp?id=service2" >Remove </a>
                     </li>
                     <%} %>
                       <%if(remotec!=0) {%>
                      <li>
                       Remote Access (<%=rrs%> months):<%=rp%>$
                       <a href="editcart.jsp?id=service3" >Remove </a>
                     </li>
                     <%} %>
                       <%if(neighbourc!=0) {%>
                     <li>
                      Neighbour Alert (<%=ns%> months):<%=np%>$
                       <a href="editcart.jsp?id=service6" >Remove </a>
                     </li>
                       <%} %>
                    </ul>
                    Total =<%=total %>$
                 </li>
                 </li>
                  <li class="footer"><a href="buynow.jsp?coupen=0" class="btn btn-danger" role="button">Buy now</a></li>
                </li> </ul>
                
              <!-- Messages: style can be found in dropdown.less-->
              <li class="dropdown messages-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="glyphicon glyphicon-envelop"></i>
                  <span class="	glyphicon glyphicon-envelope"></span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header"><center><b>Inbox</b></center></li>
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
              
           </ul>
        
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
         <li >
              <a href="user.jsp">
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
         
           <li class="active treeview">
              <a href="services.jsp">
                <span>Add Services</span> <small class="label pull-right bg-green">new</small>
              </a>
           </li>
            <li >
              <a href="live.jsp"> 
                <span>Live Stream</span>
                <i class=" glyphicon glyphicon-facetime-video  pull-right"></i>
              </a>
            </li>
             <li class="treeview">
              <a href="detection.jsp?detectno=<%=detected %>"> 
                <span>Detetion</span>
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
     <!-- /.content -->
     <br><hr>
     <div class="row">
      <div class="col-lg-1 col-xs-12">
      </div>
            <div class="col-lg-5 col-xs-12">
              <!-- small box -->
              <div class="small-box bg-aqua" height="">
                <div class="inner">
                 <br>
                  <h3>Motion Detetion</h3>
                  <p></p>
                </div>
                <div class="icon">
                  <i class="glyphicon glyphicon-briefcase"></i>
                </div>
                <a href="#" class="small-box-footer">
                
            <%if(motiondetect.equals("1")){ %>  Already subscribe<%}else{ %>Purchase<%} %><i class="glyphicon glyphicon-briefcase"></i>
                </a>
               
              </div>
             <div class="box box-solid" style="margin-top:-20px">
              <div class="box-body">
            <form action="cart.jsp">
         			<div class="form-group">
                      <label>Numbers of Detection</label>
                      <select class="form-control" name="item"  required> 
                       <option >----Choose----</option>
                        <option value="1">1000</option>
                        <option value="2">2000</option>
                         <option value="3">3000</option>
                          <option value="4">4000</option>
                        
                      </select>
                      <br>
                      <input type="hidden"  value="service1" name="id">
                    <input type="submit" value ="add to cart" >
                    
                    </div>
             </form>      
         for every 1000 detection 50$
         </div>
            </div>
            </div><!-- ./col -->
             <div class="col-lg-5 col-xs-12">
              <!-- small box -->
              <div class="small-box bg-green" height="">
                <div class="inner">
                 <br>
                  <h3>SMS Alert</h3>
                  <p></p>
                </div>
                <div class="icon">
                  <i class="glyphicon glyphicon-envelope"></i>
                </div>
                <a href="#" class="small-box-footer">
                <%if(sms.equals("1")){ %>  Already subscribe<%}else{ %>Purchase<%} %> <i class="glyphicon glyphicon-envelope"></i>
                </a>
              </div>
               <div class="box box-solid" style="margin-top:-20px">
              <div class="box-body">
            
          <form action="cart.jsp">
         			<div class="form-group">
                      <label>Subscription in months</label>
                      <select class="form-control" name="item" > 
                        <option >----Choose----</option>
                        <option value="6">6</option>
                        <option value="12">12</option>
                         <option value="18">18</option>
                          <option value="24">24</option>
                        
                      </select>
                      <br>
                      <input type="hidden"  value="service2" name="id">
                    <input type="submit" value ="add to cart" >
                    
                    </div>
             </form>      
         for every 6 months 50$
         
         </div>
            </div>
            </div><!-- ./col -->
            </div>
            <div class="row">
             <div class="col-lg-1 col-xs-12">
      </div>
            <div class="col-lg-5  col-xs-6 ccol-xs-12">
              <!-- small box -->
              <div class="small-box bg-yellow" height="">
             
                <div class="inner">
                <br>
                  <h3>Remote Access</h3>
                  <p></p>
                </div>
                <div class="icon">
                     <span class="glyphicon glyphicon-globe"></span> 
                </div>
                <a href="#" class="small-box-footer">
               <%if(remoteaccess.equals("1")){ %>  Already subscribe<%}else{ %>Purchase<%} %><span class="glyphicon glyphicon-globe"></span> 
                </a>
              </div>
               <div class="box box-solid" style="margin-top:-20px">
              <div class="box-body">
            
       <form action="cart.jsp">
         			<div class="form-group">
                      <label>Subscription in months</label>
                      <select class="form-control" name="item" > 
                       <option >----Choose----</option>
                        <option value="6">6</option>
                        <option value="12">12</option>
                         <option value="18">18</option>
                          <option value="24">24</option>
                        
                      </select>
                      <br>
                      <input type="hidden"  value="service3" name="id">
                    <input type="submit" value ="add to cart" >
                    
                    </div>
             </form>      
         for every 6 months 50$
         </div>
            </div>
            </div><!-- ./col -->
             <div class="col-lg-5 col-xs-12">
              <!-- small box -->
              <div class="small-box bg-green" height="">
                <div class="inner">
                 <br>
                  <h3>Live Stream</h3>
                  <p></p>
                </div>
                <div class="icon">
                  <i class="glyphicon glyphicon-expand"></i>
                </div>
                <a href="#" class="small-box-footer">
                  Comming Soon <i class="glyphicon glyphicon-expand"></i>
                </a>
              </div>
               <div class="box box-solid" style="margin-top:-20px">
              <div class="box-body">
            
          <form action="cart.jsp">
         			<div class="form-group">
                      <label>Subscription in months</label>
                      <select class="form-control" name="detect" disabled> 
                        <option value="1">6</option>
                        <option value="2">12</option>
                         <option value="3">18</option>
                          <option value="4">24</option>
                        
                      </select>
                      <br>
                      <input type="hidden"  value="service4" name="id">
                    <input type="submit" value ="comming soon" disabled>
                    
                    </div>
             </form>      
         comming soon
         </div>
            </div>
            </div><!-- ./col -->
            </div>
            <div class="row">
             <div class="col-lg-1 col-xs-12">
      </div>
            <div class="col-lg-5 col-xs-12">
              <!-- small box -->
              <div class="small-box bg-red" height="">
                <div class="inner">
                 <br>
                  <h3>Analysis</h3>
                  <p></p>
                </div>
                <div class="icon">
                  <i class="glyphicon glyphicon-duplicate"></i>
                </div>
                <a href="#" class="small-box-footer">
                  Comming Soon <i class="glyphicon glyphicon-duplicate"></i>
                </a>
              </div>
               <div class="box box-solid" style="margin-top:-20px">
              <div class="box-body">
            
           <form action="cart.jsp">
         			<div class="form-group">
                      <label>Subscription in months</label>
                      <select class="form-control" name="detect" disabled> 
                        <option value="6">6</option>
                        <option value="12">12</option>
                         <option value="18">18</option>
                          <option value="24">24</option>
                        
                      </select>
                      <br>
                      <input type="hidden"  value="service5" name="id" disabled>
                    <input type="submit" value ="comming soon"  disabled>
                    
                    </div>
             </form>      
         comming soon
         
         </div>
            </div>
            </div><!-- ./col -->
             <div class="col-lg-5 col-xs-12">
              <!-- small box -->
              <div class="small-box bg-blue" height="">
                <div class="inner">
                 <br>
                  <h3>Neighbour Alert</h3>
                  <p></p>
                </div>
                <div class="icon">
                 <i class="glyphicon glyphicon-send"></i>
                </div>
                <a href="#" class="small-box-footer">
                <%if(neigbour.equals("1")){ %>  Already subscribe<%}else{ %>Purchase<%} %><i class="glyphicon glyphicon-send"></i>
                </a>
              </div>
               <div class="box box-solid" style="margin-top:-20px">
              <div class="box-body">
            
            <form action="cart.jsp">
         			<div class="form-group">
                      <label>Subscription in months</label>
                      <select class="form-control" name="item" > 
                       <option >----Choose----</option>
                        <option value="6">6</option>
                        <option value="12">12</option>
                         <option value="18">18</option>
                          <option value="24">24</option>
                        
                      </select>
                      <br>
                      <input type="hidden"  value="service6" name="id">
                    <input type="submit" value ="add to cart" >
                    
                    </div>
             </form>      
         for every 6 months 50$
         
         </div>
            </div>
            </div><!-- ./col -->
     </div>
     
    
      </div><!-- /.content-wrapper -->
      <footer class="main-footer">
         ALL RIGHTS RESERVED. COPYRIGHT © 2015. Project undertaking FINAL YEAR BTECH MIET,MEERUT      
      </footer>

      

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
