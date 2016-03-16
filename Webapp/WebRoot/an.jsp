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


String st="";String cam1="1",cam0="0",name="admin";
 Class.forName("com.ibm.db2.jcc.DB2Driver");
Connection	con=DriverManager.getConnection("<credentials>","<credentials>","<credentials>");

st=request.getParameter("id");
 int a=0;
 
 %>
<%if(st.equals("cam0")){ %>
                   
                   
          
       <%
       
       	PreparedStatement ps= con.prepareStatement("UPDATE  USER  SET STATUSCAM=? WHERE USERNAME=? ");
	ps.setString(1,cam1);
	ps.setString(2,name);
 	a=ps.executeUpdate();
       if(a==0){ %>
    		
    		 <% 
    		             
 	 }else{ %>
  	 
 	 <% 
 	  
 	 }
  }
if(st.equals("cam1"))
  {
  	PreparedStatement ps1= con.prepareStatement("UPDATE  USER  SET STATUSCAM=? WHERE USERNAME=? ");
	ps1.setString(1,cam0);
	ps1.setString(2,name);
 	a=ps1.executeUpdate();
    if(a==0){
  %>
       
 			 
    		 <% 
    		         
 	 }else{ %>
  	 		
 	 <% 
 	 
 		 }
  
  }
 	%>
  <%
  //detect
if(st.equals("detect0"))
 {
  	PreparedStatement ps1= con.prepareStatement("UPDATE  USER  SET STATUSDETECT=? WHERE USERNAME=? ");
	ps1.setString(1,"1");
	ps1.setString(2,name);
 	a=ps1.executeUpdate();
    if(a==0){
  %>
   
    		 <% 
    		         
 	 }else{ %>
  	 		
 	 <% 
 	
 		 }
  
  }
 	%>

<%
  //detect1
if(st.equals("detect1"))
 {
  	PreparedStatement ps1= con.prepareStatement("UPDATE  USER  SET STATUSDETECT=? WHERE USERNAME=? ");
	ps1.setString(1,"0");
	ps1.setString(2,name);
 	a=ps1.executeUpdate();
    if(a==0){
  %>
  
    		 <% 
    		      
 	 }else{ %>
  	 		
 	 <% 
 	
 		 }
  
  }
 	%>
 	
 	<%
  //cloud1
if(st.equals("cloud1"))
 {
  	PreparedStatement ps1= con.prepareStatement("UPDATE  USER  SET DEVICESTATUS=? WHERE USERNAME=? ");
	ps1.setString(1,"0");
	ps1.setString(2,name);
 	a=ps1.executeUpdate();
    if(a==0){
  %>
    
    		 <% 
    		   
 	 }else{ %>
  	 		
 	 <% 
 	  response.sendRedirect("user.jsp");
 		 }
  
  }
 	%>

 	 	<%
  //cloud
if(st.equals("cloud0"))
 {
  	PreparedStatement ps1= con.prepareStatement("UPDATE  USER  SET DEVICESTATUS=? WHERE USERNAME=? ");
	ps1.setString(1,"1");
	ps1.setString(2,name);
 	a=ps1.executeUpdate();
    if(a==0){
  %>
   
    		 <% 
    		    
 	 }else{ %>
  	 		
 	 <% 
 	 
 		 }
  
  }
 	%>



  
  