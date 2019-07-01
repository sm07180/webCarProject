package com.hanul.car;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.MemberVO;
import myrepair.RepairService;
import myrepair.RepairVO;

@Controller
public class RepairController {
	@Autowired private RepairService service;
	
	@ResponseBody @RequestMapping("/recent_mileage")
	public String recnet_mileage(HttpSession session) {
		String user_id = (((MemberVO) session.getAttribute("login_info")).getUser_id());
		RepairVO vo = new RepairVO();
		vo = service.recent_mileage(user_id);
		
		return vo.getRecent_mileage();
	}
	
	@RequestMapping("/repairInsertForm")
	public String repairInsert(@RequestParam String result, Model model, HttpSession session) {
		String user_id = (((MemberVO) session.getAttribute("login_info")).getUser_id());
		
		List<RepairVO> list = new ArrayList<RepairVO>();
		List<RepairVO> tempList = service.repairList(user_id);
		
		for(int i=0; i<tempList.size(); i++) {
			if(result.contains(tempList.get(i).getRepair_name())) {
				RepairVO vo = new RepairVO();
				vo.setRepair_name(tempList.get(i).getRepair_name());
				vo.setRepair_id(tempList.get(i).getRepair_id());
				result.replace(tempList.get(i).getRepair_name(), "");
				
				list.add(vo);
			}
		}
		
		model.addAttribute("list", list);
		
		return "myrepair/repairInsert";
	}
	
	@ResponseBody @RequestMapping("/repairCheck")
	public RepairVO repairCheck(@RequestParam String repair_id) {
		return service.repairCheck(repair_id);
	}
	
	//차량점검
	@RequestMapping("/check.my")
		public String check(Model model, HttpSession session) {
		String user_id = (((MemberVO) session.getAttribute("login_info")).getUser_id());
		
		model.addAttribute("list", service.repairList(user_id));
		
		return "mycheck/check";
	}
	
	@RequestMapping("/repairDetail.my")
	public String repairDetail(@RequestParam String repair_id, Model model,
								HttpSession session) {
		String user_id = (((MemberVO) session.getAttribute("login_info")).getUser_id());
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("repair_id", repair_id);
		
		RepairVO vo = service.repairDetail(map);
		vo.setRepair_id(repair_id);
		
		model.addAttribute("detailList", vo);
		model.addAttribute("enter", "\r\n");
		
		return "myrepair/repairDetail";
	}
	
	@RequestMapping("/repair.my")
	public String repairList(Model model, HttpSession session) {
		String user_id = (((MemberVO) session.getAttribute("login_info")).getUser_id());
		model.addAttribute("list", service.repairList(user_id));
		
		return "myrepair/repair";
	}
}
