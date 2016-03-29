package login;
import java.text.SimpleDateFormat;
// You may want to be more specific in your imports 
import java.util.*; 

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import com.twilio.sdk.*; 
import com.twilio.sdk.resource.factory.*; 
import com.twilio.sdk.resource.instance.*; 
public class SendSMS { 
 // Find your Account Sid and Token at twilxxxxxxxxxxx"; 
 public static final String AUTH_TOKEN = "xxxxxxxx"; 
 public static Date time=Calendar.getInstance().getTime();
 static SimpleDateFormat formatter = new SimpleDateFormat("hh.mm.ss(dd/MM/yyyy)");
 static String pTime = formatter.format(time);	
 public static void send(String pno) throws TwilioRestException { 
		TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN); 
		 // Build the parameters 
			List<NameValuePair> params = new ArrayList<NameValuePair>(); 
			params.add(new BasicNameValuePair("To",pno)); 
			params.add(new BasicNameValuePair("From", "+18323042529")); 
			String s="Alert HOME SECURTIY("+pTime+": Some Illegal movements have been caught at your home. Please login to take action.";
			params.add(new BasicNameValuePair("Body",s ));    
			MessageFactory messageFactory = client.getAccount().getMessageFactory(); 
			Message message = messageFactory.create(params); 
			System.out.println(message.getSid()+",  "+pno); 
	 }
 public static void sendneighbour(ArrayList<String> pno) throws TwilioRestException { 
	TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN); 
	 // Build the parameters 
		int i;
		String Name=DbConnect.getName();
		String msg="Alert HOME SECURTIY("+pTime+"): Hello Sir/Madam, Mr. "+Name+" has send this  message to notify you that there is some illegal action at his Home.";
		for(i=0;i<pno.size();i++)
		{
		String no=pno.get(i);
		List<NameValuePair> params = new ArrayList<NameValuePair>(); 
		params.add(new BasicNameValuePair("To", no)); 
		params.add(new BasicNameValuePair("From", "+18323042529")); 
		params.add(new BasicNameValuePair("Body", msg));    
		MessageFactory messageFactory = client.getAccount().getMessageFactory(); 
		Message message = messageFactory.create(params); 
		System.out.println("Neighbour "+ message.getSid()+", "+no);
		}
 }
}