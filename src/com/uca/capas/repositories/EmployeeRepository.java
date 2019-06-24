package com.uca.capas.repositories;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;
import com.uca.capas.domain.Employee;

@Repository
public class EmployeeRepository implements EmployeeRepositoryInterface {
	@PersistenceContext(unitName="TNCDB0119")
	private EntityManager emanager;
	
	@Override
	public List<Employee> getEmployees(int branchId) {
		List<Employee> result = null;
		
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT employee_id, name, age, gender, status, branch_id FROM employees WHERE branch_id = :id");
		Query query = this.emanager.createNativeQuery(sb.toString(), Employee.class);
		query.setParameter("id", branchId);
		
		result = query.getResultList();
		
		return result;
	}

}
