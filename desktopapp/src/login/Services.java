package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Services {
	private static Connection con;
	// TODO Auto-generated method stub
	public static boolean getMyStatus (String userName)
	{
	try {
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		con=DriverManager.getConnection("xxxxxxxxxxxxxxxxxxxxxxx");
		 if (con != null) {
                PreparedStatement ps= con.prepareStatement("select SMSNOTI from USER where USERNAME=?");
                ps.setString(1,userName);
                java.sql.ResultSet rs= ps.executeQuery();
                if(rs.next())
                {
                	if(rs.getInt(1)==1)
                		return true;
                }
                else
                	return false;             
		 }
	}
	catch (Exception e) {
		System.out.println(e);
}
	return false;	
	
}
	public static boolean getNeighbourStatus (String userName)
	{
	try {
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		con=DriverManager.getConnection("xxxxxxxxxxxxxxx");
		 if (con != null) {
                PreparedStatement ps= con.prepareStatement("select NEIBOURALERT from USER where USERNAME=?");
                ps.setString(1,userName);
                java.sql.ResultSet rs= ps.executeQuery();
                if(rs.next())
                {
                	if(rs.getInt(1)==1)
                		return true;
                }
                else
                	return false;             
		 }
	}
	catch (Exception e) {
		System.out.println(e);
}
	return false;	
	
}	
	
	
	

}
