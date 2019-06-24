package com.uca.capas.repositories;

import java.util.List;
import com.uca.capas.domain.Employee;

public interface EmployeeRepositoryInterface {
	public List<Employee> getEmployees(int branchId);
}
