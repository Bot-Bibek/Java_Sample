package com.controller.general;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;


public class UpdateUserImage {
	
	public static boolean deletePhoto(String path) {
	    boolean isDeleted = false;
	    try {
	        File file = new File(path);
	        if (file.exists()) {
	            isDeleted = file.delete();
	            if (!isDeleted) {
	                throw new IOException("Unable to delete file " + path);
	            }
	        }
	        isDeleted = true;
	    } catch (IOException e) {
	        System.out.println("Failed to delete file " + path + ": " + e.getMessage());
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isDeleted;
	}
	
	public static boolean savePhoto(InputStream fis , String path) {
		boolean isSaved = false;
		try {
			try {
				FileOutputStream fos = new FileOutputStream(path);
				
				
				byte[]data = new byte[fis.available()];
				fis.read(data);
				fos.write(data);
				fos.close();
				isSaved = true;
				
				}catch(Exception e) {
					e.printStackTrace();
				}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		
		}

		return isSaved;
		
	}

}