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
		Connection con=DriverManager.getConnection("<credentials>","<credentials>","<credentials>");
		String id=request.getParameter("id");	



int service1=Integer.parseInt(request.getParameter("service1"));	
int service2=Integer.parseInt(request.getParameter("service2"));
int service3=Integer.parseInt(request.getParameter("service3"));	
int service6=Integer.parseInt(request.getParameter("service6"));
String name=(String)session.getAttribute("user");
PreparedStatement ps= con.prepareStatement("select * from USER where USERNAME=? ");
ps.setString(1,name);

ResultSet rs= ps.executeQuery();

if(rs.next()){

int serv1=Integer.parseInt(rs.getString(7));
int serv2=Integer.parseInt(rs.getString(20));
int serv3=Integer.parseInt(rs.getString(21));
int serv6=Integer.parseInt(rs.getString(24));
service1+=serv1;
service2+=serv2;
service3+=serv3;
service6+=serv6;
}
String s1= Integer.toString(service1);
String s2= Integer.toString(service2);
String s3= Integer.toString(service3);
String s6= Integer.toString(service6);
ps= con.prepareStatement("UPDATE USER SET TDETECT=?,SMSNOTI=?,REMOTEACCESS=?,NEIBOURALERT=? where USERNAME=?");
ps.setString(1,s1);
ps.setString(2,s2);
ps.setString(3,s3);
ps.setString(4,s6);
ps.setString(5,name);
 int a =ps.executeUpdate();
String k="0";
ps= con.prepareStatement("UPDATE CART SET ITEM1=?,ITEM2=?,ITEM3=?,ITEM4=? where EMAIL=?");
ps.setString(1,k);
ps.setString(2,k);
ps.setString(3,k);
ps.setString(4,k);
ps.setString(5,name);
 a =ps.executeUpdate();
response.sendRedirect("user.jsp");

%>