package com.spring.project.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.sql.Clob;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.jdbc.core.JdbcTemplate;

public class Util {
	static final String bookThumbnailPath = "C://book//thumbnail//";
	static final String bookImagePath = "C://book//image//";
	static final String bookContentPath = "C://book//content//";

	public void returnImage(HttpServletResponse res, String imageName, int type) {
		switch (type) {
			case 1 : {
				transformImage(res, bookThumbnailPath, imageName);
				break;
			}
			case 2 : {
				transformImage(res, bookImagePath, imageName);
				break;
			}
			case 3 : {
				transformImage(res, bookContentPath, imageName);
				break;
			}
		}
	}
	
	private void transformImage(HttpServletResponse res, String path, String imageName) {
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
	
	public Clob stringToClob(String str) {
		if (null == str) {
            return null;
        } else {
            try {
                java.sql.Clob c = new javax.sql.rowset.serial.SerialClob(
                        str.toCharArray());
                return c;
            } catch (Exception e) {
                return null;
            }
        }
    }
}