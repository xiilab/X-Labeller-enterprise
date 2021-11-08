package com.xlabeller.common.module;

import org.apache.log4j.Logger;
import org.freedesktop.gstreamer.Bus;
import org.freedesktop.gstreamer.Element;
import org.freedesktop.gstreamer.Gst;
import org.freedesktop.gstreamer.Pipeline;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class GstUtil
{

	private String searchDir = null;
	private String startsWith = null;
	private String endsWith = null;
	private static Logger logger = Logger.getLogger(GstUtil.class);
	
	private boolean isWait = true;
	
	public GstUtil() {
	}

	public void convertVideotoJPG(String videoPath, String imagePath, String baseName,String currentDate,String datasetId, int fps) {
		
		if(!Gst.isInitialized()) {
			Gst.init();
		}
		
		
		this.searchDir = imagePath+File.separator;
		this.startsWith = "v_"+baseName+"_"+datasetId+"_"+currentDate+"_";
		this.endsWith = ".jpg";
		
		String pipeSpec = "filesrc name=src ! decodebin !  autovideoconvert ! videorate ! video/x-raw, framerate="+String.valueOf(fps)+"/1 ! jpegenc ! multifilesink name=dst "; 
		
		String baseNamePath = "v_"+baseName+"_"+datasetId+"_"+currentDate+"_%08d.jpg";
		String srcVideo = videoPath;
		String outFile = imagePath+File.separator+baseNamePath;
		
		//String outFile = "output2/testtest_1_%d.jpg";
		
		Pipeline pipe = (Pipeline) Gst.parseLaunch(pipeSpec);
		
		
		pipe.getElementByName("src").set("location", srcVideo);
        pipe.getElementByName("dst").set("location", outFile);
		
		Bus bus = pipe.getBus();
		
        bus.connect((Bus.EOS) gstObject -> {
        	System.out.println("EOS "+gstObject);
        	isWait = false;

        	
//        	return;
        });
        bus.connect((Bus.ERROR) (gstObject, i, s) -> {
        	System.out.println("ERROR "+i+" "+s+" "+gstObject);
        	isWait = false;
        });
        bus.connect((Bus.WARNING) (gstObject, i, s) -> {
        	System.out.println("WARN "+i+" "+s+" "+gstObject);
        });
//        bus.connect((Bus.EOS) gstObject -> {return;} );
//        bus.connect((Bus.EOS)  obj -> Gst.quit() );
        pipe.play();
        while(isWait) {
        	try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				logger.error("GST Interrupt ERR",e);				
			}         	
        }
        
    	bus.close();
    	pipe.stop();
    	List<Element> elementList = pipe.getElements();    	
    	Element[] elements = new Element[elementList.size()];    	
    	elements = elementList.toArray(elements);
    	pipe.unlinkMany(elements);
    	pipe.removeMany(elements);    	
    	pipe.close();
    	pipe.dispose();
    	

    	

        return;
        
	}
	
	public List<String> getPath() {
		File dir = new File(searchDir);

		File[] matches = dir.listFiles(new FilenameFilter()
		{
		  public boolean accept(File dir, String name)
		  {
		     return name.startsWith(startsWith) && name.endsWith(endsWith);
		  }
		  
		});
		
		Arrays.sort(matches, (f1, f2) -> f1.compareTo(f2));
		
		
		List<String> pathList = new ArrayList<String>();
		
		
		for(int i = 0 ; i < matches.length;i++) {
			pathList.add(matches[i].getName());
		}
		return pathList;
		
	}	
	
	
}