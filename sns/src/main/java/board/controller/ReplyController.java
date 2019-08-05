package board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import board.domain.ReplyVO;
import board.service.ReplyService;
import member.domain.MemberVO;


@Controller
public class ReplyController {
	ReplyService replyService;

	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/reply",  produces = "application/json")
	public String add(@RequestParam("num") int num, @RequestParam("comments") String comments, HttpServletRequest request, HttpSession session) {
		ReplyVO replyVO = new ReplyVO();
		JSONObject obj = new JSONObject();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		if(memberVO ==null) {
			obj.put("msg", "Login please!");
			return obj.toJSONString();
		}
		if(comments == null | comments.equals("")) {
			obj.put("msg", "Need something comments :)");
			return obj.toJSONString();
		}
		replyVO.setNum(num);
		replyVO.setEmail(memberVO.getEmail());
		replyVO.setComments(comments);
		replyService.addReply(replyVO);
		obj.put("success", "Successfully commented!");
		return obj.toJSONString();
	}
	
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/replyDelete", method=RequestMethod.POST, produces = "application/json")
	public String delete(ReplyVO replyVO , @RequestParam("replyNum") int replyNum, HttpServletRequest request, HttpSession session) {
		JSONObject obj = new JSONObject();

		replyService.deleteReply(replyNum);
		obj.put("success", "Successfully deleted!");
		return obj.toJSONString();
	}
}
