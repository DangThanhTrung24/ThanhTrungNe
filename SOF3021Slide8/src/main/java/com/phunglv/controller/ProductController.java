package com.phunglv.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.phunglv.dao.ProductDAO;
import com.phunglv.entity.Product;
import com.phunglv.entity.Report;
import com.phunglv.service.SessionService;

@Controller
public class ProductController {
	@Autowired
	ProductDAO dao;
	
	@Autowired
	SessionService session;
	
	@RequestMapping("/product/all")
	public String sort(Model model) {		
		List<Product> items = dao.findAll(); // truy van tat ca				
		model.addAttribute("items", items);
		return "product/sort";		
	}
	
	@RequestMapping("/product/list")
	public String list(Model model, @RequestParam("id")String id) {		
		//List<Product> items = dao.findByCategoryId();
		System.out.print("id: "+id);
		if(id=="") {
			List<Product> items = dao.findAll();
			model.addAttribute("items", items);
		}else {
			List<Product> items = dao.findByCategoryId(id);	
			model.addAttribute("items", items);
		}		
		return "product/sort";	
	}
	
	//------------------------------
	@RequestMapping("/product/price")
	public String price(Model model, @RequestParam("min")double min,
			@RequestParam("max")double max) {							
		//List<Product> items = dao.findByPrice(min, max);
		List<Product> items = dao.findByPriceBetween(min, max); // DSL
		model.addAttribute("items", items);			
		return "product/sort";	
	}
	
	@RequestMapping("/product/name")
	public String name(Model model, @RequestParam("name")String name) {					
		//List<Product> items = dao.findByKeyword("%"+name+"%");
		List<Product> items = dao.findByKeyword2("%"+name+"%");
		model.addAttribute("items", items);			
		return "product/sort";	
	}
	/*
	@RequestMapping("/product/list")
	public String list(Model model) {		
		//List<Product> list1 = dao.findByPrice1(30);	
		//model.addAttribute("items", list1);	
		//return "product/sort";
		
		List<Product> list2 = dao.findByPrice2(30, Sort.by(Direction.ASC,"price"));	
		model.addAttribute("items", list2);	
		return "product/sort";
	}
	*/
	@RequestMapping("/product/sort")
	public String sort(Model model, 
			@RequestParam("field") Optional<String> field) {
		Sort sort = Sort.by(Direction.DESC, field.orElse("price"));
		model.addAttribute("field", field.orElse("price").toUpperCase());
		List<Product> items = dao.findAll(sort);
		model.addAttribute("items", items);
		return "product/sort";
	}
	
	
	
	//--------------------------------------------------
	@RequestMapping("/product/page")
	public String paginate(Model model,
			@RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Product> page = dao.findAll(pageable);
		model.addAttribute("page", page);
		return "product/page";
	}
	
	
	
	@RequestMapping("/product/search")
	public String search(Model model, 
			@RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max) {
		double minPrice = min.orElse(Double.MIN_VALUE);
		double maxPrice = max.orElse(Double.MAX_VALUE);
		//List<Product> items = dao.findByPrice(minPrice, maxPrice);
		List<Product> items = dao.findByPriceBetween(minPrice, maxPrice);
		model.addAttribute("items", items);
		return "product/search";
	}
	//-----------------------------------------
	@RequestMapping("/product/search-and-page")
	public String searchAndPage(Model model, 
			@RequestParam("keywords") Optional<String> kw,
			@RequestParam("p") Optional<Integer> p) {
		String keywords = kw.orElse(session.get("keywords", ""));
		session.set("keywords", keywords);
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Product> page = dao.findByKeywords("%"+keywords+"%", pageable);
		//Page<Product> page = dao.findAllByNameLike("%"+keywords+"%", pageable);
		model.addAttribute("page", page);
		return "product/search-and-page";
	}
	
	
	
	@RequestMapping("/report/inventory-by-category")
	public String inventory(Model model) {
		List<Report> items = dao.getInventoryByCategory();
		model.addAttribute("items", items);
		return "report/inventory-by-category";
	}
}
