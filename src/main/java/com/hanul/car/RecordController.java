package com.hanul.car;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.MemberVO;
import myrecord.RecordService;
import myrecord.RecordVO;
import oil.MapVO;

@Controller
public class RecordController {
	@Autowired
	private RecordService service;

	@RequestMapping("/record_delete")
	public String record_delete(@RequestParam String record_id) {
		service.record_delete(record_id);
		
		return "myrecord/record";
	}
	
	@ResponseBody @RequestMapping("/my_record")
	public List<RecordVO> myRecord(@RequestParam(defaultValue="0000/00") String record_date, HttpSession session) {
		String user_id = (((MemberVO) session.getAttribute("login_info")).getUser_id());
		RecordVO vo = new RecordVO();
		vo.setRecord_date(record_date);
		vo.setUser_id(user_id);
		
		return service.myRecord(vo);
	}
	
	@ResponseBody @RequestMapping("/year_month")
	public List<RecordVO> year_month(HttpSession session) {
		String user_id = (((MemberVO) session.getAttribute("login_info")).getUser_id());
		
		return service.year_month(user_id);
	}
	
	// 기록
	@RequestMapping("/record.my")
	public String record() {
		return "myrecord/record";
	}
	
	@RequestMapping("/repairInsert")
	public String repairInsert(RecordVO vo, HttpSession session) {
		String user_id = (((MemberVO) session.getAttribute("login_info")).getUser_id());
		
		String[] repair_id_sp = vo.getRepair_id().split(",");
		String[] repair_cost_sp = vo.getRepair_cost().split(",");
		String[] memo_sp = vo.getMemo().split(",");
		
		String day = vo.getRecord_date().trim();
		String year = day.substring(0, 4).trim();
		String month = day.substring(5, day.indexOf("월")).trim();
		String nowday = day.substring(day.indexOf("월") + 1).replace("일", "").trim();
		if (Integer.parseInt(month) < 10) {
			month = "0" + month;
		}
		if (Integer.parseInt(nowday) < 10) {
			nowday = "0" + nowday;
		}
		day = year + month + nowday;
		vo.setRecord_date(day);
		
		for(int i=0; i<repair_id_sp.length; i++) {
			RecordVO tempVO = new RecordVO();
			tempVO.setRecord_date(vo.getRecord_date());
			tempVO.setCar_mileage(vo.getCar_mileage());
			tempVO.setUser_id(user_id);
			tempVO.setRepair_id(repair_id_sp[i]);
			tempVO.setRepair_cost(repair_cost_sp[i]);
			tempVO.setMemo(memo_sp[i]);
			
			service.repairInsert(tempVO);
		}
		
		return "redirect:record.my?user_id=" + user_id;
	}
	
	@RequestMapping("/oilrecord.oi")
	public String oilrecord(MapVO vo) {
		// mymileage,oil_price,oil_cost,oil_l;
		String day = vo.getDate().trim();
		String year = day.substring(0, 4).trim();
		String month = day.substring(5, day.indexOf("월")).trim();
		String nowday = day.substring(day.indexOf("월") + 1).replace("일", "").trim();
		if (Integer.parseInt(month) < 10) {
			month = "0" + month;
		}
		if (Integer.parseInt(nowday) < 10) {
			nowday = "0" + nowday;
		}
		day = year + month + nowday;
		vo.setDate(day);
		
		service.oilInsert(vo);
		return "redirect:record.my?user_id="+vo.getUser_id();
	}

	// 주유기록 등록하기
	@RequestMapping("/oilcheck.my")
	public String check() {

		return "mycheck/oilcheck";
	}

}
