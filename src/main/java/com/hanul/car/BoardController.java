package com.hanul.car;

import java.io.File;
import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import board.BoardPage;
import board.BoardService;
import board.BoardVO;
import board.ReplyVO;
import common.CommonService;
import member.MemberVO;

@Controller @SessionAttributes({"category", "iot_title"})
public class BoardController {
	@Autowired private CommonService common;
	@Autowired private BoardService service;
	
	//댓글 변경저장 처리 요청
	@ResponseBody @RequestMapping(value = "/board/reply/update", produces="application/text; charset=utf-8")
	public String comment_update(@RequestBody ReplyVO vo) {
		return service.reply_update(vo) ? "성공" : "실패";
	}
	
	//댓글 삭제처리 요청
	@ResponseBody @RequestMapping("/reply/delete/{reply_id}")
	public void comment_delete(@PathVariable int reply_id) {
		//해당 댓글을 DB에서 삭제한 후
		service.reply_delete(reply_id);
	}
	
	//댓글 등록
	@ResponseBody @RequestMapping("/board/reply/insert")
	public boolean reply_insert(ReplyVO vo, HttpSession session) {
		String user_id = (((MemberVO) session.getAttribute("login_info")).getUser_id());
		
		vo.setUser_id(user_id);
		
		return service.replyInsert(vo);
	}
	
	//댓글 목록
	@RequestMapping("/board/reply_list/{board_id}")
	public String replyList(@PathVariable int board_id, Model model) {
		model.addAttribute("list", service.replyList(board_id));
		model.addAttribute("enter", "\r\n");
		model.addAttribute("lf", "\n");
		
		return "board/reply/reply_list";
	}
	
	
	//게시글 삭제처리 요청
	@RequestMapping("/delete.bo")
	public String delete(@RequestParam int board_id) {
		
		service.delete(board_id);
		
		return "redirect:list.bo";
	}
	//첨부파일 다운로드 요청
	@ResponseBody @RequestMapping("/download")
	public File download(@RequestParam int board_id, HttpSession session, HttpServletResponse response) {
		BoardVO vo = service.detail(board_id);
		
		return common.download(vo.getMfilepath(), vo.getFilename(), session, response);
	}
	
	//게시글 수정처리 요청
	@RequestMapping("/board_update.bo")
	public String board_update(BoardVO vo, @RequestParam String attach, @RequestParam MultipartFile file, HttpSession session,HttpServletRequest req) {
		
		
		String ipAddress =req.getRemoteAddr();
		InetAddress inetAddress;
		if(ipAddress.equalsIgnoreCase("0:0:0:0:0:0:0:1")){
			try {
				inetAddress = InetAddress.getLocalHost();
				ipAddress=inetAddress.getHostAddress();
				
			} catch (UnknownHostException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//파일정보를 위해 게시글 정보를 조회해온다.
		BoardVO board = service.detail(vo.getBoard_id());
		String uuid = session.getServletContext().getRealPath("resources")
				+ board.getMfilepath();
		
		
		
		//원래 첨부된 파일이 없었으나 파일을 첨부하는 경우 
		//원래 첨부된 파일이 있었는데 파일을 변경해서 첨부한 경우
		if(file.getSize()>0) {

			String path = common.upload(file, session,ipAddress);
			String[] arr = path.split(",");
			vo.setFilepath(arr[1]);
			vo.setMfilepath(arr[0]);
			vo.setFilename(file.getOriginalFilename());
			//원래 첨부된 파일이 있었다면 해당 파일은 삭제
			File f = new File(uuid);
			if(f.exists()) f.delete();
		}else {
			//원래 첨부된 파일이 있었는데 파일을 삭제하는 경우
			if(attach.equals("n")) {
				File f = new File(uuid);
				if(f.exists()) f.delete();
				vo.setMfilepath("");
				vo.setFilepath("");
				vo.setFilename("");
			}else {
				//원래 첨부된 파일이 있든 없든 원래 파일정보를 그대로 사용하는 경우
				vo.setFilepath(board.getFilepath());
				vo.setMfilepath(board.getMfilepath());
				vo.setFilename(board.getFilename());
			}
		}
		//화면에서 변경입력한 정보를 DB에 변경저장처리한 후
		service.update(vo);
		
		return "redirect:detail.bo?board_id="+ vo.getBoard_id();
	}
	
	//게시글 수정화면 요청
	@RequestMapping("/modify.bo")
	public String modify(@RequestParam int board_id, Model model) {
		
		model.addAttribute("vo", service.detail(board_id));
		
		return "board/board_modify";
	}
	
	//게시판 글 등록 처리 요청
	@RequestMapping("/board_insert.bo")
	public String board_insert(BoardVO vo, HttpSession session, @RequestParam MultipartFile attach_file,HttpServletRequest req) {
		String ipAddress =req.getRemoteAddr();
		InetAddress inetAddress;
		if(ipAddress.equalsIgnoreCase("0:0:0:0:0:0:0:1")){
			try {
				inetAddress = InetAddress.getLocalHost();
				ipAddress=inetAddress.getHostAddress();
			} catch (UnknownHostException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//파일업로드
		if(attach_file.getSize()>0) {
			String path = common.upload(attach_file, session,ipAddress);
			String[] arr = path.split(",");
			vo.setFilepath(arr[1]);
			vo.setMfilepath(arr[0]);
			vo.setFilename(attach_file.getOriginalFilename());


		}
		vo.setUser_id( ((MemberVO)session.getAttribute("login_info")).getUser_id() );
		
		
		service.insert(vo);
		return "redirect:list.bo";
	}
	
	//게시판 입력화면 요청
	@RequestMapping("/insert.bo")
	public String insert() {
		return "board/board_insert";
	}
	
	
	
	// 자유게시판 상세
	@RequestMapping("/detail.bo")
	public String detail(Model model, @RequestParam int board_id, @RequestParam(defaultValue="0") int read,HttpSession session) {
		BoardVO vo = new BoardVO();
		if(read==1) service.read(board_id);
		
		vo.setUser_id( ((MemberVO)session.getAttribute("login_info")).getUser_id());
		vo.setBoard_id(board_id);
		String sym = service.sympathy(vo);
		
		vo = service.detail(board_id);
		vo.setSympathy(sym);
		
		
		model.addAttribute( "vo", vo);
		model.addAttribute("enter", "\r\n");
		
		return "board/board_detail";
	}
	
	@Autowired private BoardPage page;
	
	// 자유게시판 목록
	@RequestMapping("/list.bo")
	public String list(Model model, @RequestParam(defaultValue="1") int curPage,
									@RequestParam(required=false)String search,
									@RequestParam(defaultValue="")String keyword) {
		model.addAttribute("category", "bo");

		page.setCurPage(curPage);
		page.setSearch(keyword.isEmpty() ? "" : search);
		page.setKeyword(keyword);
		
		model.addAttribute("page", service.list(page));
		
		return "board/board_list";
	}


	// 꿀팁게시판 목록
	@RequestMapping("/shoppinglist.bo")
	public String shoppingList() {

		return "shopping/list";
	}
	
	@RequestMapping("/sympathy")
	public String sympathy(BoardVO vo,HttpSession session) {
		vo.setUser_id( ((MemberVO)session.getAttribute("login_info")).getUser_id() );
		
		
		service.change(vo);
		
		
		return "redirect:detail.bo?board_id="+ vo.getBoard_id();
	}
}
