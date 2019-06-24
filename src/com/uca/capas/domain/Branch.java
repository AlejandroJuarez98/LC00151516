package com.uca.capas.domain;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (schema="public", name="branches")
public class Branch {
	@Id
	@Column (name = "branch_id")
	private int branchId;
	
	@Column (name = "opening_time")
	public String openingTime;
	
	@Column (name = "closing_time")
	public String closingTime;
	
	@Column(name = "location_branch")
	public String Location;
	
	@Column(name = "tables_count")
	public int tablesCount;

	public int getBranchId() {
		return branchId;
	}

	public void setBranchId(int branchId) {
		this.branchId = branchId;
	}

	public String getOpeningTime() {
		return openingTime;
	}

	public void setOpeningTime(String openingTime) {
		this.openingTime = openingTime;
	}

	public String getClosingTime() {
		return closingTime;
	}

	public void setClosingTime(String closingTime) {
		this.closingTime = closingTime;
	}

	public String getLocation() {
		return Location;
	}

	public void setLocation(String location) {
		Location = location;
	}

	public int getTablesCount() {
		return tablesCount;
	}

	public void setTablesCount(int tablesCount) {
		this.tablesCount = tablesCount;
	}
}
