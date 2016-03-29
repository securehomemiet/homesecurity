package login;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.opencv.core.Core;
import org.opencv.core.CvType;
import org.opencv.core.Mat;
import org.opencv.core.MatOfByte;
import org.opencv.core.MatOfFloat;
import org.opencv.core.MatOfInt;
import org.opencv.core.MatOfPoint;
import org.opencv.core.Point;
import org.opencv.core.Rect;
import org.opencv.core.Scalar;
import org.opencv.core.Size;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.imgproc.Imgproc;
import org.opencv.videoio.VideoCapture;
import com.twilio.sdk.TwilioRestException;

import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import java.util.Date;
public class VideoController
{
	// the FXML button
	@FXML
	private Button button;
	@FXML
	private Button logbutton;
	// the FXML grayscale checkbox
	@FXML
	private CheckBox grayscale;
	// the FXML logo checkbox
	@FXML
	private CheckBox logoCheckBox;
	// the FXML grayscale checkbox
	@FXML
	private TextField username;
	@FXML
	private PasswordField password;
	public static String usr;
	// FXML Detection Checkbox
	@FXML
	private ImageView histogram;
	// the FXML area for showing the current frame
	@FXML 
	ImageView currentFrame;
	// a timer for acquiring the video stream
	private ScheduledExecutorService timer;
	private ScheduledExecutorService timer1;
	// the OpenCV object that realizes the video capture
 VideoCapture capture;
	// a flag to change the button behavior
	private boolean cameraActive;
	private int intcameraActive;
	// the logo to be loaded
	private Mat logo;
	private MatOfInt histSize;
	private MatOfInt channels = new MatOfInt(0);
	int channel[]={0,1};
	private  MatOfFloat histRange = new MatOfFloat(0, 256);
	double cb=0;
	double cr=0;
	double cg=0;
	static int i,j;
	private String dest=null;
	public static boolean auth=false;
	private boolean detection=false;	
	public static int noOfDetections;
	/**
	 * Initialize method, automatically called by @{link FXMLLoader}
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	
	
	public void startCamerat()
	{

		// set a fixed width for the frame
		this.currentFrame.setFitWidth(600);
		// preserve image ratio
		this.currentFrame.setPreserveRatio(true);
		
		if (!this.cameraActive)
		{
			if(!auth)
			{
				Alert alert = new Alert(AlertType.INFORMATION);
				alert.setTitle("Error");
				alert.setHeaderText("Not Logged In");
				String s ="Please login to use the facilities";
				alert.setContentText(s);
				alert.show();
			}
			else
			{
			// start the video capture
			this.capture.open(0);
			// is the video stream available?
			if (this.capture.isOpened())
			{
				this.cameraActive = true;
				CameraMonitor.camStatus(true);
				button.setText("Stop Camera");
				Runnable frameGrabber = new Runnable() {
					@Override
					public void run()
					{
						Image imageToShow = grabFrame();
						currentFrame.setImage(imageToShow);
					}
				};
				
				this.timer = Executors.newSingleThreadScheduledExecutor();
				this.timer.scheduleAtFixedRate(frameGrabber, 0, 80, TimeUnit.MILLISECONDS);	
			}
			else
			{
				// log the error
				System.err.println("Impossible to open the camera connection...");
			}
		   }
		}
		else
		{
			// the camera is not active at this point
			CameraMonitor.camStatus(false);
			this.cameraActive = false;
			// update again the button content
			this.button.setText("Start Camera");
			
			// stop the timer
			try
			{
				this.timer.shutdown();
				this.timer.awaitTermination(80, TimeUnit.MILLISECONDS);
			}
			catch (InterruptedException e)
			{
				// log the exception
				System.err.println("Exception in stopping the frame capture, trying to release the camera now... " + e);
			}
			
			// release the camera
			this.capture.release();
			// clean the frame
			this.currentFrame.setImage(null);
		}
	}
	
	public void startCameracloud()
	{
		startCamerat();       
	}
	public void initializeCamera(int f)
	{
		boolean changed;
		if(f!=intcameraActive)
			{
				changed=true;
			}
		else
			{
			changed=false;
			}
		if(f==1 && changed)
			{	
			this.cameraActive=false;
			startCameracloud();
			}
		else
			{
				if(f==0)
				{
					this.capture.release();
					this.currentFrame.setImage(null);
				}
			}
			intcameraActive=f;
	}
	
	public void detectmode(boolean detect)
	{
		detection=detect;
	}
	
	public void initialize() throws ClassNotFoundException, SQLException
	{
		this.capture = new VideoCapture();
		this.cameraActive=false;
	}
	
	/**
	 * The action triggered by pushing the button on the GUI
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 */
	//..........................Login Authentication...............................................................................
	@FXML
	public void checklogin() throws SQLException, ClassNotFoundException, IOException
	{
		if(!auth)
		{
			usr=username.getText();
			if(DbConnect.authenticate(usr,password.getText()))
				{
					
					auth=true;
					Alert alert = new Alert(AlertType.INFORMATION);
					alert.setTitle("Successful");
					alert.setHeaderText("Login Successful");
					String s ="You Have Successfully Logged in Now Click Ok to use the Services.....";
					alert.setContentText(s);
					alert.show();
					this.logbutton.setText("Logout");
					CameraMonitor.startcamCheck(usr);
					CameraMonitor.updateDeviceStatus(true);
					noOfDetections=CameraMonitor.getNoOfDetections();
					Runnable camStatusCheck = new Runnable() {
						@Override
						public void run()
						{
							initializeCamera(CameraMonitor.monitor());
							detectmode(CameraMonitor.detectStatus());
						}
					};			
					this.timer1 = Executors.newSingleThreadScheduledExecutor();
					this.timer1.scheduleAtFixedRate(camStatusCheck, 0, 1000, TimeUnit.MILLISECONDS);
					
				}
			else
			{
				Alert alert = new Alert(AlertType.INFORMATION);
				alert.setTitle("Error");
				alert.setHeaderText("Login Error");
				String s ="Invalid Username Or Password";
				alert.setContentText(s);
				alert.show();
				this.logbutton.setText("Login");
				auth=false;
			}
		}
		else
		{
			DbConnect.logout();
			Alert alert = new Alert(AlertType.INFORMATION);
			alert.setTitle("Successfull");
			alert.setHeaderText("Successfully Logged Out");
			String s ="You have been successfully logged out.To use our Services please login again";
			alert.setContentText(s);
			alert.show();
			this.logbutton.setText("Login");
			auth=false;
			this.timer1.shutdown();
			CameraMonitor.camStatus(false);
			CameraMonitor.updateDeviceStatus(false); 
			// the camera is not active at this point
						this.cameraActive = false;
						// update again the button content
						this.button.setText("Start Camera");
						
						// stop the timer
						try
						{
							this.timer.shutdown();
							this.timer.awaitTermination(50, TimeUnit.MILLISECONDS);
						}
						catch (InterruptedException e)
						{
							// log the exception
							System.err.println("Exception in stopping the frame capture, trying to release the camera now... " + e);
						}
						
						// release the camera
						this.capture.release();
						// clean the frame
						this.currentFrame.setImage(null);
		}
	}
//----------------------------------------------------------------------------------------------------------------------------------------
	
//-----------------------------------------------Start Camera------------------------------------------------------------------------------	
	@FXML
	protected void startCamera()
	{
		startCamerat();
	}
	
