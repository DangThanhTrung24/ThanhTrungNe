package com.trungdt.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.trungdt.dao.OrderDAO;
import com.trungdt.dao.OrderDetailDAO;
import com.trungdt.entity.Order;
import com.trungdt.entity.OrderDetail;




@RequestMapping("admin")
@Controller
public class OrderController {
	@Autowired
	OrderDetailDAO orderDetailDAO;
	
	@Autowired
	OrderDAO dao;
	
	@RequestMapping("/order")
	public String paginate(Model model,	@RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 8);
		Page<Order> page = dao.findAll(pageable);
		
		int currentPage =1;
		int totalItems = page.getNumberOfElements();
		int totalPages = page.getTotalPages();
		
		model.addAttribute("totalItems", totalItems);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", currentPage);
		
		model.addAttribute("page", page);
		return "admin/orderlist";
	}
	

	@RequestMapping("/ordercontrol")
	public String control(Model model) {
		Order item = new Order();
		model.addAttribute("item", item);
		return "admin/ordercontrol";
	}
	
	
	@RequestMapping("/order/edit/{id}")
	public String edit(Model model, @PathVariable("id") long id) {
		Order item = dao.findById(id).get();
		model.addAttribute("item", item);
		List<Order> items = dao.findAll();
		model.addAttribute("items", items);
		return "admin/orderControl";
	}
	
	@RequestMapping("/order/create")
	public String create(Model model, Order item) {
		dao.save(item);
		model.addAttribute("message", "Insert successfully");
		return "redirect:/admin/ordercontrol";
	}
	
	@RequestMapping("/order/delete/{id}")
	public String create(@PathVariable("id") long id) {
		dao.deleteById(id);
		return "redirect:/admin/order";
	}
	
	@RequestMapping("/order/update")
	public String update(Model model, Order item) {
		dao.save(item);
		model.addAttribute("message", "Update successfully");
		return "redirect:/admin/order/edit/" + item.getId();
	}
	
	
	
	
	
	
	@RequestMapping("orderdetail")
	public String locBrand(Model model, @RequestParam("id") long id, @RequestParam("p") Optional<Integer> p) {
		Order order = new Order();
		List<Order> orders = dao.findAll();
		for (Order ord : orders) {
			if (ord.getId() == id) {
				order = ord;
				break;
			}
		}	
		model.addAttribute("ord", order);
		
		Pageable pageable = PageRequest.of(p.orElse(0), 999);
		Page<OrderDetail> page = orderDetailDAO.findByOrder(id, pageable);
		int currentPage =1;
		int totalItems = page.getNumberOfElements();
		int totalPages = page.getTotalPages();
		model.addAttribute("totalItems", totalItems);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("page", page);
		return "admin/orderdetaillist";
	}
	
}
