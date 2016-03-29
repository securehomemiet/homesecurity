package login;
	

import javafx.application.Application;
import javafx.event.EventHandler;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;



import java.sql.SQLException;

import org.opencv.core.Core;

/**
 * The main class for a JavaFX application. It creates and handle the main
 * window with its resources (style, graphics, etc.).
 * 
 * This application handles a video stream and can convert its frames in gray
 * scale or color. Moreover, for each frame, it shows the corresponding
 * histogram and it is possible to add a logo in a corner of the video.
 * 
 * @author <a href="mailto:luigi.derussis@polito.it">Luigi De Russis</a>
 * @version 1.1 (2015-10-20)
 * @since 1.0 (2013-11-20)
 * 
 */
public class Main extends Application
{
	@Override
	public void start(Stage primaryStage)
	{
		try
		{
			// load the FXML resource
			FXMLLoader loader = new FXMLLoader(getClass().getResource("Video.fxml"));
			// store the root element so that the controllers can use it
			BorderPane rootElement = (BorderPane) loader.load();
			// create and style a scene
			Scene scene = new Scene(rootElement, 800, 600);
			scene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());
			// create the stage with the given title and the previously created
			// scene
			primaryStage.setTitle("Home Security");
			primaryStage.setScene(scene);
			// show the GUI
			primaryStage.show();
			 primaryStage.setOnCloseRequest(new EventHandler<WindowEvent>() {
		          public void handle(WindowEvent we) {
		              if(VideoController.auth==true)
					{
		            	  Alert alert = new Alert(AlertType.INFORMATION);
							alert.setTitle("Error");
							alert.setHeaderText("Not Logged Out");
							String s ="Logging You Out Please Wait";
							alert.setContentText(s);
							alert.show();
		            	  try {
							DbConnect.logout();
							CameraMonitor.camStatus(false);
							CameraMonitor.updateDeviceStatus(false);
							VideoController.auth=false;
							// clean the frame
						//	VideoController.currentFrame.setImage(null);
							Thread.sleep(1000);
		            	  } catch (SQLException | InterruptedException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}					
					}
		          }
		      });        
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args)
	{
		// load the native OpenCV library
		System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
		
		launch(args);
	}
}