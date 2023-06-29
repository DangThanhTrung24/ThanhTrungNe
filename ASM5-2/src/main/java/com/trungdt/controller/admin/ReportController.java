package com.trungdt.controller.admin;

import java.net.http.HttpRequest;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.trungdt.dao.AccountDAO;
import com.trungdt.dao.OrderDAO;
import com.trungdt.dao.OrderDetailDAO;
import com.trungdt.entity.Order;
import com.trungdt.entity.Top10;
import com.trungdt.entity.TopCustomer;
import com.trungdt.utils.ParamService;
import com.trungdt.utils.SessionService;



@RequestMapping("admin")
@Controller
public class ReportController {

	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	AccountDAO accDAO;	
	
	@Autowired
	OrderDAO orderDAO;
	
	@Autowired
	OrderDetailDAO orderDetailDAO;
	
	@RequestMapping("bestsaler")
	public String bestSaler(Model model) {
		Pageable pageable = PageRequest.of(0, 10000); 
		Page<Top10> topList = orderDetailDAO.getTop10(pageable);
		
		model.addAttribute("topList", topList);
		return ("admin/bestsaler");
	}
	
	@RequestMapping("topcustomer")
	public String topCustomer(Model model) {
		List<TopCustomer> topCustomer = accDAO.getTopAccount();
		model.addAttribute("topCustomer", topCustomer);
		return ("admin/topcustomer");
	}
	

	
	@RequestMapping("reportorderbydate")
	public String reportOrderByDate(Model model) {
		return "admin/reportorderbydate";
	}
	
	
	@PostMapping("reportorderbydate")
	public String reportByDate(Model model, @RequestParam("p") Optional<Integer> p) {
		Date firstDate = paramService.getDate("firstDate", "MM-dd-yyyy");
		Date lastDate = paramService.getDate("lastDate", "MM-dd-yyyy");
		sessionService.set("firstDate", firstDate);
		sessionService.set("lastDate", lastDate);
		Pageable pageable = PageRequest.of(p.orElse(0), 1000);
		Page<Order> page = orderDAO.findOrderByDate(firstDate, lastDate, pageable);
		model.addAttribute("page", page);
		return "admin/reportorderbydate";
	}
	
	
	
	
}
