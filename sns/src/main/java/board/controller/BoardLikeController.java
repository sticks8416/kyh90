package board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import board.domain.BoardLikeVO;
import board.service.BoardLikeService;
import member.domain.MemberVO;



@Controller
public class BoardLikeController {
	BoardLikeService boardLikeService;
	
	public void setBoardLikeService(BoardLikeService boardLikeService) {
		this.boardLikeService = boardLikeService;
	}
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/boardLike", method=RequestMethod.POST, produces = "application/json")
	public String boardLike(BoardLikeVO like,Model model, @RequestParam("seq") int seq, HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		JSONObject obj = new JSONObject();
		if(memberVO ==null) {
			obj.put("msg", "Login Please!");
			return obj.toJSONString();
		}
		like.setId(memberVO.getEmail());
		like.setSeq(seq);
		int check = boardLikeService.searchId(like);

		if(check == 0) {
			boardLikeService.addLike(like);
		}else {
			boardLikeService.deleteLike(like);
		}
		boardLikeService.updateCount(seq);

		obj.put("check", check);
		obj.put("likes", boardLikeService.countLike(seq));
		
			return obj.toJSONString();
	}
}
