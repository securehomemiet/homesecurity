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

response.sendRedirect("login.jsp");

}

 %>
 <%
 
	Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con=DriverManager.getConnection("jdbc:db2://awh-yp-small02.services.dal.bluemix.net:50000/BLUDB","dash110868","NPfmN4joH0P9");String id=request.getParameter("id");	

int total=Integer.parseInt(request.getParameter("total"));	
String coupen=request.getParameter("coupen");

PreparedStatement ps= con.prepareStatement("SELECT * from COUPEN where COUPENID=? ");
ps.setString(1,coupen);


ResultSet rs= ps.executeQuery();

if(rs.next()){
int price =rs.getInt(2);
total=total-price;
if(total<=0){%>
Coupen Apply successfully ......<a href="buynow.jsp?coupen=<%=price%>"> Click</a> to continue
<%}else{ %>
Coupen  unsuccessfully ......<a href="buynow.jsp?coupen=0"> Click</a> to continue


<% }
}else{
out.println("<b>Invalid User name or Password try again</b>");
RequestDispatcher rd= request.getRequestDispatcher("login.jsp");
rd.include(request,response);
}
%>