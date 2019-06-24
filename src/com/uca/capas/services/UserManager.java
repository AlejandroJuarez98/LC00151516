package com.uca.capas.services;

import org.springframework.stereotype.Service;

import com.uca.capas.domain.Branch;
import com.uca.capas.repositories.UserRepositoryInterface;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

@Service
public class UserManager {
	@Autowired
	private UserRepositoryInterface userRepositoryInterface;
	
	public boolean login (String username, String password) {
		boolean flag = false;
		
		try {
			if (this.userRepositoryInterface.login(username, password) != null) {
				flag = true;
			}
		} catch(Exception error) {
			error.printStackTrace();
		}
		
		return flag;
	}
}
