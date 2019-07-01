package common;

import java.io.File;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public interface CommonService {
	
	String upload(MultipartFile file, HttpSession session,String ipAddress);
	File download(String filepath, String filename,
			HttpSession session, HttpServletResponse response);
	void emailSend(String email, String name);
	void emailSend(String email, String name,HttpSession session);
}
