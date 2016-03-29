package login;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.net.ftp.FTPClient;

import com.twilio.sdk.TwilioRestException;

import login.FTPUtil;
public class ImageUpload
{
public static void upload(String src) throws TwilioRestException
{
	String server = "xxxxxxx";
	int port = 21;
	String user = "xxxxxxxx";
	String pass = "xxxxxx";
	FTPClient ftpClient = new FTPClient();
	try {
		new Thread(new Runnable() {
		    public void run() {
		    	if(Services.getMyStatus(VideoController.usr));
				try {
					SendSMS.send(CameraMonitor.getPhoneNumber());
				} catch (TwilioRestException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(Services.getNeighbourStatus(VideoController.usr));
				try {
					SendSMS.sendneighbour(CameraMonitor.getPhoneNumbers());
				} catch (TwilioRestException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
				Date date = Calendar.getInstance().getTime();
			    // (2) create a date "formatter" (the date format we want)
			    SimpleDateFormat formatter = new SimpleDateFormat("hh.mm.ss$dd/MM/yyyy"); 
			    // (3) create a new String using the date format we want
			    String pDate = formatter.format(date);			
				CameraMonitor.updateDate(pDate);
		    }
		}).start();		
		// connect and login to the server
		ftpClient.connect(server, port);
		ftpClient.login(user, pass);
		// use local passive mode to pass firewall
		ftpClient.enterLocalPassiveMode();
		System.out.println("Connected");
		String remoteDirPath = "/public_html/";
		String localDirPath = src;
		FTPUtil.uploadDirectory(ftpClient, remoteDirPath, localDirPath, "");
		// log out and disconnect from the server
		ftpClient.logout();
		ftpClient.disconnect();
		System.out.println("Disconnected");
		CameraMonitor.updateNoOfDetections(VideoController.noOfDetections);
			
	} catch (IOException ex) {
		ex.printStackTrace();
	}
}

}
