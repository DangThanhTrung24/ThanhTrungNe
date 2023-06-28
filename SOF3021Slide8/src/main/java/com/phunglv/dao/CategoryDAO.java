package com.phunglv.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.phunglv.entity.Category;



public interface CategoryDAO extends JpaRepository<Category, String>{
}
