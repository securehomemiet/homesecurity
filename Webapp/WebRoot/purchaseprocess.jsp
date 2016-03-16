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


<%
 HttpSession session=request.getSession(false);
Class.forName("com.ibm.db2.jcc.DB2Driver");
Connection con=DriverManager.getConnection("<credentials>","<credentials>","<credentials>");
String email1=request.getParameter("email");	
String fname1=request.getParameter("fname");
String lname1=request.getParameter("lname");	
String name=request.getParameter("username");
String sub="1";
String camera1="1";

String no1=request.getParameter("no");
String sms1="1";
String add=request.getParameter("address");
String pass1=request.getParameter("pass");	
String cpass1=request.getParameter("cpass");
String motion1="1";	

String remote1="1";	
String neighbour1="1";
String detect1="1000";	
int k=0;
String y="0";



String z="0";
String p="4";
PreparedStatement ps= con.prepareStatement("INSERT into USER (USERNAME,NAME,EMAIL,NOCAMERA,CONTACTNO,ADDRESS,PASSWORD,TDETECT,SMSNOTI,REMOTEACCESS,MOTIONDETECT,NEIBOURALERT,SERVICES,DETECTED,STATUSCAM,STATUSDETECT,DEVICESTATUS,SUBSCRIPTION,STATUS) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
ps.setString(1,name);
ps.setString(2,fname1);
ps.setString(3,email1);
ps.setString(4,camera1);
ps.setString(5,no1);
ps.setString(6,add);
ps.setString(7,pass1);
ps.setString(8,detect1);
ps.setString(9,sms1);
ps.setString(10,remote1);
ps.setString(11,motion1);
ps.setString(12,neighbour1);
ps.setString(13,p);
ps.setString(14,z);
ps.setString(15,z);
ps.setString(16,z);
ps.setString(17,z);
ps.setString(18,z);
ps.setString(19,z);



int	a=ps.executeUpdate();
int z1=0;
 ps= con.prepareStatement("INSERT into CART (EMAIL,ITEM1,ITEM2,ITEM3,ITEM4) VALUES (?,?,?,?,?)");
ps.setString(1,name);
ps.setInt(2,z1);
ps.setInt(3,z1);
ps.setInt(4,z1);
ps.setInt(5,z1);

a=ps.executeUpdate();



if(a==1){
//String uname =rs.getString(2);

response.sendRedirect("login.jsp?id=abc");
}else{
out.println("<b>Invalid User name or Password try again</b>");
RequestDispatcher rd= request.getRequestDispatcher("purchase.jsp");
rd.include(request,response);
}
%>