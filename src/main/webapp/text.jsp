<%@ page errorPage="ShowError.jsp" %>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="com.twilio.sdk.TwilioRestClient"%>
<%@page import="com.twilio.sdk.TwilioRestException"%>
<%@page import="com.twilio.sdk.resource.factory.MessageFactory"%>
<%@page import="com.twilio.sdk.resource.instance.Message"%>
<%@page import="org.apache.http.NameValuePair"%>
<%@page import="org.apache.http.message.BasicNameValuePair"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.twilio.sdk.resource.instance.Account"%>

<%



 %>

<%

String ACCOUNT_SID = "ACa739100c0b09a3b6b7e558c9d3946989";
String AUTH_TOKEN = "48c65e8d472dd7b16bac24d6a6b59a8d";
//Message message;
String mess=request.getParameter("mess");
TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN); 
 
	 // Build the parameters 
	 List<NameValuePair> params = new ArrayList<NameValuePair>(); 
	 params.add(new BasicNameValuePair("To", "+918266880245")); 
	 params.add(new BasicNameValuePair("From", "+12012975676")); 
	 params.add(new BasicNameValuePair("Body", mess));   
 
	 MessageFactory messageFactory = client.getAccount().getMessageFactory(); 
	 Message message = messageFactory.create(params); 
	 System.out.println(message.getSid()); 



response.sendRedirect("http://miet-hostel.mybluemix.net/admin/alert.jsp");







 %>
Send Another alert <a herf="http://miet-hostel.mybluemix.net/index.jsp">Click</a>