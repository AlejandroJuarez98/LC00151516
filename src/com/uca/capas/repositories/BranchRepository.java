package com.uca.capas.repositories;

import java.util.List;
import javax.persistence.Query;
import javax.transaction.Transactional;

import com.uca.capas.domain.Branch;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public class BranchRepository implements BranchRepositoryInterface {
	@PersistenceContext(unitName="TNCDB0119")
	private EntityManager emanager;
	
	@Override
	public Branch getBranch (int branchId) {
		Branch branch = null;
		
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT branch_id, location_branch, tables_count, opening_time, closing_time FROM branches WHERE branch_id = :id");
		Query query = this.emanager.createNativeQuery(sb.toString(), Branch.class);
		query.setParameter("id", branchId);
		
		branch = (Branch) query.getSingleResult();
		return branch;
	}
	
	@Override
	public List<Branch> getBranches() throws DataAccessException {
		List<Branch> result = null;
		
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT branch_id, location_branch, tables_count, opening_time, closing_time FROM branches");
		Query query = this.emanager.createNativeQuery(sb.toString(), Branch.class);
		
		result = query.getResultList();
		
		return result;
	}
	
	@Transactional
	@Override
	public int deleteBranch (int branchId) throws DataAccessException {
		Branch branch = null;
		branch = this.getBranch(branchId);
		
		if (branch !=  null) {
			this.emanager.remove(branch);
			return 1;
		} else {
			return 0;
		}
	}
	
	@Transactional
	@Override
	public int saveBranch(Branch branch, int newRow) throws DataAccessException {
		try {
			if (newRow == 1) {
				this.emanager.persist(branch);
			} else {
				this.emanager.merge(branch);
				this.emanager.flush();
			}
			
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
