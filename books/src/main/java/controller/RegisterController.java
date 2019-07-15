package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.AlreadyExistingMemberException;
import spring.MemberRegisterService;
import spring.RegisterRequest;


@Controller
public class RegisterController {
	@RequestMapping("/register/step1")
	public String handleStep1() {
		return "register/step1";
	}
@RequestMapping(value="/register/step2", method=RequestMethod.POST)
public String handleStep2(
		@RequestParam(value="agree", defaultValue="false")Boolean agree,
		Model model) {
	if(!agree) {
		return "register/step1";
	}
	model.addAttribute("formData", new RegisterRequest());
	return "register/step2";
}
@RequestMapping(value="/register/step2", method=RequestMethod.GET)
public String handleStep2() {
	return "redirect:/register/step1";
}
private MemberRegisterService memberRegisterService;

public void setMemberRegisterService(
		MemberRegisterService memberRegisterService) {
	this.memberRegisterService = memberRegisterService;
}
@RequestMapping(value="/register/step3", method=RequestMethod.POST)
public String handleStep3(@ModelAttribute("formData")RegisterRequest regreq, Errors errors) {
	new RegisterRequestValidator().validate(regreq, errors);
	if(errors.hasErrors()) {
		return "register/step2";
	}
	try {
			memberRegisterService.regist(regreq);
			return "register/step3";
	}catch(AlreadyExistingMemberException e) {
		errors.rejectValue("email", "duplicate");	
		return "register/step2";
	}
}
}