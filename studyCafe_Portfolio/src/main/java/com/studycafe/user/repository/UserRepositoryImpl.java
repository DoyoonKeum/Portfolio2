package com.studycafe.user.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.studycafe.user.domain.Page;
import com.studycafe.user.domain.User;

@Repository
public class UserRepositoryImpl implements UserRepository {

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public User getLogin(User user) throws DataAccessException {
		return sqlSession.selectOne("mapper.user.getLogin",user);
	}

	@Override
	public void modiUser(User user) throws DataAccessException {
		sqlSession.update("mapper.user.modiUser",user);
	}

	@Override
	public int getUserListCount() throws DataAccessException {
		return sqlSession.selectOne("mapper.user.userListCount");
	}

	@Override
	public List<User> getUserAllList(Page page) throws DataAccessException {
		return sqlSession.selectList("mapper.user.getUserAllList", page);
	}

	@Override
	public User detailUser(int u_number) throws DataAccessException {
		return sqlSession.selectOne("mapper.user.detailUser",u_number);
	}

	@Override
	public void adminModiUser(User user) throws DataAccessException {
		sqlSession.update("mapper.user.adminModiUser",user);
		
	}

	@Override
	public void adminDeleteUser(int u_number) throws DataAccessException {
		sqlSession.delete("mapper.user.adminDeleteUser",u_number);
		
	}
	
	//회원가입
	@Override
	public void insertUser(User user) throws DataAccessException {
		sqlSession.insert("mapper.user.insertUser", user);
	}
}
