package com.trungdt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.trungdt.dao.ProductDAO;
import com.trungdt.entity.Product;
import com.trungdt.utils.CookieService;
import com.trungdt.utils.ParamService;
import com.trungdt.utils.SessionService;


@Controller
@RequestMapping("/home/")
public class ProductDetailController {
	@Autowired
	CookieService cookieService;
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	ProductDAO proDAO;
	
	@RequestMapping("product")
	public String index() {
		return "user/product-detail";
	}
	
	@RequestMapping(value = "product/detail/{id}")
	public String view(ModelMap model, @PathVariable("id") int id) {
		Product product = new Product();
		List<Product> products = proDAO.findAll();
		for (Product pr : products) {
			if (pr.getId() == id) {
				product = pr;
				break;
			}
		}
		model.addAttribute("products", products);
		model.addAttribute("pr", product);
		return "user/product-detail";
	}
}
