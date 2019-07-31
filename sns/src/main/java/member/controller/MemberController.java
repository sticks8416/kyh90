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
import board.service.BoardService;

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

	// 로그인 버튼 submit시에 피드/메인창으로 넘겼을 시 보드.list 쿼리 실행하면서 들고오기 위해


	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping(value = "/member/main", method = RequestMethod.GET)
	public String main(Model model) {
		return "/member/main";
	}

	@RequestMapping(value = "/member/main", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest req, HttpSession session) throws Exception {
		String email = req.getParameter("email");
		String pass = req.getParameter("password");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("password", pass);
		MemberVO memberVO = memberService.memberLogin(map);
		if (memberVO == null) {
			return "redirect:/member/main";
		} else {
			session.setAttribute("member", memberVO);
			return "redirect:/board/list";
		}

	}

	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest req, HttpServletResponse resp) throws Exception {

		HttpSession session = req.getSession();
		session.invalidate();
		System.out.println("해제완료!");

		return "/member/main";
	}

	/*
	 * @RequestMapping(value = "/member/serchmember", method = RequestMethod.GET) //
	 * get방식으로 하나 더 만들어야 하는가 public String memberlist(Model model,
	 * HttpServletRequest req, HttpServletResponse resp) throws Exception {
	 * model.addAttribute("memberserch", memberService.memberserch());
	 * model.addAttribute("memberList", memberService.memberlist());
	 * 
	 * 
	 * 
	 * model.addAttribute("memberSerch", memberService.memberSerch());
	 * 
	 * memberService.memberserch(memberVO); return "/board/read"; }
	 */
	/*
	 * @RequestMapping(value = "/member/serchmember", method = RequestMethod.POST)
	 * //get방식으로 하나 더 만들어야 하는가 public String memberSerch(Model model,
	 * HttpServletRequest req, HttpServletResponse resp) throws Exception {
	 * model.addAttribute("memberserch", memberService.memberserch());
	 * model.addAttribute("memberList", memberService.memberlist());
	 * model.addAttribute("memberSerch", memberService.memberSerch());
	 * 
	 * memberService.memberserch(memberVO); return "/board/read"; }
	 */

	/*
	 * @RequestMapping(value = "/member/serchmember" ,method=RequestMethod.POST)
	 * public String memberserch(Model model, HttpServletRequest
	 * req,HttpServletResponse resp) throws Exception{
	 * model.addAttribute("memberserch", memberService.memberserch());
	 * model.addAttribute("memberSerch", memberService.memberserch());
	 * 
	 * memberService.memberserch(memberVO); return "/board/read"; }
	 */

	/*
	 * @RequestMapping(value="/member/signup", method=RequestMethod.POST) public
	 * boolean loginHandle(HttpServletRequest req,HttpServletResponse resp,Object
	 * handler)throws Exception { HttpSession session = req.getSession(false);
	 * 
	 * if(session==null) { resp.sendRedirect(req.getContextPath()+"/member/signup");
	 * return false; }
	 * 
	 * MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
	 * 
	 * if(memberVO==null) {
	 * resp.sendRedirect(req.getContextPath()+"/member/signup"); } return true; }
	 */

}
