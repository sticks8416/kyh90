package member.controller;

import java.io.File;
import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import board.domain.BoardVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


import member.dao.MemberDao;
import member.domain.MemberVO;
import member.request.LoginRequest;
import member.service.MemberService;
@Controller
@SessionAttributes("memberVO")
public class MemberController {
	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
@RequestMapping(value = "/member/main" ,method=RequestMethod.GET)
		public String main(Model model) {
		model.addAttribute("memberList", memberService.list());
			return "/member/main";
		}
	@RequestMapping(value="/member/main", method=RequestMethod.POST)
	public String login(Model model, HttpServletRequest req,HttpServletResponse resp)throws Exception {
	HttpSession session = req.getSession();
	 String writer = req.getParameter("writer");
	 String pass = req.getParameter("pass");
	 System.out.println("wri="+writer);
	 LoginRequest loginRequest = new LoginRequest(writer, pass);
	 MemberVO memberVO = memberService.login(loginRequest);
	 if (memberVO==null) {
		 //회원가입페이지
		 return "redirect:/member/main";
	 } else {
		 //session.setAttribute("writer", writer);
		 //session.setAttribute("pass", pass); 
		 session.setAttribute("member", memberVO);
		 return "/board/list";
	 }
	 
	}
	@RequestMapping(value = "/member/logout" ,method=RequestMethod.GET)
	public String logout(Model model) {
	model.addAttribute("memberList", memberService.list());
		return "/member/main";
	}
	 /*@RequestMapping(value="/member/signup", method=RequestMethod.POST)
	public boolean loginHandle(HttpServletRequest req,HttpServletResponse resp,Object handler)throws Exception  {
		HttpSession session = req.getSession(false);
		
		if(session==null) {
			resp.sendRedirect(req.getContextPath()+"/member/signup");
				return false;
		}
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		
		if(memberVO==null) {
			resp.sendRedirect(req.getContextPath()+"/member/signup");
		}
		return true;
	}*/

}
