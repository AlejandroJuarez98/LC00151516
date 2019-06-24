package com.uca.capas.controller;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.uca.capas.domain.Branch;
import com.uca.capas.services.BranchManager;
import com.uca.capas.services.UserManager;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
	public static String username = null;
	private static Logger logger = Logger.getLogger(MainController.class.getName());
	
	@Autowired
	private UserManager uservice;
	
	@Autowired
	private BranchManager bservice;

	@RequestMapping(value="/", method = RequestMethod.GET)
	public ModelAndView home () {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		
		return mav;
	}
	
	@RequestMapping(value="/dashboard", method = RequestMethod.GET)
	public ModelAndView dashboard (String password, final RedirectAttributes redirectAttributes) {
		ModelAndView dashboard = new ModelAndView();
		
		if (username != null) {
			List<Branch> branches = this.bservice.getBranches();
			
			dashboard.setViewName("dashboard");
			dashboard.addObject("username", username);
			dashboard.addObject("branches", branches);
		} else {
			redirectAttributes.addFlashAttribute("error", 1);
			dashboard.setViewName("redirect:/");
		}
		
		return dashboard;
	}
	
	@RequestMapping(value="/new-branch", method = RequestMethod.GET)
	public ModelAndView newBranch () {
		ModelAndView newBranch = new ModelAndView();
		newBranch.addObject("action", "new");
		newBranch.setViewName("form");
		
		return newBranch;
	}
	
	@RequestMapping(value="/update-branch", method = RequestMethod.GET)
	public ModelAndView updateBranch (@RequestParam("id") int branchId) {
		ModelAndView updateBranch = new ModelAndView();
		updateBranch.addObject("username", username);
		updateBranch.addObject("action", "update");
		updateBranch.addObject("branch", this.bservice.getBranch(branchId));
		
		updateBranch.setViewName("form");
		
		return updateBranch;
	}
	
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public ModelAndView update (@RequestParam("id") int branchId, @RequestParam("location") String location, @RequestParam("openingTime") String openingTime, @RequestParam("closingTime") String closingTime, @RequestParam("tablesCount") int tables, final RedirectAttributes redirectAttributes) {
		ModelAndView update = new ModelAndView();
		
		Branch branch = new Branch();
		
		branch.setBranchId(branchId);
		branch.setLocation(location);
		branch.setTablesCount(tables);
		branch.setOpeningTime(openingTime);
		branch.setClosingTime(closingTime);
		
		redirectAttributes.addFlashAttribute("success", this.bservice.saveBranch(branch, 0));
		update.setViewName("redirect:/dashboard");
		
		return update;
	}
	 
	@RequestMapping(value="/delete-branch", method = RequestMethod.POST)
	public ModelAndView deleteBranch (@RequestParam("id") int branchId, final RedirectAttributes redirectAttributes) {
		ModelAndView deleteBranch = new ModelAndView();
		
		if (this.bservice.deleteBranch(branchId) == 1) {
			redirectAttributes.addFlashAttribute("success", 1);
			deleteBranch.setViewName("redirect:/dashboard");
		} else {
			redirectAttributes.addFlashAttribute("error", 1);
			deleteBranch.setViewName("redirect:/dashboard");
		}
		
		return deleteBranch;
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.POST)
	public ModelAndView logout (final RedirectAttributes redirectAttributes) {
		ModelAndView logout = new ModelAndView();
		
		username = null;
		logout.setViewName("redirect:/");
		
		return logout;
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public ModelAndView login (@RequestParam("username") String username, @RequestParam("password") String password, final RedirectAttributes redirectAttributes) {
		ModelAndView login = new ModelAndView();
		
		if (this.uservice.login(username, password)) {
			this.username = username;
			redirectAttributes.addFlashAttribute("username", username);
			login.setViewName("redirect:/dashboard");
		} else {
			redirectAttributes.addFlashAttribute("error", 1);
			login.setViewName("redirect:/");
		}
		
		return login;
	}
}
