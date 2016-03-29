package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DbConnect {
	private static Connection con;
		// TODO Auto-generated method stub
		public static boolean authenticate(String user, String pass)
		{
		
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			con=DriverManager.getConnection("xxxxxxxxxxxx");
			 if (con != null) {
	                PreparedStatement ps= con.prepareStatement("select * from USER where USERNAME=? and PASSWORD=?");
	                ps.setString(1,user);
	                ps.setString(2,pass);
	                java.sql.ResultSet rs= ps.executeQuery();
	                if(rs.next())
	                	return true;
	                else
	                	return false;
	               
			 }
    	}
		catch (Exception e) {
			System.out.println(e);
    }
		return false;	
		
	}
		
		public static String getName()
		{
		
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			con=DriverManager.getConnection("xxxxxxxxxxxxxxxxxxxxx");
			String user=VideoController.usr;
			if (con != null) {
	                PreparedStatement ps= con.prepareStatement("select NAME from USER where USERNAME=?");
	                ps.setString(1,user);
	                java.sql.ResultSet rs= ps.executeQuery();
	                if(rs.next())
	                	return (rs.getString(1));       
			 }
    	}
		catch (Exception e) {
			System.out.println(e);
    }
		return null;	
		
	}
		
	public static void logout() throws SQLException
	{
			CameraMonitor.con1.close();
	}

}
