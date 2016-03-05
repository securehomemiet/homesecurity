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

<%


Class.forName("com.ibm.db2.jcc.DB2Driver");
Connection	con=DriverManager.getConnection("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB","dash104103","36d91BTn8E5w");


 int a=0;

       	PreparedStatement ps= con.prepareStatement("UPDATE  USER  SET contactno='+919125100366' WHERE USERNAME='admin' ");
	
 	a=ps.executeUpdate();
 	%>