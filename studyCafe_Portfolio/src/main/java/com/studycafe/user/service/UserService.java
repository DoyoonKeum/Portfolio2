package com.studycafe.user.service;

import com.studycafe.user.domain.Page;
import com.studycafe.user.domain.User;
import com.studycafe.user.domain.UserPage;

public interface UserService {

	public User getLogin(User user) throws Exception;
	
	public void modiUser(User user) throws Exception;

	public UserPage getUserPage(Page page) throws Exception;

	public User detailUser(int u_number) throws Exception;

	public void adminModiUser(User user) throws Exception;

	public void adminDeleteUser(int u_number) throws Exception;
	
	
	//회원가입
	public void insertUser(User user) throws Exception;
}
