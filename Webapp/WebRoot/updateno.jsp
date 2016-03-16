
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
if(session==null)
{

response.sendRedirect("index.jsp");

}

 %>
 
 <% 
 int a=0;
 String name=(String)session.getAttribute("user");
Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection	con=DriverManager.getConnection("<credentials>","<credentials>","<credentials>");
String mob1=request.getParameter("mob1");
String mob2=request.getParameter("mob2");
String mob3=request.getParameter("mob3");
String mob4=request.getParameter("mob4");
%>
  <script type="text/javascript">alert(mob1);</script>
  <%

 
 if(mob1!="0")
 {
 	PreparedStatement ps= con.prepareStatement("UPDATE  USER  SET HELP1=? WHERE USERNAME=? ");
	ps.setString(1,mob1);
	ps.setString(2,name);
 	a=ps.executeUpdate();
 
 }
 
 if(mob2!="0")
 {
 	PreparedStatement ps2= con.prepareStatement("UPDATE  USER  SET HELP2=? where USERNAME=? ");
	ps2.setString(1,mob2);
		ps2.setString(2,name);
 	a=ps2.executeUpdate();
 
 }
 
 if(mob3!="0")
 {
 	PreparedStatement ps3= con.prepareStatement("UPDATE  USER  SET HELP3=? where USERNAME=? ");
	ps3.setString(1,mob3);
		ps3.setString(2,name);
 	a=ps3.executeUpdate();
 
 }
 
 if(mob4!="0")
 {
 	PreparedStatement ps4= con.prepareStatement("UPDATE USER  SET HELP4=? where USERNAME=? ");
	ps4.setString(1,mob4);
		ps4.setString(2,name);
 	a=ps4.executeUpdate();
 
 }
 
 
 
 
 
 if(a==1)
 {%>
 <script type="text/javascript">alert("Successfully updated");</script>
 <%
 
 }
 else
 {%>
  <script type="text/javascript">alert("Unable to update try again");</script>
  <%
 }
 response.sendRedirect("user.jsp");
 
  //RequestDispatcher rd=request.getRequestDispatcher("user.jsp");
//rd.include(request,response);
 
 %>