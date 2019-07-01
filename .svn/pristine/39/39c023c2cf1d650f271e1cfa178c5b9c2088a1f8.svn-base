package com.hanul.car;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.MemberVO;
import mychart.ChartService;


@Controller
public class ChartController {
	@Autowired private ChartService service;
	
	@ResponseBody @RequestMapping("/chart/{gubun}")
	public List<HashMap<String, Object>> chart(@PathVariable String gubun, 
					HttpSession session, Model model) {
		String user_id = ((MemberVO) session.getAttribute("login_info")).getUser_id();
		
		if(gubun.equals("oil")) return service.oil_chart(user_id);
		else if(gubun.equals("oil_cost")) return service.oil_cost_chart(user_id);
		else if(gubun.equals("repair_cost")) return service.repair_cost_chart(user_id);
		else return service.oil_repair_cost(user_id);
	}

}
