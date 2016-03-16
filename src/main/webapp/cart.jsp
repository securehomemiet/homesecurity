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
{

response.sendRedirect("login.jsp");

}

 %>
 <%
 
	Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con=DriverManager.getConnection("jdbc:db2://awh-yp-small02.services.dal.bluemix.net:50000/BLUDB","dash110868","NPfmN4joH0P9");String id=request.getParameter("id");	
int item=Integer.parseInt(request.getParameter("item"));
String name=(String)session.getAttribute("user");
if(id.equals("service1"))
{
	PreparedStatement ps= con.prepareStatement("UPDATE CART SET ITEM1=? where EMAIL=? ");	
	ps.setInt(1,item);
	ps.setString(2,name);
	int	a=ps.executeUpdate();

}
if(id.equals("service2"))
{
	PreparedStatement ps= con.prepareStatement("UPDATE CART SET ITEM2=? where EMAIL=? ");	
	ps.setInt(1,item);
	ps.setString(2,name);
	int	a=ps.executeUpdate();



}
if(id.equals("service3"))
{
	PreparedStatement ps= con.prepareStatement("UPDATE CART SET ITEM3=? where EMAIL=? ");	
	ps.setInt(1,item);
	ps.setString(2,name);
	int	a=ps.executeUpdate();



}
if(id.equals("service6"))
{
	PreparedStatement ps= con.prepareStatement("UPDATE CART SET ITEM4=? where EMAIL=? ");	
	ps.setInt(1,item);
	ps.setString(2,name);
int	a=ps.executeUpdate();



}




response.sendRedirect("services.jsp");


%>