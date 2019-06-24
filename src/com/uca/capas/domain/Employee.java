package com.uca.capas.domain;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (schema="public", name="employees")
public class Employee {
	@Id
	@Column (name = "employee_id")
	private int employeeId;
	
	@Column (name = "name")
	public String name;
	
	@Column (name = "age")
	public int age;
	
	@Column(name = "gender")
	public char gender;
	
	@Column(name = "status")
	public int status;

	@Column(name = "branch_id")
	public int branchId;

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getBranchId() {
		return branchId;
	}

	public void setBranchId(int branchId) {
		this.branchId = branchId;
	}
}
