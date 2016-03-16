<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page session="false" %>

<%@page import="java.sql.Connection"   %>
<%@page import="java.sql.PreparedStatement"   %>
<%@page import="java.sql.ResultSet"   %>
<%@page import="javax.servlet.http.HttpServlet"   %>
<%@page import="javax.servlet.http.HttpServletRequest"   %>
<%@page import="javax.servlet.http.HttpServletResponse"   %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.io.IOException"  %>
<%@ page import="java.io.PrintWriter"  %>
<%@ page import="com.sendgrid.*"  %>

<%@ page import="com.sendgrid.smtpapi.SMTPAPI"  %>
<%@ page import="org.apache.http.HttpEntity"  %>
<%@ page import="org.apache.http.HttpResponse"  %>
<%@ page import="org.apache.http.client.methods.HttpPost"  %>
<%@ page import="org.apache.http.entity.ContentType"  %>
<%@ page import="org.apache.http.entity.mime.MultipartEntityBuilder"  %>
<%@ page import="org.apache.http.impl.client.CloseableHttpClient"  %>
<%@ page import="org.apache.http.impl.client.HttpClientBuilder"  %>
<%@ page import="org.apache.http.util.EntityUtils"  %>
<%@ page import="org.json.JSONObject"  %>
<%@ page import=" java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Random"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="com.ibm.nosql.json.api.BasicDBList"%>
<%@page import="com.ibm.nosql.json.api.BasicDBObject"%>
<%@page import="com.ibm.nosql.json.util.JSON"%>
<%@page import="com.sun.xml.internal.fastinfoset.util.CharArray"%>
<%HttpSession session=request.getSession(false);



 %>
<%String emailu="kaushalkumar2794@gmail.com",uname="admin" ,coupen="";%>

<%

  String sendgrid_username  = "nuwynVTukH";
	        String sendgrid_password  = "IoLtUG5RUi7l0388";
	       
	        SendGrid sendgrid = new SendGrid(sendgrid_username, sendgrid_password);
	        SendGrid.Email email = new SendGrid.Email();
	        email.addTo("anshikabluemix@gmail.com");
	        email.setFrom("kaushalkumar2794@gmail.com");
	      email.setFromName("MIET HOSTEL MANAGMENT");
	        //email.setReplyTo("yyy@in.ibm.com");
	        String mess=request.getParameter("mess");
	        email.setSubject(mess);
	       //email.setHtml(coupen);
	        
	        try {
				SendGrid.Response resp = sendgrid.send(email);
			} catch (SendGridException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	      
 
 
  %>





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


