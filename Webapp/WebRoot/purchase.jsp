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
    <script type="text/script">
    function validateForm() {
    var x = document.forms["purchase"]["pass"].value;
  var y = document.forms["purchase"]["cpass"].value;
    if (x != y ) {
        alert("Password and Confirm Password Must match");
        return false;
    }
}
    </script>
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
        <section class="content-header">
          <h1>
            Fill the following details
            <small>Important</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Register</a></li>
           
          </ol>
        </section>
<form role="form" action="purchaseprocess.jsp" name="purchase" onSubmit="return validateForm()" method="post">
        <!-- Main content -->
        <section class="content">
          <div class="row">
            <!-- left column -->
            <div class="col-md-6">
              <!-- general form elements -->
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">General(Detail 1)</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
              
                  <div class="box-body">
				  <div class="form-group">
                      <label for="exampleInputEmail1">Username <em>(generaly email)</em></label>
                      <input type="text" class="form-control" id="exampleInputEmail1" name="username" placeholder="username"  autofocus required>
                    </div>
					<div class="form-group">
                      <label for="exampleInputEmail1">First name</label>
                      <input type="text" class="form-control" id="exampleInputEmail1" name="fname" placeholder="First name"  required>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">Last name name</label>
                      <input type="text" class="form-control" id="exampleInputEmail1" name="lname" placeholder="Last name"  required>
                    </div>
                   
                    
                   
                  </div><!-- /.box-body -->

                  <div class="box-footer">
                  
                  </div>
              
              </div><!-- /.box -->

              <!-- Form Element sizes -->
             

             

              <!-- Input addon -->
              <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">Purchase Detail  (Free Trial)</h3>
                </div>
                <div class="box-body">
                   <div class="form-group">
                      <label>Subscription (months)</label>
                      <select class="form-control" name="subscription" disabled> 
                        <option >1</option> 
                       
                      </select>
                    </div>
                  <br>
				  <h4>Choose services</h4>
                 <div class="row"> 
				 <div class="col-lg-2">
				 </div>
				 <div class="col-lg-6">
				 <div class="input-group">
				 <span class="input-group-addon"> 
				 <input type="checkbox" name="motion" checked disabled> </span>
				 <input type="text" class="form-control" placeholder="Motion Detection - (Trial)" disabled>
				 </div><!-- /input-group --> 
				 </div><!-- /.col-lg-6 --> </div>
				 <div class="row"><div class="col-lg-2">
				 </div> <div class="col-lg-6">
				 <div class="input-group"> <span class="input-group-addon">
				 <input type="checkbox" name="sms" checked disabled> </span> <input type="text" class="form-control" placeholder="SmS Alert - (Trial)" disabled> </div>
				 <!-- /input-group --> </div><!-- /.col-lg-6 --> </div> <div class="row"><div class="col-lg-2">
				 </div>
				 <div class="col-lg-6"> <div class="input-group"> <span class="input-group-addon">
				 <input type="checkbox" name="remote" checked disabled> </span> <input type="text" class="form-control"  placeholder="Remote Access - (Trial)" disabled>
				 </div><!-- /input-group --> </div><!-- /.col-lg-6 --> </div> <div class="row"><div class="col-lg-2">
				 </div> 
				 <div class="col-lg-6"> <div class="input-group"> <span class="input-group-addon"> 
				 <input type="checkbox" disabled> </span> <input type="text" class="form-control"  placeholder="LiveStream - (Comming Soon)" disabled> 
				 </div><!-- /input-group --> </div><!-- /.col-lg-6 --> </div> <div class="row"><div class="col-lg-2">
				 </div>
				 <div class="col-lg-6"> <div class="input-group"> <span class="input-group-addon">
				 <input type="checkbox" disabled> </span> <input type="text" class="form-control"  placeholder="Analysis - (Comming Soon)" disabled> 
				 </div><!-- /input-group --> </div><!-- /.col-lg-6 --> </div> <div class="row"> <div class="col-lg-2">
				 </div>
				 <div class="col-lg-6"> <div class="input-group"> <span class="input-group-addon"  > 
				 <input type="checkbox" name="neighbour" checked disabled> </span> <input type="text" class="form-control" placeholder="Neighbour Notify - (Trial)" disabled> </div>
				 <!-- /input-group --> </div><!-- /.col-lg-6 --> </div> 

                  
<div class="form-group">
                      <label>Numbers of camera</label>
                      <select class="form-control" name="camera" disabled> 
                        <option value="1">1 camera (Trial)</option>
                        
                      </select>
                    </div>
                    <div class="form-group">
                      <label>Numbers of Detection</label>
                      <select class="form-control" name="detect" disabled> 
                        <option value="1">1000</option>
                       
                        
                      </select>
                    </div>
                  

                 
                 
                </div><!-- /.box-body -->
              </div><!-- /.box -->

            </div><!--/.col (left) -->
            <!-- right column -->
            <div class="col-md-6">
              <!-- Horizontal Form -->
              <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">Password (Detail 2)</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
              
                  <div class="box-body">
                     <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                      <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputPassword3" name="pass"placeholder="Password"  required>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Confirm Password</label>
                      <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputPassword3" name="cpass" placeholder="Confirm Password"  required>
                      </div>
                    </div>
                    
                  </div><!-- /.box-body -->
                  
               
              </div><!-- /.box -->
              <!-- general form elements disabled -->
              <div class="box box-warning">
                <div class="box-header with-border">
                  <h3 class="box-title">Contact information (Detail 3)</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
               
                    <!-- text input -->
                    <div class="form-group">
                      <label>Email</label>
                      <input type="email" class="form-control" name="email" placeholder="abc@xyz.com"  required>
                    </div>
                    <div class="form-group">
                      <label>Contact no</label>
                      <input type="text" class="form-control" name="no" placeholder="(_ _ _)-_ _ _-_ _ _ _ _ _ _ " maxlength="13 " minlength="13"  required>
                    </div>

                    <!-- textarea -->
                    <div class="form-group">
                      <label>Address <em>(max 60 characters)</em></label>
                      <textarea class="form-control" rows="3" name="address" placeholder="Enter ..."  maxlength="10" required  >  </textarea>
                    </div>
                    

                   

                    

                   

                    <!-- select -->
                    

                    <!-- Select multiple-->
                    
                 
                </div><!-- /.box-body -->
              </div><!-- /.box -->
			   
			  <div class="box box-success">
			  <br>
			  <center><input type="submit" class="btn btn-primary" value="submit details"><center>
			  <br>
			  <br>
			  </div>
            </div><!--/.col (right) -->
          </div>   <!-- /.row -->
        </section><!-- /.content -->
		</form>
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
