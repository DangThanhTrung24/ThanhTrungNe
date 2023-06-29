package com.trungdt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.trungdt.dao.OrderDAO;
import com.trungdt.dao.OrderDetailDAO;
import com.trungdt.entity.Account;
import com.trungdt.entity.CartItem;
import com.trungdt.entity.Order;
import com.trungdt.entity.OrderDetail;
import com.trungdt.entity.Product;



@Service
public class CheckOutService {

	
	@Autowired
	ShoppingCartService shoppingCartService;
	
	@Autowired
	OrderDAO orderDAO;
	
	@Autowired
	OrderDetailDAO orderDetailDAO;
	
	public Order order (Account user, String address) {
		Order order = new Order();
		order.setAccount(user);
		order.setAddress(address);
		orderDAO.save(order);
		for(CartItem item:shoppingCartService.getItems()) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrder(order);
			orderDetail.setPrice(item.getPrice());
			orderDetail.setQuantity(item.getQty());
			
			Product product = new Product();
			product.setId(item.getId());
			product.setName(item.getName());
			orderDetail.setProduct(product);
			orderDetailDAO.save(orderDetail);
		}
		shoppingCartService.clear();
		return order;
	}
}
