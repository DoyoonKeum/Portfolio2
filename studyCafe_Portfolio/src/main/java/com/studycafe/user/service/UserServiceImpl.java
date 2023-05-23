package com.studycafe.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studycafe.user.domain.Page;
import com.studycafe.user.domain.User;
import com.studycafe.user.domain.UserPage;
import com.studycafe.user.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository userRepository;
	
	@Override
	public User getLogin(User user) throws Exception {
		return userRepository.getLogin(user);
	}

	@Override
	public void modiUser(User user) throws Exception {
		userRepository.modiUser(user);
	}

	@Override
	public UserPage getUserPage(Page page) throws Exception {
		// TODO Auto-generated method stub
		
		int total = userRepository.getUserListCount();
		List<User> UserAllList = userRepository.getUserAllList(page);
		return new UserPage(total,page.getPageNo(),5, UserAllList);
	}

	@Override
	public User detailUser(int u_number) throws Exception {
		return userRepository.detailUser(u_number);
	}

	@Override
	public void adminModiUser(User user) throws Exception {
		userRepository.adminModiUser(user);
	}

	@Override
	public void adminDeleteUser(int u_number) throws Exception {
		userRepository.adminDeleteUser(u_number);
		
	}
	
	//회원가입
	@Override
	public void insertUser(User user) throws Exception {
		userRepository.insertUser(user);
	}
}
