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
String nocam="0",sub="0",detect="0",ser="0",email="not available" ,detected="g",name="hh",data="k";
int n=0,detectno=0,i=0,detectimg=0,a=0,b=0,detectne=0;
String[] date={"l","l"};
%>
  


<%
 
	Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection	con=DriverManager.getConnection("<credentials>","<credentials>","<credentials>");
name=(String)session.getAttribute("user");

detectne=Integer.parseInt(request.getParameter("detectno"));

if(detectne<=0)
{
detectne=0;
a=0;
b=0;
}
else
{
System.out.println(detectne);
b=detectne%10;
if(b==0)
b=detectne-10;
else
b=detectne-b;
}
System.out.println(b);
PreparedStatement ps= con.prepareStatement("select * from USER where USERNAME=? ");
ps.setString(1,name);


ResultSet rs= ps.executeQuery();

if(rs.next()){
uname=rs.getString(2);
add=rs.getString(5);
email=rs.getString(4);
detected=rs.getString(6);
mob2=rs.getString(9);
mob3=rs.getString(10);
mob4=rs.getString(11);
sub=rs.getString(13);
ser=rs.getString(18);
detect=rs.getString(7);
nocam=rs.getString(14);
//out.println(uname);
camera=rs.getString(15);
detection=rs.getString(16);
cloude=rs.getString(17);
data=rs.getString(27);

n=Integer.parseInt(detected);
n=n*5;
int k=Integer.parseInt(detected);
//System.out.print(k);
if((b+10)<=k)
{
	a=b+10;
}else
{
a=k;


}
//System.out.print(b);
detectimg=((detectne-1)*5)+1;


//date = data.split(",");

}else{
	out.println("<b>Invalid User name or Password try again</b>");
	RequestDispatcher rd= request.getRequestDispatcher("login.jsp");
	rd.include(request,response);
	
}
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
         
           <li>
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
             <li class="active treeview">
              <a href="detection.jsp"> 
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
      <section class="content-header">
          <h1>
           DETECTION
            <small>mian door camera</small>
            
          </h1>
    </section>
      <section class="content">
          <div class="row">
          <div class="col-md-3">
          </div>
            <div class="col-md-5">
              <div class="box box-solid">
             
                <div class="box-header with-border">
                  <h4 class="box-title">Detection <%=detectne %> </h4>
                </div>
                <div class="box-body">
                  <!-- the events -->
      
                  <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
    <li data-target="#myCarousel" data-slide-to="4"></li>
    
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
         <img src="http://www.gauravsamant.com/test1/<%=name %>/<%=detectimg %>.jpeg" height="400px" width="400px">
    </div>
<%for(i=1;i<=4;i++){ 
detectimg=detectimg+i;%>
    <div class="item">
       <img src="http://www.gauravsamant.com/test1/<%=name %>/<%=detectimg %>.jpeg" height="400px" width="400px"">
    </div>
<%} %>
   
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
               
            
  
              </div><!-- /.box-body -->
               
            
            
            
           </div>
            <div class="col-md-2">
            
            <a href="detection.jsp?detectno=<%=detected%>" class="btn btn-info">See latest detect</a>
          </div>
    </div> </section>
    
     <section class="content">
     <div class="row">
      <div class="col-md-2">
          </div>
      <div class="col-md-7">
     <table class="table table-striped">
    <thead>
      <tr>
        <th>Detection No</th>
        <th>Date Detected</th>
        
        <th>Choose</th>
      </tr>
    </thead>
    <tbody>
      <%for(i=a;i>b;i--) {%>
      <tr>
        <td><%=i %></td>
      <td>26-11-2015</td>
         
        <td><a href="detection.jsp?detectno=<%=i %>">See</a></td>
      </tr><%} %>
     
    </tbody>
  </table>
     </div>
     </div>
     </section>
     
     
    <div class="row">
       <center>
     <ul class="pagination">
    <%i=detectne-1;if(i<=0)i=detectne; %>
    <li class="active"><a href="detection.jsp?detectno=<%=i%>">prev</a></li>
    <%for(i=b+1;i<=a;i++){ %>
    <li <%if(i==detectne){ %>class="active"<%}%>><a href="detection.jsp?detectno=<%=i %>"><%=i %></a></li>
    <%} %>
    <%i=detectne+1;if(i>=Integer.parseInt(detected))i=Integer.parseInt(detected); %>
     <li class="active"><a href="detection.jsp?detectno=<%=i%>">Next</a></li>
   
  </ul></center>
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
