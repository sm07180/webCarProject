package com.hanul.car;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.MemberVO;
import tip.TTReplyVO;
import tip.TipPage;
import tip.TipService;

@Controller
public class TipController {
	@Autowired
	private TipService service;
	@Autowired
	private TipPage page;

	//댓글 변경저장 처리 요청
		@ResponseBody @RequestMapping(value = "/tip/reply/update", produces="application/text; charset=utf-8")
		public String tt_reply_update(@RequestBody TTReplyVO vo) {
			return service.tt_reply_update(vo) ? "성공" : "실패";
		}
		
		//댓글 삭제처리 요청
		@ResponseBody @RequestMapping("/tip/reply/delete/{tt_reply_id}")
		public void tt_reply_delete(@PathVariable int tt_reply_id) {
			//해당 댓글을 DB에서 삭제한 후
			service.tt_reply_delete(tt_reply_id);
		}
		
		//댓글 등록
		@ResponseBody @RequestMapping("/tip/reply/insert")
		public boolean tt_reply_insert(TTReplyVO vo, HttpSession session) {
			String user_id = (((MemberVO) session.getAttribute("login_info")).getUser_id());
			
			vo.setUser_id(user_id);
			
			return service.tt_reply_insert(vo);
		}
		
		//댓글 목록
		@RequestMapping("/tip/reply_list/{tt_id}")
		public String tt_reply_list(@PathVariable int tt_id, Model model) {
			model.addAttribute("list", service.tt_reply_list(tt_id));
			model.addAttribute("enter", "\r\n");
			model.addAttribute("lf", "\n");
			
			return "tip/ttreply/tt_reply_list";
		}
	
	
	// 꿀팁게시판 게시글 상세
	@RequestMapping("/tipDetail.bo")
	public String tipDetail(@RequestParam int tt_id, Model model,@RequestParam(defaultValue = "1") int read) {

		if (read == 1) {
			service.read(tt_id);
		}

		model.addAttribute("vo", service.detail(tt_id));
		model.addAttribute("enter", "\r\n");

		return "tip/tip_detail";
	}

	// 꿀팁게시판 목록
	@RequestMapping("/tiplist.bo")
	public String tipList(Model model, @RequestParam(defaultValue = "1") int curPage,
			@RequestParam(required = false) String search, @RequestParam(defaultValue = "") String keyword) {

		page.setCurPage(curPage);
		page.setSearch(keyword.isEmpty() ? "" : search);
		page.setKeyword(keyword);

		model.addAttribute("page", service.list(page));
		return "tip/tip_list";
	}

}
