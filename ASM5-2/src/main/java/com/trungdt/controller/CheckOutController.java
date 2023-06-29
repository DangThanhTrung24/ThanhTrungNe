package com.trungdt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.trungdt.dao.OrderDetailDAO;
import com.trungdt.entity.Account;
import com.trungdt.entity.Order;
import com.trungdt.entity.OrderDetail;
import com.trungdt.service.CheckOutService;
import com.trungdt.service.ShoppingCartService;
import com.trungdt.utils.ParamService;
import com.trungdt.utils.SessionService;



@Controller
@RequestMapping("home")
public class CheckOutController {
	@Autowired
	ShoppingCartService shoppingCartService;
	
	@Autowired
	SessionService sessionService;
	
	@Autowired
	ParamService paramService;
	
	@Autowired
	CheckOutService checkOutService;
	
	@Autowired
	OrderDetailDAO orderDetailDAO;
	
	@RequestMapping("checkout")
	public String checkout(Model model) {
		model.addAttribute("cart", shoppingCartService);
		return "user/checkout";
	}
	
	@RequestMapping("order-detail")
	public String orderdetail(Model model) {
		String address = paramService.getString("address", "");
		if(!shoppingCartService.getItems().isEmpty()) {
			if(address.equals("")) {
				return "redirect: home/checkout";
			}
			Account user = sessionService.get("user");
			Order order = checkOutService.order(user, address);
			List<OrderDetail> items = orderDetailDAO.findByOrderID(order.getId());
			model.addAttribute("order", order);
			model.addAttribute("items",items);
			return "user/order-detail";
		}
		return "redirect:/home/index";
	}
}
