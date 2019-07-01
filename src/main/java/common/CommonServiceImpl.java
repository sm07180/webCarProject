package common;

import java.io.File;
import java.io.FileInputStream;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.MultiPartEmail;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CommonServiceImpl implements CommonService {

	
	@Override
	public String upload(MultipartFile file, HttpSession session,String ipAddress) {
		//http://192.168.0.34:80/index/resources/images/upload/My20190522_122912.jpg
		ipAddress = "112.164.58.217";
		String mpath = "http://"+ipAddress+":80/car/resources/images/mycar_info/";
		//업로드할 물리적 위치
		//D:\Study_Spring\.metadata\.plugins\o..webapps\iot\resources
		String resources = session.getServletContext().getRealPath("/resources/images/mycar_info/");
		//D:\Study_Spring\.metadat..webapps\iot\resources\\upload
		//String upload = resources + "image"+ File.separator;
		
		//D:\Study_Spring\..iot\resources\\upload\\notice\\2019\\04\\05\\dffad34adfd-ffaf_abc.txt
		String folder = makeDir(resources);
		
//		동시 다발적으로 여러 사용자가 동일한 파일명의 서로 다른 파일을
//		업로드할 수 있으므로 파일명은 고유id 를 부여한다.
		//dffad34adfd-ffaf_abc.txt
		String uuid = file.getOriginalFilename();
		try {
			file.transferTo( new File(folder, uuid) );
		
		}catch(Exception e) {
		}
//		return folder.substring(resources.length()) 
//								+ File.separator + uuid;
		String path = resources + uuid + ",";
		mpath = mpath + uuid;
		String uploadb = path + mpath;
		return uploadb;
	}

	
	// 파일경로 잡아주기
		public String makeDir(String upload) {
			StringBuilder sb = new StringBuilder( upload );
			upload = sb.toString();
			
			File f = new File( upload );
			if( ! f.exists() ) f.mkdirs();
			
			return upload;
		}

	@Override
	public File download(String filepath, String filename,
			HttpSession session, HttpServletResponse response) {

		//다운로드해올 파일이 있는 물리적 위치
		File file = new File(filepath);
		String mime 
		= session.getServletContext().getMimeType(filename);
		if( mime == null )	mime = "application/octet-stream";
		response.setContentType(mime);
		
		try {
			//한글파일명처리
			filename = URLEncoder.encode(filename, "utf-8");
			
			response.setHeader(
				"content-disposition", 
				"attachment; filename=" + filename);
			ServletOutputStream out = response.getOutputStream();
			FileCopyUtils.copy(new FileInputStream(file), out);
			out.flush();
		}catch(Exception e) {
		}
		return file;
	}
	
	
	@Override
	public void emailSend(String email, String name, HttpSession session) {
//		attachEmail(email, name, session);
		htmlEmail(email, name, session);
	}
	private void htmlEmail(String email, String name, HttpSession session) {
		HtmlEmail mail = new HtmlEmail();
		mail.setHostName("smtp.naver.com");
		mail.setCharset("utf-8");
		mail.setDebug(true);
		
		mail.setAuthentication("juroom2005", "ma4537385");
		mail.setSSLOnConnect(true);
		
		try {
			mail.setFrom("juroom2005@naver.com", "관리자");
			mail.addTo(email, name);
			
			mail.setSubject("Html 태그 형태의 이메일 송신");
			StringBuilder sb = new StringBuilder();
			sb.append("<html>");
			sb.append("<body>");
			sb.append("<a href='http://hanuledu.co.kr'>한울 홈 연결</a>");
			sb.append("<img src='https://mvnrepository.com/assets/images/392dffac024b9632664e6f2c0cac6fe5-logo.png' />");
			sb.append("<h3>환영합니다</h3>");
			sb.append("내용 작성하기<br>");
			sb.append("</body>");
			sb.append("</html>");
			
			mail.setHtmlMsg(sb.toString());
		
			EmailAttachment attach = new EmailAttachment();
			attach.setPath(session.getServletContext().getRealPath("resources") 
							+ File.separator + "img" 
							+ File.separator + "hanul.logo.png");
			mail.attach(attach);
			
			mail.send();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	private void attachEmail(String email, String name, HttpSession session) {
		
		MultiPartEmail mail = new MultiPartEmail();
		
		mail.setHostName("smtp.naver.com");
		mail.setCharset("utf-8");
		mail.setDebug(true);
		
		mail.setAuthentication("juroom2005", "ma4537385");
		mail.setSSLOnConnect(true);
		
		try {
			mail.setFrom("juroom2005@naver.com", "관리자");
			mail.addTo(email, name);
			
			mail.setSubject("집에가고싶다");
			mail.setMsg("시대가어느때인데 도대체 왜 아직도 텔레포트가안되는건데 ㅅㅂ 집에 1초만에가야될거아니야 개같네진짜 ㅅㅄㅄㅄㅄㅄㅄㅆㅃ!!!");
			
			//첨부파일객체
			EmailAttachment attach = new EmailAttachment();
			attach.setPath(session.getServletContext().getRealPath("resources") 
							+ File.separator + "img" 
							+ File.separator + "hanul.logo.png");
			mail.attach(attach);
			
			attach = new EmailAttachment();
			attach.setURL(new URL("https://img.freepik.com/free-vector/polygonal-lion-head_23-2147495868.jpg?size=338&ext=jpg"));
			mail.attach(attach);
			
			mail.send();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void emailSend(String email, String name) {
		//수신할 이메일주소, 수신자명
		basicEmail(email, name);
	}
	
	private void basicEmail(String email, String name) {
		SimpleEmail mail = new SimpleEmail();
		
		//이메일 송신 서버 지정
		mail.setHostName("smtp.naver.com");
		mail.setCharset("utf-8");
		mail.setDebug(true);
		
		//메일서버에 로그인하기 위한 아이디/비밀번호 지정
		mail.setAuthentication("juroom2005", "ma4537385");
		mail.setSSLOnConnect(true);
		
		try {
			mail.setFrom("juroom2005@naver.com", "관리자");
			//수신인 지정
			mail.addTo(email, name); 	//가입회원의 정보
			
			mail.setSubject("집에보내줘");
			mail.setMsg("집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..집에갈래..");
			
			//메일전송
			mail.send();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("email");
		}
	}

}








