package com.trungdt.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.trungdt.entity.Category;



public interface CategoryDAO extends JpaRepository<Category,String>{
}
