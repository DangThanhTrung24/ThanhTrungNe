package com.phunglv.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.phunglv.entity.Account;



public interface AccountDAO extends JpaRepository<Account, String>{
	
}
