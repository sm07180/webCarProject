package com.hanul.car;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import member.CarVO;
import member.MemberService;
import member.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	HashMap<String, String> map2 = new HashMap<String, String>();
//	List<String> list = new ArrayList<String>();

	/* id 중복체크 */
	@ResponseBody
	@RequestMapping("/id_check")
	public String id_check(@RequestParam String user_id) {
		return String.valueOf(service.id_check(user_id));
	}

	@Autowired
	private CommonService common;

	/* 회원가입 처리 요청 */
	@ResponseBody
	@RequestMapping(value = "/gosignup.do", produces = "text/html; charset=utf-8")
	public String gosignup(MemberVO vo, @RequestParam MultipartFile attach_file, HttpSession session,
			HttpServletRequest req) {

		
		String ipAddress = req.getRemoteAddr();
		InetAddress inetAddress;
		if (ipAddress.equalsIgnoreCase("0:0:0:0:0:0:0:1")) {
			try {
				inetAddress = InetAddress.getLocalHost();
				ipAddress = inetAddress.getHostAddress();
			} catch (Exception e) {
				e.getMessage();
			}
		}

		if (!vo.getComp_id().equals("차없음")) {
			// 파일업로드처리
			if (attach_file.getSize() > 0) {
				String path = common.upload(attach_file, session, ipAddress);
				String[] arr = path.split(",");
				vo.setFilepath(arr[0]);
				vo.setMfilepath(arr[1]);
				vo.setCar_mimage(arr[1]);
			}
		}
		String msg = "<script type='text/javascript'>";
		if (service.insert(vo)) {
			msg += "alert('회원가입을 축하드립니다.'); location='home'";
		} else {
			msg += "alert('회원가입에 실패하였습니다.'); history.go(-2)";
		}
		msg += "</script>";
		
		session.setAttribute("login_info", vo);
		return msg;
	}

	/* 회원가입 화면 요청 */
	@RequestMapping("/signup.do")
	public String signup(Model model) {
		model.addAttribute("carlist", service.carlist()); // 자동차 회사 DB에서 가져옴
		return "member/signup";
	}

	/* 차종조회 */
	@ResponseBody
	@RequestMapping("/carName")
	public List<CarVO> carName(@RequestParam String comp_id) {
		List<CarVO> vo = service.carNameList(comp_id);
		return vo;
	}

	@RequestMapping("login.do")
	public String member() {

		return "member/login";
	}

	@ResponseBody
	@RequestMapping("/login")
	public boolean login(@RequestParam String user_id, @RequestParam String user_pw, HttpSession session,
			HttpServletRequest req) {

		// 아이디,비밀번호가 DB 에 일치하는 회원정보를 조회한 후
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		MemberVO vo = service.login(map);

		// 일치하는 회원정보가 있다면
		if (vo != null) {
			session.setAttribute("login_info", vo);
		}
		
		
		
		map2.put(((MemberVO) session.getAttribute("login_info")).getUser_id(),((MemberVO) session.getAttribute("login_info")).getUser_id());
//		for (String key : map2.keySet()) {
//			System.out.println(key+","+map2.get(key));
//	    }

		session.setAttribute("login_user_id", map2);

		// 로그인여부를 요청한 화면으로 보낸다.
		return (vo == null ? false : true);
	}

	@RequestMapping("/ktlogin")
	public String ktlogin(@RequestParam String user_id, @RequestParam String user_pw, @RequestParam String user_name,
			@RequestParam String phone, HttpSession session, HttpServletRequest req) {

		MemberVO vo = new MemberVO();
		vo.setUser_id(user_id);
		vo.setUser_pw(user_pw);
		vo.setUser_name(user_name);
		vo.setPhone(phone);

		if (service.id_check(user_id)) {
			service.ktinsert(vo);
		}
		session.setAttribute("login_info", vo);

		// 로그인여부를 요청한 화면으로 보낸다.
		return "home";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		// 세션에 있는 로그인정보를 삭제한 후
		
		String user_id = ((MemberVO) session.getAttribute("login_info")).getUser_id();
		map2.remove(user_id);
		session.removeAttribute("login_info");
		
		// 요청한 곳으로 돌아간다.
		return "redirect:home";
	}

	@RequestMapping("/info_modify")
	public String info_modify(HttpSession session, Model model) {

		model.addAttribute("carlist", service.carlist());
		
		return "member/modify";
	}

	// 회원정보수정
	@RequestMapping("/go_update.do")
	public String info_update(MemberVO vo, Model model, @RequestParam MultipartFile attach_file, HttpSession session,
			HttpServletRequest req) {

		String ipAddress = req.getRemoteAddr();
		InetAddress inetAddress;
		if (ipAddress.equalsIgnoreCase("0:0:0:0:0:0:0:1")) {
			try {
				inetAddress = InetAddress.getLocalHost();
				ipAddress = inetAddress.getHostAddress();
			} catch (UnknownHostException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (!vo.getComp_id().equals("차없음")) {
			// 파일업로드처리
			if (attach_file.getSize() > 0) {
				String path = common.upload(attach_file, session, ipAddress);
				String[] arr = path.split(",");
				vo.setFilepath(arr[0]);
				vo.setMfilepath(arr[1]);
				vo.setCar_mimage(arr[1]);
				// System.out.println(arr[1]);
			}
		}
		
		service.info_update(vo);

		session.removeAttribute("login_info");
		session.setAttribute("login_info", vo);
		
		return "redirect:home";
	}
	@RequestMapping("/delete.do")
	public String delete(@RequestParam String user_id,HttpSession session) {
		service.delete(user_id);
		session.removeAttribute("login_info");
		return "redirect:home";
	}

}
