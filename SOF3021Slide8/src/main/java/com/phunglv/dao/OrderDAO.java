package com.phunglv.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.phunglv.entity.Order;



public interface OrderDAO extends JpaRepository<Order, Long>{
}
