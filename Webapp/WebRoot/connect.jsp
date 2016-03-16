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
response.sendRedirect("login.jsp");

String st="";String cam1="1",cam0="0";
Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection	con=DriverManager.getConnection("jdbc:db2://awh-yp-small02.services.dal.bluemix.net:50000/BLUDB","dash110868","NPfmN4joH0P9");
st=request.getParameter("id");
 int a=0;
 String name=(String)session.getAttribute("user");
 %><%=st %>
<%if(st.equals("cam0")){ %>
                   
                   
       <h1 color="blue"> connecting to remote camera</h1>         
       <%
       
       	PreparedStatement ps= con.prepareStatement("UPDATE  USER  SET STATUSCAM=? WHERE USERNAME=? ");
	ps.setString(1,cam1);
	ps.setString(2,name);
 	a=ps.executeUpdate();
       if(a==0){ %>
    		<script type="text/javascript">
				alert("camera failure cheak setting");
			</script>
    		 <% 
    		 response.sendRedirect("user.jsp");              
 	 }else{ %>
  	 <script type="text/javascript">
			alert("camera successfully started");
	</script>
 	 <% 
 	  response.sendRedirect("user.jsp");
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
    <h1 color="blue"> connecting to remote camera</h1>     
 			 <script type="text/javascript">
				alert("camera failure cheak setting");
			</script>
    		 <% 
    		 response.sendRedirect("index.jsp");              
 	 }else{ %>
  	 		<script type="text/javascript">
				alert("camera successfully stoped");
			</script>
 	 <% 
 	  response.sendRedirect("user.jsp");
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
    <h1 color="blue"> Starting Detection</h1>     
 			 <script type="text/javascript">
				alert("Detection failure cheak setting");
			</script>
    		 <% 
    		 response.sendRedirect("user.jsp");              
 	 }else{ %>
  	 		<script type="text/javascript">
				alert("Detection successfuly Started");
			</script>
 	 <% 
 	  response.sendRedirect("user.jsp");
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
    <h1 color="blue"> Stopping Detection</h1>     
 			 <script type="text/javascript">
				alert("Detection failure cheak setting");
			</script>
    		 <% 
    		 response.sendRedirect("user.jsp");              
 	 }else{ %>
  	 		<script type="text/javascript">
				alert("Detection successfuly Started");
			</script>
 	 <% 
 	  response.sendRedirect("user.jsp");
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
    <h1 color="blue"> Stopping Detection</h1>     
 			 <script type="text/javascript">
				alert("Failure failure cheak setting");
			</script>
    		 <% 
    		 response.sendRedirect("user.jsp");              
 	 }else{ %>
  	 		<script type="text/javascript">
				alert("Cloud successfuly Started");
			</script>
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
    <h1 color="blue"> Stopping Detection</h1>     
 			 <script type="text/javascript">
				alert("Failure failure cheak setting");
			</script>
    		 <% 
    		 response.sendRedirect("user.jsp");              
 	 }else{ %>
  	 		<script type="text/javascript">
				alert("Cloud successfuly Started");
			</script>
 	 <% 
 	  response.sendRedirect("user.jsp");
 		 }
  
  }
 	%>



  
  