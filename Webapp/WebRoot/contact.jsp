<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page session="false" %>

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


 %>
 <%
 
	Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con=DriverManager.getConnection("jdbc:db2://awh-yp-small02.services.dal.bluemix.net:50000/BLUDB","dash110868","NPfmN4joH0P9");
		String mess=request.getParameter("mess");	

String email=request.getParameter("email");	
String sub=request.getParameter("subject");
String temp="new";
PreparedStatement ps= con.prepareStatement("INSERT into CONTACT VALUES(?,?,?,?)");
ps.setString(1,email);
ps.setString(2,sub);
ps.setString(3,mess);
ps.setString(4,temp);

int	a=ps.executeUpdate();


response.sendRedirect("index.jsp");

%>