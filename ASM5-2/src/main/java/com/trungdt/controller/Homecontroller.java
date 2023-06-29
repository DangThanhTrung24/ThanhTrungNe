package com.trungdt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.trungdt.dao.OrderDetailDAO;
import com.trungdt.dao.ProductDAO;
import com.trungdt.entity.Top10;
import com.trungdt.utils.CookieService;
import com.trungdt.utils.ParamService;
import com.trungdt.utils.SessionService;





@Controller
@RequestMapping("/home/")
public class Homecontroller {
    
	@Autowired
	CookieService cookieService;
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService; 

	@Autowired
	ProductDAO proDAO;
	
	@Autowired
	OrderDetailDAO orderDetailDAO;
	

    
    @RequestMapping("index")
    public String home(Model model) {
    	Pageable pageable = PageRequest.of(0, 10); 
		Page<Top10> topList = orderDetailDAO.getTop10(pageable);
		model.addAttribute("topList", topList);
        return "user/index"; // Return the name of the view file (e.g., home.jsp)
    }
    
    @RequestMapping("contact")
    public String contact(Model model) {
    	
        return "user/contact"; // Return the name of the view file (e.g., home.jsp)
    }
    @RequestMapping("about")
    public String about(Model model) {
    	
        return "user/about"; // Return the name of the view file (e.g., home.jsp)
    }
    
    @RequestMapping("myprofile")
    public String myProfile(Model model) {
    	
        return "user/myprofile"; // Return the name of the view file (e.g., home.jsp)
    }
    
   
   
}