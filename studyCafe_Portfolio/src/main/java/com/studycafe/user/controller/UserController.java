package com.studycafe.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.studycafe.user.domain.Page;
import com.studycafe.user.domain.User;
import com.studycafe.user.domain.UserPage;
import com.studycafe.user.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@GetMapping("/login")
	public String login(Model model) throws Exception {
		return "user/login";
	}
	@PostMapping("/logined")
	public String logined(String u_id,String u_pass,Model model,HttpServletRequest request) throws Exception {
		
		User user = new User();
		user.setU_id(u_id);
		user.setU_pass(u_pass);
		User loginUser = userService.getLogin(user);
		if(loginUser==null) {
			String msg ="로그인에 실패하였습니다";
			model.addAttribute("msg",msg);
			return "user/login";
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("AUTHUSER", loginUser);
		User name = (User)session.getAttribute("AUTHUSER");
		
		System.out.println("여기서 확인");
		System.out.println(name.getU_name());
		
		return "main";
	}
	
	@GetMapping("/logout")
	public String logout(Model model,HttpSession session) throws Exception {
		session.invalidate();
		return "main";
	}
	
	@GetMapping("/user/modiUserForm")
	public String modiUserForm(Model model) throws Exception {
		return "user/modiUser";
	}
	
	@PostMapping("/user/modiUser")
	public String modiUserForm(Model model,User user,String u_pass1,HttpServletRequest request) throws Exception {
		User loginUser = userService.getLogin(user);
		
		if(loginUser==null) {
			String msg ="기존 비밀번호가 다릅니다.";
			model.addAttribute("msg",msg);
			return "user/modiUser";
		}else {
			user.setU_pass(u_pass1);
			userService.modiUser(user);
			HttpSession session = request.getSession();
			User modiUser = userService.getLogin(user);
			session.setAttribute("AUTHUSER", modiUser);
			return "main";
		}
	}
	
	@RequestMapping(value="/user/userList", method= {RequestMethod.GET,RequestMethod.POST})
	public String userList(Model model,HttpServletRequest request) throws Exception {
		
		String strPageNo = request.getParameter("pageNo");
		int pageNo = 1;   
		if(strPageNo!=null) {
			pageNo = Integer.parseInt(strPageNo);			
		}
		Page page = new Page(pageNo);
		
		UserPage userPage  = userService.getUserPage(page);
		model.addAttribute("userPage", userPage);
		
		return "user/userList";
	}
	
	@GetMapping("/user/adminModiUserForm")
	public String adminModiUserForm(Model model,@RequestParam("no") int u_number) throws Exception {
		User detailUser = userService.detailUser(u_number);
		model.addAttribute("detailUser", detailUser);
		return "user/adminModiUser";
	}
	
	@PostMapping("/user/adminModiUser")
	public String adminModiUser(User user) throws Exception {
		userService.adminModiUser(user);
		return "redirect:/userList";
	}
	
	@GetMapping("/user/adminDeleteUser")
	public String adminDeleteUser(@RequestParam("no") int u_number)throws Exception {
		userService.adminDeleteUser(u_number);
		return "redirect:/userList";
	}
	
	@GetMapping("/join")
	public String join() throws Exception {
		return "user/join";
	}
	
	@PostMapping("/join")
	public String doJoin(User user, String re_u_pass, Model model, HttpServletRequest req) throws Exception {
		Map<String,Boolean> errors = new HashMap<String,Boolean>();
		req.setAttribute("errors",errors);
		String u_pass = user.getU_pass();
		if(!u_pass.equals(re_u_pass)) {
			errors.put("notMatch", Boolean.TRUE);
		}
		if(!errors.isEmpty()) { //에러가 존재하면 돌아가라
			return "user/join";
		}
		userService.insertUser(user);
		model.addAttribute("user", user);
		return "user/success";
	}
	
	public boolean isPasswordEqualsToConfirm(String u_pass, String re_u_pass) {
		return u_pass != null && u_pass.equals(re_u_pass);   //조건두개 충족. null이면 안됨
		
	}
	
}
