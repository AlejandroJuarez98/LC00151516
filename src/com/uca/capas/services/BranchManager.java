package com.uca.capas.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uca.capas.domain.Branch;
import com.uca.capas.domain.Employee;
import com.uca.capas.repositories.BranchRepositoryInterface;
import com.uca.capas.repositories.EmployeeRepositoryInterface;

@Service
public class BranchManager {
	@Autowired
	private BranchRepositoryInterface branchRepositoryInterface;
	
	@Autowired
	private EmployeeRepositoryInterface employeeRepositoryInterface;
	
	public List<Employee> getEmployees (int branchId) {
		List<Employee> employees = null;
		
		try {
			employees = this.employeeRepositoryInterface.getEmployees(branchId);
		} catch(Exception error) {
			error.printStackTrace();
		}
		
		return employees;
	}
	
	public List<Branch> getBranches () {
		List<Branch> branches = null;
		
		try {
			branches = this.branchRepositoryInterface.getBranches();
		} catch(Exception error) {
			error.printStackTrace();
		}
		
		return branches;
	}
	
	public Branch getBranch (int branchId) {
		Branch branch = null;
		
		try {
			branch = this.branchRepositoryInterface.getBranch(branchId);
		} catch(Exception error) {
			error.printStackTrace();
		}
		
		return branch;
	}
	
	public int saveEmployee (Employee e) {
		int employee = 0;
		
		try {
			employee =  this.employeeRepositoryInterface.saveEmployee(e);
		} catch(Exception error) {
			error.printStackTrace();
		}
		
		return employee;
	}
	
	public int saveBranch(Branch b, int newRow) {
		int branch = 0;
		
		try {
			branch =  this.branchRepositoryInterface.saveBranch(b, newRow);
		} catch(Exception error) {
			error.printStackTrace();
		}
		
		return branch;
	}
	
	public int deleteBranch (int branchId) {
		int result = 0;
		
		try {
			result = this.branchRepositoryInterface.deleteBranch(branchId);
		} catch (Exception error) {
			error.printStackTrace();
		}
		
		return result;
	}
}
