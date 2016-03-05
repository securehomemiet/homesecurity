<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.IOException"  %>
<%@ page import="java.io.PrintWriter"  %>
<%@ page import="com.sendgrid.*"  %>
<%@ page import="javax.servlet.ServletException"  %>
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


<%@page import="javax.servlet.http.HttpServlet"   %>
<%@page import="javax.servlet.http.HttpServletRequest"   %>
<%@page import="javax.servlet.http.HttpServletResponse"   %>






<%@ page import=" java.io.*"%>
<%@ page import="java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  
<%
 String sendgrid_username  = "nuwynVTukH";
	        String sendgrid_password  = "IoLtUG5RUi7l0388";
//String sendgrid_username  = "nu6sT5gJS7";
	//        String sendgrid_password  = "RhGLtbrVsrQn0681";
	       String name="kaushaldiggle@gmail.com";
	        SendGrid sendgrid = new SendGrid(sendgrid_username, sendgrid_password);
	        SendGrid.Email email = new SendGrid.Email();
	        email.addTo(name);
	        email.setFrom("kaushalkumar2794@gmail.com");
	       email.setFromName("Home Security");
	        //email.setReplyTo("yyy@in.ibm.com");
	        email.setSubject("verification code");
	        email.setHtml(name);
	        
	        try {
				SendGrid.Response resp = sendgrid.send(email);
			} catch (SendGridException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	      





 %>







  </body>
</html>
