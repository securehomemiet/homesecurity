<%@ page language="java" import="java.util.*" %>
<%@page session="false" %>

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
<%@page import="com.sun.xml.internal.fastinfoset.util.CharArray"%>

<%@ page language="java" import="java.util.*" %>
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


<%HttpSession session=request.getSession(false);
if(session!=null)
response.sendRedirect("user.jsp");


 %>
<%String uname="admin" ,coupen="XXXXX";%>
<%




 %>
<%

 String name=request.getParameter("uname");	
  String code=request.getParameter("coupen");	
 	Class.forName("com.ibm.db2.jcc.DB2Driver");
 	Connection	con=DriverManager.getConnection("<credentials>","<credentials>","<credentials>");
	PreparedStatement ps= con.prepareStatement("SELECT * from USER where USERNAME=? ");

	ps.setString(1,name);
ResultSet rs= ps.executeQuery();

if(rs.next()){
 	coupen=rs.getString(29);
 
 	if(code.equals(code))
 	{
 			String t="1";
			ps= con.prepareStatement("UPDATE USER SET STATUS=? where USERNAME=? ");
			ps.setString(1,t);
			ps.setString(2,name);
  			int	a=ps.executeUpdate();
 
 			session=request.getSession(true);
			session.setAttribute("user",name);
			response.sendRedirect("user.jsp");
	}else{
  	%>
  <%=code %>
  <%=coupen %>
coupen code wronge generate new code<a href="login.jsp"> Try Again</a>
<%} }else{%>
<%} %>
