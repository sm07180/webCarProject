package com.hanul.car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import connectcnt.ConnectCntService;

@Controller
public class VisitorController{
	
	@Autowired
	private ConnectCntService service;
	
	
	
	@ResponseBody 
	@RequestMapping("/visitor/insertCnt.do")
    public String sessionCreated(HttpSession session,	HttpServletRequest req) {
        
        try {
        	if(null == session.getAttribute("visitorSession")){
        		session.setAttribute("visitorSession", "visitorSession");
        		service.setTotalCnt(); // 들어오면 바로 인서트
        	}
        } catch (Exception e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
        }
        return "";
    }
}


