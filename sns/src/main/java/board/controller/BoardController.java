package board.controller;

import java.io.File;
import java.io.IOException;import java.io.Writer;
import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.style.ValueStyler;
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
import org.springframework.web.multipart.MultipartFile;

import board.domain.BoardVO;
import board.service.BoardService;
import member.domain.MemberVO;
import member.service.MemberService;

@Controller
@SessionAttributes("boardVO")
public class BoardController {
	private BoardService boardService;
	
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}

	@RequestMapping(value="/board/list" , method=RequestMethod.GET)
	public String list(Model model,HttpSession session, HttpServletRequest req) {
		model.addAttribute("boardList", boardService.list());
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		if(memberVO==null) {
			return "redirect:/member/main";
		}
		List<MemberVO> friendList = new ArrayList<MemberVO>();
		List<String> emailList = new ArrayList<String>();
		emailList = boardService.searchFriend(memberVO.getEmail());
		System.out.println(emailList);
		for(String email: emailList) {
			friendList.add(boardService.readProfile(email));
			System.out.println(friendList);
		}
		model.addAttribute("friendList",friendList);
		model.addAttribute("emailList", emailList);
		System.out.println(emailList);
		return "/board/list";	
	}
	@RequestMapping(value="/board/list", method=RequestMethod.POST)
	public String list(@RequestParam(value="search",required=true) String Search,BoardVO boardVO, Model model ,HttpSession session, HttpServletRequest req) {
		System.out.println(Search);
		MemberVO memberVO = (MemberVO) session.getAttribute("member"); 
		
		model.addAttribute("searchList",boardService.memberSearch(Search));

		return "/board/read";	
	}
	@RequestMapping(value="/board/read" , method=RequestMethod.GET)
	public String memberserch(@RequestParam(value="search",required=true) String Search, Model model,HttpSession session, HttpServletRequest req, MemberVO memberVO) {
		System.out.println(Search);
		memberVO = (MemberVO) session.getAttribute("member");
		System.out.println(memberVO.getName()); 
		
		model.addAttribute("boardList", boardService.list());
		model.addAttribute("searchList",boardService.memberSearch(Search));	
		return "/board/read";	
	}
	//새 글 작성을 위한 요청을 처리
	@RequestMapping(value="/board/write", method=RequestMethod.GET)
	public String write(Model model,HttpServletRequest req ,HttpServletResponse resp) {
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		
		return "/board/write";
		
	}
	//새 글 등록을 위한 요청을 처리
	@RequestMapping(value="/board/write", method=RequestMethod.POST)
	public String write(@Valid Model model,HttpSession session,BoardVO boardVO, HttpServletRequest req,BindingResult bindingResult, @RequestParam("filename")MultipartFile uploadfile)throws IOException {
			if(bindingResult.hasErrors()) {
				return "/board/write";
			}
			model.addAttribute("boardVO", new BoardVO());
			
			MemberVO memberVO = (MemberVO) session.getAttribute("member");
			System.out.println("session : "+memberVO);
			System.out.println(memberVO.getEmail());
			System.out.println(memberVO.getPassword());
			boardVO.setImages(uploadfile.getOriginalFilename());
			String path = req.getSession().getServletContext().getRealPath("upload");
			System.out.println(path);
			uploadfile.transferTo(new File(path, uploadfile.getOriginalFilename()));
			boardVO.setEmail(memberVO.getEmail());
			boardVO.setWriter(memberVO.getName());
			boardVO.setPassword(memberVO.getPassword());
			memberVO.getName();
			memberVO.getPassword();
			System.out.println(boardVO.getEmail());
			System.out.println(boardVO.getNum());
			System.out.println(boardVO.getWriter());
			System.out.println(boardVO.getImages());
			System.out.println(boardVO.getPassword());
			System.out.println(boardVO.getContent());
			boardService.write(boardVO);
			return "redirect:/board/list";
	}
	////글 수정 창
	//input창에 readonly 라고 걸어두면 수정안됨
	@RequestMapping(value="/board/edit/{num}", method=RequestMethod.GET)
	public String edit(@PathVariable int num,HttpServletRequest req , Model model) {
		HttpSession session = req.getSession();
		BoardVO boardVO = boardService.read(num);
		model.addAttribute("boardVO2", boardVO);
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		System.out.println(boardVO.getWriter());
		System.out.println(boardVO.getTitle());
		System.out.println(boardVO.getContent());
		System.out.println(boardVO.getImages());
		
		return "/board/edit";
	}
	
	@RequestMapping(value="/board/edit/{num}", method=RequestMethod.POST)
	public String edit(
			@Valid @ModelAttribute("boardVO2") BoardVO boardVO,
			BindingResult result,
			HttpSession session, SessionStatus sessionStatus,
			Model model)throws IOException  {
		
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		System.out.println(memberVO.getName());
		boardVO.setWriter(memberVO.getName());
		boardVO.setEmail(memberVO.getEmail());
		System.out.println(boardVO.getWriter());
		System.out.println(boardVO.getEmail());
		System.out.println(boardVO.getTitle());
		System.out.println(boardVO.getContent());
		System.out.println(boardVO.getImages());
			if(result.hasErrors()) {
				System.out.println("경로 1");
			List<obeject> list ();
					System.out.println();
				return "/board/edit";
			} 	
			else {
					if(memberVO.getName()!=null) {
						boardService.edit(boardVO);
						sessionStatus.setComplete();
						return "/board/list";
					}
			}
			System.out.println("경로2");
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "/board/edit";
	}
	//글 삭제 요청을 처리할 메서드
	@RequestMapping(value="/board/delete/{num}", method=RequestMethod.GET)
	public String delete(@PathVariable int num, Model model) {
		model.addAttribute("num", num);
		return "/board/delete";
	}
	@RequestMapping(value="/board/delete", method=RequestMethod.POST)
	public String delete(int num, String email,HttpSession session, String pwd, Model model) {
		int rowCount;
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		BoardVO boardVO = new BoardVO();
		boardVO.setNum(num);
		boardVO.setEmail(memberVO.getEmail());
		System.out.println(boardVO.getEmail());
		System.out.println(boardVO.getNum());
		rowCount = boardService.delete(boardVO);
		
		if(rowCount == 0) {
			model.addAttribute("num", num);
			model.addAttribute("msg", "게시물 작성자만 삭제 가능합니다.");
			return "/board/delete";
		}
		else {
			return "redirect:/board/list";
		}
	}
	//내정보 수정					'/member/editProfile/${member.email}'
		@RequestMapping(value="/member/editProfile/{email}", method=RequestMethod.GET)
		public String editProfile(@PathVariable String email,HttpServletRequest req , Model model) {
			HttpSession session = req.getSession();
			MemberVO memberVO = (MemberVO) session.getAttribute("member");
			
			memberVO = boardService.readProfile(email);
			memberVO.getEmail();
			memberVO.getName();
			memberVO.getPassword();
			model.addAttribute("memberVO2", memberVO);
			System.out.println(memberVO.getEmail());
			System.out.println(memberVO.getName());
			System.out.println(memberVO.getPassword());
			
			
			return "/board/editProfile";
		}
		@RequestMapping(value="/member/editProfile/{profile}", method=RequestMethod.POST)
		public String editProfile(Model model,HttpSession session) {
			MemberVO memberVO = (MemberVO) session.getAttribute("member");
			model.addAttribute("memberVO2", memberVO);
			boardService.updateProfile(memberVO);
			System.out.println(memberVO.getName());
			System.out.println(memberVO.getPassword());
			System.out.println(memberVO.getEmail());
			return "redirect:/board/list";
		}
		
		
}	