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

	// ---------------------ȸ�������κ�----------------------

	// ȸ���� ���� ������
	@RequestMapping("/admin/writeDetail")
	public String rittalList(Model model,ConnectCntVO vo) {
		ConnectCntVO vo2 = connectCntService.writeDetail(vo);
		vo2.setTitle_name(vo.getTitle_name());
		
		if(vo.getTitle_name().equals("board")) {
			model.addAttribute("boarddetail",vo2);
		}else {
			model.addAttribute("ttdetail",vo2);
		}
		
		
		//�湮��
		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);
		
		model.addAttribute("enter", "\r\n");
		return "/honeytip/honeytip_detail.admin";
		
	}

	// ȸ����Ȳ ����Ʈ
	@RequestMapping("/admin/rittalList")
	public String rittalList(Model model) {

		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);
		model.addAttribute("memberlist", connectCntService.memberList());

		return "/rittal/list.admin";
	}

	// ȸ�� Ȱ������(������)
	@RequestMapping("/admin/rittalDetail")
	public String rittalDetail(Model model, @RequestParam String user_id) {

		Map<String, String> result = connectCntService.rittalCnt(user_id);
		model.addAttribute("result", result);
		

		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);

		return "/rittal/detail.admin";
	}

	// ȸ�� �ۼ��ѱ۵� ���
	@RequestMapping("/admin/cntInfo")
	public String cntInfo(Model model, String user_id) {

		List<ConnectCntVO> writeList = connectCntService.writeList(user_id);

		model.addAttribute("writeList", writeList);
		model.addAttribute("user_id", user_id);
		//�湮��
		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);
		
		return "/rittal/cntInfo.admin";
	}

	// �����ڱ��Ѻο�
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
	
	// ----------------------- ȸ������ �κ� --------------------

	// ----------------------- �������� �κ�--------------------------
	// (����������) �������� ����Ʈ
	@RequestMapping("/admin/notifyList")
	public String list(Model model, NotifyVO notifyVO) {

		model.addAttribute("resultList", service.fullselect(notifyVO));
		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);

		return "/notify/list.admin";
	}

	// �������� �۾��� ȭ��
	@RequestMapping("/admin/notifynew")
	public String notifynew(Model model) {
		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);

		return "/notify/new.admin";
	}

	// �������� �� ����
	@RequestMapping("/admin/notifinsert")
	public String insert(NotifyVO vo, HttpSession session) {
		service.insert(vo);

		// ���ȭ������ ����
		return "redirect:notifyList";
	}

	// �������� ������
	@RequestMapping("/admin/notifydetail")
	public String notifydetail(@RequestParam int notify_id, Model model) {

		model.addAttribute("vo", service.detail(notify_id));
		model.addAttribute("enter", "\r\n");

		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);

		return "/notify/detail.admin";
	}

	// �������� ����ȭ��
	@RequestMapping("/admin/notifyModify")
	public String modify(@RequestParam int notify_id, Model model) {

		// ������ ������ ������ DB���� ��ȸ�ؿ� ��
		model.addAttribute("vo", service.detail(notify_id));

		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);

		// ����ȭ������ ����
		return "/notify/modify.admin";
	}

	// �������� ��������ó�� ��û
	@RequestMapping("/admin/notifyUpdate")
	public String update(NotifyVO vo, HttpSession session) {

		service.update(vo);

		return "redirect:notifydetail?notify_id=" + vo.getNotify_id();
	}

	// �������� ����
	@RequestMapping("/admin/notifyDelete")
	public String delete(int notify_id, HttpSession session) {

		service.delete(notify_id);
		return "redirect:notifyList";
	}
	// --------------------�������� �κ�---------------------------

	// --------------------���� �κ�-----------------------------
	// ���Խ��� ����Ʈ
	@RequestMapping("/admin/honeytipList")
	public String honeytip_list(Model model, TipVO tipvo) {

		model.addAttribute("resultList", service.honeytip_select(tipvo));

		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);

		return "/honeytip/honeytip_list.admin";
	}

	// ���� �۾��� ȭ��
	@RequestMapping("/admin/honeytipnew")
	public String honeytip_new(Model model) {

		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);

		return "/honeytip/honeytip_new.admin";
	}

	// �� �� ����
	@RequestMapping("/admin/honeytipinsert")
	public String honeytip_insert(TipVO tipvo, HttpSession session) {
		// �̹��� ����������
		// SmartEditor => photo_uploader => plugin => hp_SE2M_AttachQuickPhoto.js �� ����
		// _getPhotoTag width= �� �����ϱ�
		String user_id = (((MemberVO) session.getAttribute("login_info")).getUser_id());
		
		tipvo.setUser_id(user_id);
		service.honeytip_insert(tipvo);
		// ���ȭ������ ����
		return "redirect:honeytipList";
	}

	// �� ������
	@RequestMapping("/admin/honeytipdetail")
	public String honeytip_detail(@RequestParam int tt_id, Model model) {

		model.addAttribute("vo", service.honeytip_detail(tt_id));
		model.addAttribute("enter", "\r\n");

		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);

		return "/honeytip/honeytip_detail.admin";
	}

	// �� ����ȭ��
	@RequestMapping("/admin/honeytipModify")
	public String honeytip_modify(@RequestParam int tt_id, Model model) {

		// ������ ������ ������ DB���� ��ȸ�ؿ� ��
		model.addAttribute("vo", service.honeytip_detail(tt_id));

		Map<String, Integer> resultMap = connectCntService.getVisitCnt();
		model.addAttribute("resultMap", resultMap);

		// ����ȭ������ ����
		return "/honeytip/honeytip_modify.admin";
	}

	// �� ��������ó�� ��û
	@RequestMapping("/admin/honeytipUpdate")
	public String honeytip_update(TipVO tipvo, HttpSession session) {

		service.honeytip_update(tipvo);
		return "redirect:honeytipdetail?tt_id=" + tipvo.getTt_id();
	}

	// �� ����
	@ResponseBody
	@RequestMapping(value ="/admin/honeytipDelete", produces="application/text; charset=utf-8")
	public void honeytip_delete(@RequestParam int tt_id,@RequestParam String title_name,HttpSession session) {		
		service.honeytip_delete(tt_id,title_name);
	}

	// ------------------------�����κ�-------------------------------
}
