package com.spring.project.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class Util {
	static final String bookThumbnailPath = "C://book//thumbnail//";
	static final String bookImagePath = "C://book//image//";
	static final String bookContentPath = "C://book//content//";

	public void thumbnail(HttpServletResponse res, String imageName) {
		returnImage(res, bookThumbnailPath, imageName);
	}
	
	public void bookimage(HttpServletResponse res, String imageName) {
		returnImage(res, bookImagePath, imageName);
	}
	
	public void content(HttpServletResponse res, String imageName) {
		returnImage(res, bookContentPath, imageName);
	}
	
	private void returnImage(HttpServletResponse res, String path, String imageName) {
		File file = new File(path + imageName);
		
		try {
			FileInputStream ifo = new FileInputStream(file);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			byte[] buf = new byte[1024];
			int readlength = 0;
			while((readlength = ifo.read(buf)) != -1 ) {
				baos.write(buf,0,readlength);
			}
			byte[] imgbuf = null;
			imgbuf = baos.toByteArray();
			baos.close();
			ifo.close();    
			   
			int length = imgbuf.length;   
			OutputStream out = res.getOutputStream();    
			out.write(imgbuf , 0, length);
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}