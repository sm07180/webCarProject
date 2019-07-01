package com.hanul.car;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import notify.NotifyPage;
import notify.NotifyServiceImpl;

@Controller
public class NotifyController {

	@Autowired
	private NotifyServiceImpl service;
	@Autowired
	private NotifyPage page;

	// 공지글목록화면 요청
	@RequestMapping("/list.no")
	public String list(Model model, @RequestParam(defaultValue = "1") int curPage) {

		page.setCurPage(curPage);

		model.addAttribute("page", service.list(page));

		// 목록화면으로 연결
		return "notify/list";
	}

	@RequestMapping("/detail.no")
	public String detail(@RequestParam int notify_id, Model model,@RequestParam(defaultValue="0") int read) {

		//조회수올림
		if(read==1) service.read(notify_id);
		
		// 선택한 공지글 정보를 DB에서 조회해온 후
		model.addAttribute("vo", service.detail(notify_id));
		model.addAttribute("page", page);
		model.addAttribute("enter", "\r\n");
		// 상세화면으로 연결
		return "notify/detail";
	}
}