	/**
	 * The action triggered by selecting/deselecting the logo checkbox
	 */
	@FXML
	protected void loadLogo()
	{
		if (logoCheckBox.isSelected())
		{
			// read the logo only when the checkbox has been selected
			this.logo = Imgcodecs.imread("Detected.png");
		}
	}
	
	/**
	 * Get a frame from the opened video stream (if any)
	 * 
	 * @return the {@link Image} to show
	 */
	private Image grabFrame()
	{
		// init everything
		Image imageToShow = null;
		Mat frame = new Mat();
		// check if the capture is open
		if (this.capture.isOpened())
		{
			try
			{
				// read the current frame
				this.capture.read(frame);
				
				// if the frame is not empty, process it
				if (!frame.empty())
				{
					// add a logo...
					
					if (grayscale.isSelected())
					{
						Imgproc.cvtColor(frame, frame, Imgproc.COLOR_BGR2GRAY);
					}
								
					// show the histogram
					this.showHistogram(frame, grayscale.isSelected());
					// convert the Mat object (OpenCV) to Image (JavaFX)
					//imageToShow = mat2Image(frame);
			// Detect for any motion
						if (detection && detect(frame))
						{							
						i++;
						if(i<2)
						{
							/*Date date = Calendar.getInstance().getTime();
						    // (2) create a date "formatter" (the date format we want)
						    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-hh.mm.ss"); 
						    // (3) create a new String using the date format we want
						    String folderName = formatter.format(date);
							*/
							dest="C:\\HomeSecurity\\"+usr;
							File file = new File(dest);
							file.mkdirs();									
						}
						frame=insertdate(frame);
						if(i<6)
						{
						Imgcodecs.imwrite(dest+"\\"+(i+(5*noOfDetections))+".jpeg", frame);
						if(i==5)
						{
							i=0;
							noOfDetections++;
							new Thread(new Runnable() {
							    public void run() {
							    	try {
										ImageUpload.upload("C:\\HomeSecurity\\");
									} catch (TwilioRestException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
							    }
							}).start();	
						}
						
						}
						Imgproc.putText(frame,"MOTION DETECTED",new Point(20,240),2,2,new Scalar (0,255,0),2);		
						imageToShow=mat2Image(frame);
						return imageToShow;
					}
				}
				
			}
			catch (Exception e)
			{
				// log the error
				System.err.println("Exception during the frame elaboration: " + e);
			}
		}
		frame=insertdate(frame);
		//Imgproc.cvtColor(frame, frame, Imgproc.COLOR_GRAY2BGR);
		imageToShow=mat2Image(frame);
		return imageToShow;
	}
	
	/**
	 * Compute and show the histogram for the given {@link Mat} image
	 * 
	 * @param frame
	 *            the {@link Mat} image for which compute the histogram
	 * @param gray
	 *            is a grayscale image?
	 */
	private void showHistogram(Mat frame, boolean gray)
	{
		// split the frames in multiple images
		List<Mat> images = new ArrayList<Mat>();
		Core.split(frame, images);
		
		// set the number of bins at 256
		histSize = new MatOfInt(256);
		// only one channel
		channels = new MatOfInt(0);
		// set the ranges
		histRange = new MatOfFloat(0, 256);
		
		// compute the histograms for the B, G and R components
		Mat hist_b = new Mat();
		Mat hist_g = new Mat();
		Mat hist_r = new Mat();
		// B component or gray image
		Imgproc.calcHist(images.subList(0, 1), channels, new Mat(), hist_b, histSize, histRange, false);

				// G and R components (if the image is not in gray scale)
		if (!gray)
		{
			Imgproc.calcHist(images.subList(1, 2), channels, new Mat(), hist_g, histSize, histRange, false);
			Imgproc.calcHist(images.subList(2, 3), channels, new Mat(), hist_r, histSize, histRange, false);
		}
	
		// draw the histogram
		int hist_w = 150; // width of the histogram image
		int hist_h = 150; // height of the histogram image
		int bin_w = (int) Math.round(hist_w / histSize.get(0, 0)[0]);
		
		Mat histImage = new Mat(hist_h, hist_w, CvType.CV_8UC3, new Scalar(0, 0, 0));
		// normalize the result to [0, histImage.rows()]
		Core.normalize(hist_b, hist_b, 0, histImage.rows(), Core.NORM_MINMAX, -1, new Mat());
		
		// for G and R components
		if (!gray)
		{
			Core.normalize(hist_g, hist_g, 0, histImage.rows(), Core.NORM_MINMAX, -1, new Mat());
			Core.normalize(hist_r, hist_r, 0, histImage.rows(), Core.NORM_MINMAX, -1, new Mat());
		}
		
		// effectively draw the histogram(s)
		for (int i = 1; i < histSize.get(0, 0)[0]; i++)
		{
			// B component or gray image
			Imgproc.line(histImage, new Point(bin_w * (i - 1), hist_h - Math.round(hist_b.get(i - 1, 0)[0])),
					new Point(bin_w * (i), hist_h - Math.round(hist_b.get(i, 0)[0])), new Scalar(255, 0, 0), 2, 8, 0);
			// G and R components (if the image is not in gray scale)
			if (!gray)
			{
				Imgproc.line(histImage, new Point(bin_w * (i - 1), hist_h - Math.round(hist_g.get(i - 1, 0)[0])),
						new Point(bin_w * (i), hist_h - Math.round(hist_g.get(i, 0)[0])), new Scalar(0, 255, 0), 2, 8,
						0);
				Imgproc.line(histImage, new Point(bin_w * (i - 1), hist_h - Math.round(hist_r.get(i - 1, 0)[0])),
						new Point(bin_w * (i), hist_h - Math.round(hist_r.get(i, 0)[0])), new Scalar(0, 0, 255), 2, 8,
						0);
			}
		}
		
		// display the histogram...
		Image histImg = mat2Image(histImage);
		this.histogram.setImage(histImg);
	}
	
	/**
	 * Convert a Mat object (OpenCV) in the corresponding Image for JavaFX
	 * 
	 * @param frame
	 *            the {@link Mat} representing the current frame
	 * @return the {@link Image} to show
	 */
	private Image mat2Image(Mat frame)
	{
		// create a temporary buffer
		MatOfByte buffer = new MatOfByte();
		// encode the frame in the buffer, according to the PNG format
		Imgcodecs.imencode(".png", frame, buffer);
		// build and return an Image created from the image encoded in the
		// buffer
		return new Image(new ByteArrayInputStream(buffer.toArray()));
	}
/*---------------------------Detection code contour  based------------------------------*/
	private boolean detect(Mat oldframe)
	{
		Imgproc.cvtColor(oldframe, oldframe, Imgproc.COLOR_BGR2GRAY);
		Mat newframe=new Mat();
		this.capture.read(newframe);
		Imgproc.cvtColor(newframe, newframe, Imgproc.COLOR_BGR2GRAY);
		Mat difference=new Mat();
		Mat threshold=new Mat();
		Core.absdiff(oldframe, newframe, difference);
		Imgproc.threshold(difference, threshold, 40, 255, Imgproc.THRESH_BINARY);
		Size a=new Size(10,10);
		Imgproc.blur(threshold, threshold,a);
		Imgproc.threshold(threshold, threshold, 40, 255, Imgproc.THRESH_BINARY);
		Mat temp=new Mat();
		threshold.copyTo(temp);
		List<MatOfPoint> contour=new ArrayList<MatOfPoint>();
		Mat hierarchy=new Mat();
		Imgproc.findContours(threshold, contour, hierarchy, 0, 2 );
		if(contour.size()>0)	
			return true;
		else
			return false;
		
		
	}
	
	
/*-----------------------------Detetcion code histogram based---------------------------------------*/	
  /*
	private void detect(Mat oldframe)
  { 		
	  List<Mat> images1 = new ArrayList<Mat>();
	  Core.split(oldframe, images1);
	  Mat oldhistb=new Mat();
	  Mat newhistb=new Mat();
	  Mat oldhistr=new Mat();
	  Mat newhistr=new Mat();
	  Mat oldhistg=new Mat();
	  Mat newhistg=new Mat();
	  Imgproc.calcHist(images1.subList(0,1), channels, new Mat(), oldhistb, histSize, histRange, true);
		Imgproc.calcHist(images1.subList(1,2), channels, new Mat(), oldhistr, histSize, histRange, true);
		Imgproc.calcHist(images1.subList(1,2), channels, new Mat(), oldhistg, histSize, histRange, true);
		
		Mat newframe=new Mat();
		try {
		    Thread.sleep(100);                 //1000 milliseconds is one second.
		} catch(InterruptedException ex) {
		    Thread.currentThread().interrupt();
		}
		this.capture.read(newframe);
	   List<Mat> nimages = new ArrayList<Mat>();
	  Core.split(newframe, nimages);  
	  Imgproc.calcHist(nimages.subList(0,1), channels, new Mat(), newhistb, histSize, histRange, false);
	  Imgproc.calcHist(nimages.subList(0,1), channels, new Mat(), newhistr, histSize, histRange, false);	
	  Imgproc.calcHist(nimages.subList(0,1), channels, new Mat(), newhistg, histSize, histRange, false);		 
	  Core.normalize( oldhistb, oldhistb, 0, 1, Core.NORM_MINMAX, -1, new Mat() );
	  Core.normalize( newhistb, newhistb, 0, 1, Core.NORM_MINMAX, -1, new Mat() );
	  Core.normalize( oldhistr, oldhistr, 0, 1, Core.NORM_MINMAX, -1, new Mat() );
	  Core.normalize( newhistr, newhistr, 0, 1, Core.NORM_MINMAX, -1, new Mat() );
	  Core.normalize( oldhistr, oldhistg, 0, 1, Core.NORM_MINMAX, -1, new Mat() );
	  Core.normalize( newhistr, newhistg, 0, 1, Core.NORM_MINMAX, -1, new Mat() );
	  
	  cb= Imgproc.compareHist(oldhistb, newhistb, 1);
	  cr= Imgproc.compareHist(oldhistr, newhistr, 1);
	  cg= Imgproc.compareHist(oldhistg, newhistg, 1);
	  if(cb>0.4 && cr>0.4 &&cg>0.4)
		  System.out.println("Motion Detected for "+cb+" "+cr+" "+cg+" value");
	  else
		  System.out.println("Motion NotDetected for "+cb+" "+cr+" "+cg+" value");
	  
  }*/
	private Mat insertdate(Mat frame)
	{
		Date date = new Date();	
		Imgproc.putText(frame, date.toString(),new Point(350,20),5,0.8,new Scalar(0,0,0));
		return frame;
	}
}
