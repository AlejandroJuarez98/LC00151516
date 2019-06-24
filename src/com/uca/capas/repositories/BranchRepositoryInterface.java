package com.uca.capas.repositories;

import java.util.List;
import com.uca.capas.domain.Branch;
import org.springframework.stereotype.Repository;

public interface BranchRepositoryInterface {
	public Branch getBranch (int branchId);
	public List<Branch> getBranches();
	public int deleteBranch (int branchId);
	public int saveBranch (Branch branch, int newRow);
}