package com.uca.capas.repositories;

import org.springframework.dao.DataAccessException;
import com.uca.capas.domain.User;

public interface UserRepositoryInterface {
	public User login(String username, String password) throws DataAccessException;
}
