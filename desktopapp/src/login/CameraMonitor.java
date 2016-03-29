package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CameraMonitor {
	static int camflag;
	static int decflag;
	public static Connection con1;
	static String usernm;
	public static void startcamCheck(String user) throws ClassNotFoundException, SQLException
	{ 
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		con1=DriverManager.getConnection("xxxxxxxxxxxxxxxxxx");
		usernm=user;
	}
		public static int monitor()
	{
		try {
			if (con1 != null) {
	                PreparedStatement ps= con1.prepareStatement("select STATUSCAM from 	USER where USERNAME=?");
	                ps.setString(1,usernm);
	                java.sql.ResultSet rs= ps.executeQuery();
	                if(rs.next())
	                	camflag=rs.getInt(1);    
	             //   System.out.println(camflag);
	                if(camflag==1)
	                	return 1;
	                else
	                	return 0;
			 }
    	}
		catch (Exception e) {
			System.out.println(e);
    }
	return 0;	
	}
		public static  void camStatus(boolean status)
		{
			try {
				if (con1 != null) {
		                PreparedStatement ps1= con1.prepareStatement("update USER set STATUSCAM=? where USERNAME=?");
		                if(status==true) 
		                	ps1.setString(1,"1");
		                else
		                	ps1.setString(1,"0");
		                ps1.setString(2,usernm);
		                int rs1= ps1.executeUpdate();            	
				 }
	    	}
			catch (Exception e) {
				System.out.println(e);
			}
				
		}
		
		public static boolean detectStatus()
		{
			try {
				if (con1 != null) {
		                PreparedStatement ps1= con1.prepareStatement("select STATUSDETECT from USER where USERNAME=?");
		                ps1.setString(1,usernm);
		                ResultSet rs= ps1.executeQuery();  
		                if(rs.next())
		                {
		                	decflag=rs.getInt(1);    
		   	             //   System.out.println(camflag);
		   	                if(decflag==1)
		   	                	return true;
		   	                else
		   	                	return false;
		                }
				 }
	    	}
			catch (Exception e) {
				System.out.println(e);
			}
			return false;
				
		}
		
		
		public static  void updateCamStatus(boolean status)
		{
			try {
				if (con1 != null) {
		                PreparedStatement ps1= con1.prepareStatement("update USER set STATUSDETECT=? where USERNAME=?");
		                if(status==true) 
		                	ps1.setString(1,"1");
		                else
		                	ps1.setString(1,"0");
		                ps1.setString(2,usernm);
		                int rs1= ps1.executeUpdate();  
		                if(rs1==1)
		                	System.out.println("Updated");
				 }
	    	}
			catch (Exception e) {
				System.out.println(e);
			}
		}	
			public static  void updateDeviceStatus(boolean status)
			{
				try {
					if (con1 != null) {
			                PreparedStatement ps1= con1.prepareStatement("update USER set DEVICESTATUS=? where USERNAME=?");
			                if(status==true) 
			                	ps1.setString(1,"1");
			                else
			                	ps1.setString(1,"0");
			                ps1.setString(2,usernm);
			                int rs1= ps1.executeUpdate();
					 }
		    	}
				catch (Exception e) {
					System.out.println(e);
				}
			
		}
			
			public static String getPhoneNumber()
			{
			try {
				Class.forName("com.ibm.db2.jcc.DB2Driver");
				con1=DriverManager.getConnection("xxxxxxxxxxxxxx");
				 if (con1 != null) {
		                PreparedStatement ps= con1.prepareStatement("select * from USER where USERNAME=?");
		                ps.setString(1,usernm);
		                java.sql.ResultSet rs= ps.executeQuery();
		                if(rs.next())
		                {
		                	return (rs.getString(8));
		                 }
				 }
	    	}
			catch (Exception e) {
				System.out.println(e);
	    }
			return null;
	}		
		

			public static int getNoOfDetections()
			{
			try {
				Class.forName("com.ibm.db2.jcc.DB2Driver");
				con1=DriverManager.getConnection("xxxxxxxxxxxxxxxxxx");
				 if (con1 != null) {
		                PreparedStatement ps= con1.prepareStatement("select DETECTED from USER where USERNAME=?");
		                ps.setString(1,usernm);
		                java.sql.ResultSet rs= ps.executeQuery();
		                if(rs.next())
		                {
		                	return (rs.getInt(1));
		                 }
				 }
	    	}
			catch (Exception e) {
				System.out.println(e);
			}
			return -1;
	}					
			
			public static void updateNoOfDetections(int no)
			{
			try {
				Class.forName("com.ibm.db2.jcc.DB2Driver");
				con1=DriverManager.getConnection("xxxxxxxxxxxxxxxxxx");
				 if (con1 != null) 
				 {
		                PreparedStatement ps= con1.prepareStatement("update USER set DETECTED=? where USERNAME=?");
		                ps.setInt(1,no);
		                ps.setString(2,usernm);
		                int rs= ps.executeUpdate();
				 }
			}
			catch (Exception e) {
				System.out.println(e);
			}
		}			
			public static void updateDate(String pDate)
			{
				String dateToInsert;
			try {
				Class.forName("com.ibm.db2.jcc.DB2Driver");
				con1=DriverManager.getConnection("xxxxxxxxxxxxx");
				 if (con1 != null) 
				 {
					 String date = null;
		                PreparedStatement ps= con1.prepareStatement("select DATE from USER where USERNAME=?");
		                ps.setString(1,usernm);
		                ResultSet rs= ps.executeQuery();
		                if(rs.next())
		                   	date=rs.getString(1);
		            
		          if(date == null || date.isEmpty()) 
		        	  	dateToInsert=pDate;
		          else
		        	  dateToInsert=date+","+pDate;
		          PreparedStatement ps1= con1.prepareStatement("update USER set DATE=? where USERNAME=?");
		          ps1.setString(1,dateToInsert);
		          ps1.setString(2,usernm);
	                int rs1= ps1.executeUpdate();
				 }
			}
			 catch (Exception e) {
				System.out.println(e);
			}
		}		
			
			
	public static ArrayList<String> getPhoneNumbers()
			{
			ArrayList<String> ar = new ArrayList<String>();
			try {
				Class.forName("com.ibm.db2.jcc.DB2Driver");
				con1=DriverManager.getConnection("xxxxxxxxxxxxxxxxxxx");
				 if (con1 != null) {
		                PreparedStatement ps= con1.prepareStatement("select * from USER where USERNAME=?");
		                ps.setString(1,usernm);
		                java.sql.ResultSet rs= ps.executeQuery();
		                if(rs.next())
		                {
		                	String s1 =rs.getString(9);
		                	String s2 =rs.getString(10);
		                	String s3 =rs.getString(11);
		                	String s4 =rs.getString(12);
		                	ar.add(s1);
		                	ar.add(s2);
		                	ar.add(s3);
		                	ar.add(s4);	
		                 }
				 }
				 return ar;
	    	}
			catch (Exception e) {
				System.out.println(e);
	    }
			return ar;
	}
	
	
	
			
}
