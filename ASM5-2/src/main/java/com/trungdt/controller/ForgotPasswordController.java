package com.trungdt.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.trungdt.dao.AccountDAO;
import com.trungdt.entity.Account;
import com.trungdt.service.impl.MailerServiceImpl;
import com.trungdt.utils.ParamService;

import net.bytebuddy.utility.RandomString;

@Controller
@RequestMapping("/home/")
public class ForgotPasswordController {
	
	@Autowired
	AccountDAO dao;
	@Autowired
	ParamService paramService;
	@Autowired
	MailerServiceImpl mailer;
;

	@RequestMapping("forgot-password")
	public String index() {
		return "user/forgot-password";
	}
	
	@PostMapping("forgot-password")
	public String change(Model model) {
		String email = paramService.getString("email", "");
		String username = paramService.getString("username", "");
		String subject = "Send your Password!";
		String body = "Your Password: ";
		String password;
		String randomPassword = RandomString.make(6);
		
		try {	
			Account user = dao.findById(username).get();
				if(!user.getEmail().equals(email)) {
					model.addAttribute("message", "Wrong Email!");
				}else {
					user.setPassword(randomPassword);
					dao.save(user);
					mailer.send(email, subject, body+randomPassword);
					model.addAttribute("message", "Please check your Email!");
				}
		} catch (Exception e) {
			model.addAttribute("message", "Account invalid!");
		}
		return "user/forgot-password";
	}
}
