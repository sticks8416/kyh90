package friend.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import friend.domain.FriendVO;
import friend.service.FriendService;
import member.domain.MemberVO;




@Controller
public class FriendController {
	FriendService friendService;

	public void setFriendService(FriendService friendService) {
		this.friendService = friendService;
	}
	
	@RequestMapping(value="/friendRequest/{email:.+}", method=RequestMethod.GET)
	public String list(FriendVO friendVO,@PathVariable String email, Model model,HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		if(memberVO ==null) {
			return "redirect:/member/main";
		}
		System.out.println("email = "+email);
		friendVO.setEmail1(memberVO.getEmail());
		friendVO.setEmail2(email);
		friendVO.setRelationship("pending");
		if(friendService.checkFriend(friendVO) != 0) {
			return "redirect:/board/list";
		}
		friendService.add(friendVO);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/requestList", method=RequestMethod.GET)
	public String requestList(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		if(memberVO ==null) {
			return "redirect:/member/main";
		}
		System.out.println(friendService.pendingList(memberVO.getEmail()));
		model.addAttribute("pendingList",friendService.pendingList(memberVO.getEmail()));
		return "/board/requestList";
	}
	
	@RequestMapping(value="/pendingAccept/{email:.+}", method=RequestMethod.GET)
	public String pendingAccept(FriendVO friendVO, HttpSession session, Model model, @PathVariable String email) {
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		if(memberVO ==null) {
			return "redirect:/member/main";
		}
		friendVO.setEmail1(memberVO.getEmail());
		friendVO.setEmail2(email);
		friendVO.setRelationship("friend");
		friendService.add(friendVO);
		friendVO.setEmail1(email);
		friendVO.setEmail2(memberVO.getEmail());
		friendService.update(friendVO);
		//session.setAttribute("pending", (int)session.getAttribute("pending")-1);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/pendingReject/{email:.+}", method=RequestMethod.GET)
	public String pendingReject(FriendVO friendVO, HttpSession session, Model model, @PathVariable String email) {
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		if(memberVO ==null) {
			return "redirect:/member/main";
		}
		friendVO.setEmail1(memberVO.getEmail());
		friendVO.setEmail2(email);
		friendVO.setRelationship("rejected");
		friendService.add(friendVO);
		friendVO.setEmail1(email);
		friendVO.setEmail2(memberVO.getEmail());
		friendService.update(friendVO);
		//session.setAttribute("pending", (int)session.getAttribute("pending")-1);
		return "redirect:/board/list";
	}

	@RequestMapping(value="/chatRequest/{email:.+}")
	public String chat(HttpSession session, @PathVariable String email, Model model) {
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		if(memberVO == null) {
			return "redirect:/member/main";
		}
		String email1 = memberVO.getEmail();
		System.out.println("myId = "+email1);
		System.out.println("friendId = "+email);
		session.setAttribute("myId", email1);
		session.setAttribute("friendId", email);
		return "/board/chat";
	}
}
