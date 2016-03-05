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

<% 
HttpSession session=request.getSession(false);
if(session==null)
response.sendRedirect("login.jsp");

String uname="user";
 %><%


Connection	con;
ResultSet rs;
String name;

int motionc=0,smsc=0,remotec=0,neighbourc=0,mp=0,ms=0,sp=0,ss=0,rp=0,rrs=0,np=0,ns=0,total,i=0,discount,coupen,tp;
PreparedStatement ps,ps1;

uname=(String)session.getAttribute("owner");
%>
<%
 name=(String)session.getAttribute("user");
Class.forName("com.ibm.db2.jcc.DB2Driver");
		con=DriverManager.getConnection("jdbc:db2://awh-yp-small02.services.dal.bluemix.net:50000/BLUDB","dash110868","NPfmN4joH0P9");

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
         tp=total;
         coupen=Integer.parseInt(request.getParameter("coupen"));
         discount=(total*10)/100;
         total=total-discount-coupen;
         if(total<0)
         total=0;
          %>



<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Buy now</title>
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

     <br><br>
     <header class="main-header">
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
        
		
		
		
		 <section class="content-header">
          <h1>
            Invoice
            <small>#007612</small>
          </h1>
          
        </section>

       

        <!-- Main content -->
        <section class="invoice">
          <!-- title row -->
          <div class="row">
            <div class="col-xs-12">
              <h2 class="page-header">
                <i class="fa fa-globe"></i> Home Security Pvt Ltd.
                <%Date d=new Date(); %>
                <small class="pull-right"><%=d %></small>
              </h2>
            </div><!-- /.col -->
          </div>
          <!-- info row -->
          <div class="row invoice-info">
            <div class="col-sm-4 invoice-col">
              From
              <address>
                <strong>Home Security Pvt Ltd.</strong><br>
                MIET (068),NH-58 <br>
                meerut,up,INDIA-250002<br>
                Phone: (+91)8005452510<br>
                Email: kaushalbluemix@gmail.com
              </address>
            </div><!-- /.col -->
            <div class="col-sm-4 invoice-col">
              To
              <address>
                <strong><%=uname %></strong><br>
               
              </address>
            </div><!-- /.col -->
            <div class="col-sm-4 invoice-col">
              <b>Invoice #007612</b><br>
              <br>
              <b>Order ID:</b> 4F3S8J<br>
              
            </div><!-- /.col -->
          </div><!-- /.row -->

          <!-- Table row -->
          <div class="row">
            <div class="col-xs-12 table-responsive">
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>Sno</th>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Description</th>
                    <th>Subtotal</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                  <%if(motionc!=0) {i++;%>
                  
                    <td><%=i %></td>
                    <td>Motion Detection</td>
                    <td><%= ms%></td>
                    <td>the number of detection to be detected by the product</td>
                    <td>$<%= mp%></td>
                  </tr>
                  <%} %>
                       <%if(smsc!=0) {i++;%>
                  <tr>
               
                    <td><%=i %></td>
                    <td>SMS Alert</td>
                    <td><%=ss %></td>
                    <td>To let you the alert by sms</td>
                    <td>$<%=sp %></td>
                  </tr>
                   <%} %>
                  <%if(remotec!=0) {i++;%>
                  <tr>
                 
                    <td><%=i %></td>
                    <td>Remote Access</td>
                    <td><%=rrs %></td>
                    <td>You can control product from any where</td>
                    <td>$<%=rp %></td>
                  
                  </tr>
                   <%} %>
                  <%if(neighbourc!=0) {i++;%>
                  <tr>
                  
                    <td><%=i %></td>
                    <td>Neighbour Alert</td>
                    <td><%=ns %></td>
                    <td>To notify neighbour </td>
                    <td>$<%=np %></td>
                  </tr>
                   <%} %>
                </tbody>
              </table>
            </div><!-- /.col -->
          </div><!-- /.row -->

          <div class="row">
            <!-- accepted payments column -->
            <div class="col-xs-6">
              <p class="lead">Payment Methods:</p>
              
              <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
                As it is an new vanture we are providing only the payment through coupen. to get Coupen Cotact us   </p>
            </div><!-- /.col -->
            <div class="col-xs-6">
              <p class="lead">Amount Due 2/22/2014</p>
              <div class="table-responsive">
                <table class="table">
                  <tr>
                    <th style="width:50%">Subtotal:</th>
                    <td>$<%=tp %></td>
                  </tr>
                  <tr>
                    <th>Coupen</th>
                    <td>$<%=coupen %></td>
                  </tr>
                  <tr>
                    <th>Discount(10%):</th>
                    <td>$<%= discount%></td>
                  </tr>
                  <tr>
                    <th>Total:</th>
                    <td>$<%=total %></td>
                  </tr>
                </table>
              </div>
            </div><!-- /.col -->
          </div><!-- /.row -->

          <!-- this row will not appear when printing -->
          <div class="row no-print">
            <div class="col-xs-12">
            <%if(total==0){ %>
            <form action="updaterecord.jsp">
            <input type="hidden" value="<%=ms %>" name="service1">
            <input type="hidden" value="<%=ss %>" name="service2">
            <input type="hidden" value="<%=rrs %>" name="service3">
            <input type="hidden" value="<%=ns %>" name="service6">
            <input type="hidden" value="1" name="id">
            <input type="submit" class="btn btn-primary pull-right" value="click to finish"/>
            <%}else{ %>
            <a href="#coupendetail" class="btn btn-primary pull-left"  role="button" data-toggle="modal" data-target="#coupendetail"> <i class="fa fa-credit-card"></i>View Coupen</a>
            
              <a href="#coupen" class="btn btn-primary pull-right"  role="button" data-toggle="modal" data-target="#coupen"> <i class="fa fa-credit-card"></i>Submit Coupen</a>
              <%} %>
                <a href="services.jsp" class="btn btn-success pull-right" role="button" style="margin-right: 5px;"><i class="glyphicon glyphicon-cog"></i>Edit Cart</a>
              
            </div>
          </div>
        </section>
		
		
		
		  <div class="modal fade" id="coupen" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        
        <div class="modal-body">
          <div class="clearfix"></div>
                <em>
           <h2> 
         <center> Apply the coupen</center><br><hr>
          <form class="form-inline" role="form" action="paymentprocess.jsp">
  <div class="form-group">
    <label for="email">Coupen:</label>
    <input type="text" class="form-control" name="coupen" id="email">
    <input type="hidden" name="total" value="<%=total %>"/>
  </div>
  
  
  <button type="submit" class="btn btn-default">Submit</button>
</form>
             </h2>
          </em>
           </div>
          
        </div>
        
         
       
      </div>
      
    </div>
  </div>
		
		<div class="modal fade" id="coupendetail" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        
        <div class="modal-body">
          <div class="clearfix"></div>
                <em>
           <h2> 
         <center>Coupen Details</center><br><hr>
        <table class="table">
    <thead>
      <tr>
        <th>Coupen</th>
        <th>Price</th>
       
      </tr>
    </thead>
    <tbody>
      <tr class="success">
        <td>ajay</td>
        <td>$800</td>
       
      </tr>
      <tr class="danger">
        <td>gaurav</td>
         <td>$800</td>
       
      </tr>
      <tr class="info">
         <td>kaushal</td>
         <td>$800</td>
      
      </tr>
      <tr class="info">
        <td>shashank</td>
         <td>$800</td>
      
      </tr>
    </tbody>
  </table>
             </h2>
          </em>
           </div>
          
        </div>
        
         
       
      </div>
      
    </div>
  </div>
		
		
      </div><!-- /.content-wrapper -->
      <footer class="main-footer">
         ALL RIGHTS RESERVED. COPYRIGHT © 2015. Project undertaking FINAL YEAR BTECH MIET,MEERUT      
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
