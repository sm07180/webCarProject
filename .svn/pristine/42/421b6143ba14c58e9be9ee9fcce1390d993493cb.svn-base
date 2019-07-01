package com.hanul.car;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import connectcnt.ConnectCntService;
import connectcnt.ConnectCntVO;
import member.MemberVO;
import notify.NotifyServiceImpl;
import notify.NotifyVO;
import tip.TipVO;

@Controller
public class AdminController {

	@Autowired
	private ConnectCntService connectCntService;

	@Autowired
	private NotifyServiceImpl service;

	// ---------------------회원관리부분----------------------

	// 회원이 쓴글 디테일
	@RequestMapping("/admin/writeDetail")
	public String rittalList(Model model,ConnectCntVO vo) {
		ConnectCntVO vo2 = connectCntService.writeDetail(vo);
		vo2.setTitle_name(vo.getTitle_name());
		
		if(vo.getTitle_name().equals("board")) {
			model.addAttribute("boarddetail",vo2);
		}else {
			model.addAttribute("ttdetail",vo2);
		}
		
		
		//방문자
		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);
		
		model.addAttribute("enter", "\r\n");
		return "/honeytip/honeytip_detail.admin";
		
	}

	// 회원현황 리스트
	@RequestMapping("/admin/rittalList")
	public String rittalList(Model model) {

		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);
		model.addAttribute("memberlist", connectCntService.memberList());

		return "/rittal/list.admin";
	}

	// 회원 활동내역(디테일)
	@RequestMapping("/admin/rittalDetail")
	public String rittalDetail(Model model, @RequestParam String user_id) {

		Map<String, String> result = connectCntService.rittalCnt(user_id);
		model.addAttribute("result", result);
		

		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);

		return "/rittal/detail.admin";
	}

	// 회원 작성한글들 목록
	@RequestMapping("/admin/cntInfo")
	public String cntInfo(Model model, String user_id) {

		List<ConnectCntVO> writeList = connectCntService.writeList(user_id);

		model.addAttribute("writeList", writeList);
		model.addAttribute("user_id", user_id);
		//방문자
		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);
		
		return "/rittal/cntInfo.admin";
	}

	// 관리자권한부여
	@RequestMapping("/admin/rittalAdmin")
	public String rittalAdmin(Model model, @RequestParam String user_id, @RequestParam String admin) {

		connectCntService.rettalAdmin(user_id, admin);

		return "redirect:rittalList";
	}
	
	@RequestMapping("/admin/userDelete")
	public String userDelete(@RequestParam String user_id) {

//		System.out.println(user_id);
		connectCntService.userDelete(user_id);
		return "redirect:rittalList";
	}
	
	// ----------------------- 회원관리 부분 --------------------

	// ----------------------- 공지사항 부분--------------------------
	// (관리자전용) 공지사항 리스트
	@RequestMapping("/admin/notifyList")
	public String list(Model model, NotifyVO notifyVO) {

		model.addAttribute("resultList", service.fullselect(notifyVO));
		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);

		return "/notify/list.admin";
	}

	// 공지사항 글쓰기 화면
	@RequestMapping("/admin/notifynew")
	public String notifynew(Model model) {
		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);

		return "/notify/new.admin";
	}

	// 공지사항 글 저장
	@RequestMapping("/admin/notifinsert")
	public String insert(NotifyVO vo, HttpSession session) {
		service.insert(vo);

		// 목록화면으로 연결
		return "redirect:notifyList";
	}

	// 공지사항 디테일
	@RequestMapping("/admin/notifydetail")
	public String notifydetail(@RequestParam int notify_id, Model model) {

		model.addAttribute("vo", service.detail(notify_id));
		model.addAttribute("enter", "\r\n");

		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);

		return "/notify/detail.admin";
	}

	// 공지사항 수정화면
	@RequestMapping("/admin/notifyModify")
	public String modify(@RequestParam int notify_id, Model model) {

		// 선택한 공지글 정보를 DB에서 조회해온 후
		model.addAttribute("vo", service.detail(notify_id));

		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);

		// 수정화면으로 연결
		return "/notify/modify.admin";
	}

	// 공지사항 수정저장처리 요청
	@RequestMapping("/admin/notifyUpdate")
	public String update(NotifyVO vo, HttpSession session) {

		service.update(vo);

		return "redirect:notifydetail?notify_id=" + vo.getNotify_id();
	}

	// 공지사항 삭제
	@RequestMapping("/admin/notifyDelete")
	public String delete(int notify_id, HttpSession session) {

		service.delete(notify_id);
		return "redirect:notifyList";
	}
	// --------------------공지사항 부분---------------------------

	// --------------------꿀팁 부분-----------------------------
	// 팁게시판 리스트
	@RequestMapping("/admin/honeytipList")
	public String honeytip_list(Model model, TipVO tipvo) {

		model.addAttribute("resultList", service.honeytip_select(tipvo));

		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);

		return "/honeytip/honeytip_list.admin";
	}

	// 꿀팁 글쓰기 화면
	@RequestMapping("/admin/honeytipnew")
	public String honeytip_new(Model model) {

		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);

		return "/honeytip/honeytip_new.admin";
	}

	// 팁 글 저장
	@RequestMapping("/admin/honeytipinsert")
	public String honeytip_insert(TipVO tipvo, HttpSession session) {
		// 이미지 사이즈저장
		// SmartEditor => photo_uploader => plugin => hp_SE2M_AttachQuickPhoto.js 에 들어가서
		// _getPhotoTag width= 값 변경하기
		String user_id = (((MemberVO) session.getAttribute("login_info")).getUser_id());
		
		tipvo.setUser_id(user_id);
		service.honeytip_insert(tipvo);
		// 목록화면으로 연결
		return "redirect:honeytipList";
	}

	// 팁 디테일
	@RequestMapping("/admin/honeytipdetail")
	public String honeytip_detail(@RequestParam int tt_id, Model model) {

		model.addAttribute("vo", service.honeytip_detail(tt_id));
		model.addAttribute("enter", "\r\n");

		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);

		return "/honeytip/honeytip_detail.admin";
	}

	// 팁 수정화면
	@RequestMapping("/admin/honeytipModify")
	public String honeytip_modify(@RequestParam int tt_id, Model model) {

		// 선택한 공지글 정보를 DB에서 조회해온 후
		model.addAttribute("vo", service.honeytip_detail(tt_id));

		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);

		// 수정화면으로 연결
		return "/honeytip/honeytip_modify.admin";
	}

	// 팁 수정저장처리 요청
	@RequestMapping("/admin/honeytipUpdate")
	public String honeytip_update(TipVO tipvo, HttpSession session) {

		service.honeytip_update(tipvo);
		return "redirect:honeytipdetail?tt_id=" + tipvo.getTt_id();
	}

	// 팁 삭제
	@ResponseBody
	@RequestMapping(value ="/admin/honeytipDelete", produces="application/text; charset=utf-8")
	public void honeytip_delete(@RequestParam int tt_id,@RequestParam String title_name,HttpSession session) {		
		service.honeytip_delete(tt_id,title_name);
	}

	// ------------------------꿀팁부분-------------------------------
}
