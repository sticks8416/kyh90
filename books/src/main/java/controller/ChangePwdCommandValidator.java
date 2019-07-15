package controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class ChangePwdCommandValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> arg0) {
		return ChangePwdCommand.class.isAssignableFrom(arg0);
	}
	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "currentPassword", "required");
		ValidationUtils.rejectIfEmpty(errors, "newPassword", "required");
	}
}
