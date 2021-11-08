package com.xlabeller.common.module;

//import java.awt.image.BufferedImage;
//import java.io.File;
//import java.io.InputStream;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.imageio.ImageIO;

//import org.bytedeco.javacv.FFmpegFrameGrabber;
//import org.bytedeco.javacv.Frame;
//import org.bytedeco.javacv.Java2DFrameConverter;

public class Video2Image {
   
	
//	private List<String> pathList = null;
//    
//	
//	public List<String> getPath() {
//		return pathList;
//	}
//	
//    
//    public int convertVideotoJPG(InputStream videoInputStream, String imagePath, String baseName,String currentDate, String imgType, int frameJump) {
//    	pathList = new ArrayList<String>();
//    	Java2DFrameConverter converter = new Java2DFrameConverter();  
//		FFmpegFrameGrabber frameGrabber = new FFmpegFrameGrabber(videoInputStream);  
//		
//		int imgNum=0;
//		try {
//			frameGrabber.start();  
//			Frame frame;  
//			double frameRate=frameGrabber.getFrameRate();  
//			  
//			System.out.println("Video has "+frameGrabber.getLengthInFrames()+" frames and has frame rate of "+frameRate);  
//			
//			int ii = 1;
//			while(ii<=frameGrabber.getLengthInFrames()){  
//				imgNum++;       
//				frameGrabber.setFrameNumber(ii);  
//				frame = frameGrabber.grab();  
//				BufferedImage bi = converter.convert(frame);  
//				String filePath = "v_"+baseName+"_"+String.valueOf(imgNum)+"_"+currentDate+".jpg";
//				String path = imagePath+File.separator+filePath;  
//				ImageIO.write(bi,imgType, new File(path));
//				pathList.add(filePath);
//				ii+=frameJump;  
//			}  
//			
//		} catch (Exception e) {  
//			e.printStackTrace(); 			
//		}finally{
//			try {
//				frameGrabber.stop();
//				frameGrabber.close();
//			} catch (org.bytedeco.javacv.FrameGrabber.Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		} 
//		
//		return imgNum;
//		
//     }  
}
