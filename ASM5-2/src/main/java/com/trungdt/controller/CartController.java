package com.trungdt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.trungdt.service.ShoppingCartService;
import com.trungdt.utils.ParamService;

@Controller
@RequestMapping("/home/")
public class CartController {

	@Autowired
	ParamService paramService;
	@Autowired
	ShoppingCartService shoppingCartService;
	
	
	
	@RequestMapping("cart")
	public String index(Model model) {
		model.addAttribute("cart", shoppingCartService);
		return "user/cart";
	}
	
	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable("id") Integer id) {
		shoppingCartService.add(id);
		return "redirect:/home/cart";
	}
	
	@RequestMapping("/cart/sub/{id}")
	public String sub(@PathVariable("id") Integer id) {
		shoppingCartService.sub(id);
		return "redirect:/home/cart";
	}

	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		shoppingCartService.remove(id);
		return "redirect:/home/cart";
	}

	@RequestMapping("/cart/update")
	public String update() {
		Integer id = paramService.getInt("id", 0);
		int qty = paramService.getInt("qty", 0);
		shoppingCartService.update(id, qty);
		return "redirect:/home/cart";
	}

	@RequestMapping("/cart/clear")
	public String clear() {
		shoppingCartService.clear();
		return "redirect:/home/cart";
	}
}
