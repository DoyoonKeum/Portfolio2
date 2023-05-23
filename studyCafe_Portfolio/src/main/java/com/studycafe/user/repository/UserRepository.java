package com.studycafe.user.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.studycafe.user.domain.Page;
import com.studycafe.user.domain.User;

public interface UserRepository {

	public User getLogin(User user) throws DataAccessException;
	
	public void modiUser(User user) throws DataAccessException;

	public int getUserListCount() throws DataAccessException;

	public List<User> getUserAllList(Page page) throws DataAccessException;

	public User detailUser(int u_number) throws DataAccessException;

	public void adminModiUser(User user) throws DataAccessException;

	public void adminDeleteUser(int u_number) throws DataAccessException;

	//회원가입
	public void insertUser(User user) throws DataAccessException;
}
