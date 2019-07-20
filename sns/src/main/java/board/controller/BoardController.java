package board.controller;

import java.io.File;
import java.io.IOException;import java.io.Writer;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;

import board.domain.BoardVO;
import board.service.BoardService;
import member.domain.MemberVO;

@Controller
@SessionAttributes("boardVO")
public class BoardController {
	private BoardService boardService;
	
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@RequestMapping(value="/board/list")
	public String list(Model model, HttpServletRequest req) {
		model.addAttribute("boardList", boardService.list());
		req.getAttribute("member");
		return "/board/list";	
	}
	@RequestMapping(value="/board/read/{seq}")
	public String read(Model model, @PathVariable int seq) {
		model.addAttribute("boardVO", boardService.read(seq));
		return "/board/read";
	}
	//새 글 작성을 위한 요청을 처리
	@RequestMapping(value="/board/write", method=RequestMethod.GET)
	public String write(Model model,HttpServletRequest req) {
		req.getAttribute("member");
		model.addAttribute("boardVO", new BoardVO());
		return "/board/write";
		
	}
	//새 글 등록을 위한 요청을 처리
	@RequestMapping(value="/board/write", method=RequestMethod.POST)
	public String write(@Valid BoardVO boardVO, HttpServletRequest req,BindingResult bindingResult, @RequestParam("filename")MultipartFile uploadfile)throws IOException {
			if(bindingResult.hasErrors()) {
				return "/board/write";
			}
			
			System.out.println();
			boardVO.setImages(uploadfile.getOriginalFilename());
			req.getAttribute("member");
			String path = "C:\\Users\\Yeonheung\\springwork\\sns\\src\\main\\webapp\\images";
			uploadfile.transferTo(new File(path, uploadfile.getOriginalFilename()));
			
			boardService.write(boardVO);
			return "redirect:/board/list";
	}
	@RequestMapping(value="/board/edit/{num}", method=RequestMethod.GET)
	public String edit(@PathVariable int num, Model model) {
		BoardVO boardVO = boardService.read(num);
		model.addAttribute("boardVO", boardVO);
		return "/board/edit";
	}
	
	@RequestMapping(value="/board/edit/{num}", method=RequestMethod.POST)
	public String edit(
			@Valid @ModelAttribute BoardVO boardVO,
			BindingResult result,
			String pwd, SessionStatus sessionStatus,
			Model model) {
			if(result.hasErrors()) {
				return "/board/edit";
			}
			else {
					if(boardVO.getPass() == pwd) {
						boardService.edit(boardVO);
						sessionStatus.setComplete();
						return "redirect:/board/list";
					}
			}
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
	public String delete(int num, String pwd, Model model) {
		int rowCount;
		BoardVO boardVO = new BoardVO();
		boardVO.setNum(num);
		boardVO.setPass(pwd);
		
		rowCount = boardService.delete(boardVO);
		
		if(rowCount == 0) {
			model.addAttribute("num", num);
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "/board/delete";
		}
		else {
			return "redirect:/board/list";
		}
	}
}	