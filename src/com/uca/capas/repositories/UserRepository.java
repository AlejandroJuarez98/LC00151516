package com.uca.capas.repositories;

import javax.persistence.Query;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import com.uca.capas.domain.User;

@Repository
public class UserRepository implements UserRepositoryInterface {
	@PersistenceContext(unitName="TNCDB0119")
	private EntityManager emanager;
	
	@Override
	public User login(String username, String password) {
		User result = null;
		
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT user_id, username, password FROM users WHERE username = :username AND password = :password");
		Query query = this.emanager.createNativeQuery(sb.toString(), User.class); 
		
		query.setParameter("username", username);
		query.setParameter("password", password);
		  
		result = (User) query.getSingleResult();
		return result;
	}
}
