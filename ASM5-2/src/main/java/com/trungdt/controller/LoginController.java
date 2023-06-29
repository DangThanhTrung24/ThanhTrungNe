package com.trungdt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.trungdt.dao.AccountDAO;
import com.trungdt.entity.Account;
import com.trungdt.utils.CookieService;
import com.trungdt.utils.ParamService;
import com.trungdt.utils.SessionService;




@Controller
@RequestMapping("/home/")
public class LoginController {
	@Autowired
	CookieService cookieService;
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	AccountDAO accDAO;
	
	@GetMapping("login")
	public String login() {
		return "user/login";
	}
	
	@PostMapping("login")
	public String loginPost(Model model) {
		String username = paramService.getString("username", "");
		String password = paramService.getString("password", "");
		boolean remember = paramService.getBoolean("remember", false);
		try {
			Account user = accDAO.findById(username).get();
			if (!user.getPassword().equals(password)) {
				model.addAttribute("message", "Wrong Password!");
			} else {
				sessionService.set("user", user);
				if (remember) {
					cookieService.add("username", user.getUsername(), 10);
					cookieService.add("password", user.getPassword(), 10);
				} else {
					cookieService.remove("username");
					cookieService.remove("password");
				}
				model.addAttribute("message", "Login Successfully");
				return "user/login";
			}
		} catch (Exception e) {
			model.addAttribute("message", "Account is invalid!");
		}
		
		return "user/login";
	}
	
	
}
