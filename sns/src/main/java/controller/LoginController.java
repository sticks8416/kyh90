package controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.AuthInfo;
import spring.AuthService;
import spring.IdPasswordMatchingException;

@Controller
@RequestMapping("/login")
public class LoginController {
	private AuthService authService;
	
	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}
	@RequestMapping(method=RequestMethod.GET)
	public String form(LoginCommand loginCommand) {
		return "login/loginForm";
	}
	@RequestMapping(method=RequestMethod.POST)
	public String submit(LoginCommand loginCommand, Errors errors, HttpSession session) {
		new LoginCommandValidator().validate(loginCommand, errors);
		if(errors.hasErrors()) {
			return "login/loginForm";
		}
		try { AuthInfo authInfo = authService.authenticate(loginCommand.getEmail(),
															loginCommand.getPassword());
				//TODO 세션에 authInfo 저장해야 됨
				session.setAttribute("authInfo", authInfo);
		
				return "login/loginSuccess";
		}catch(IdPasswordMatchingException e){
				errors.reject("IdPasswordMatching");
				return "login/loginForm";
			
		}
	}
}
