package com.studycafe.seat.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studycafe.seat.domain.History;

@Repository
public class HistoryRepositoryImpl implements HistoryRepository{
	
	@Autowired
	private SqlSession sqlSession;
	
	public Integer addSeatHistory(History history) throws Exception {
		
		System.out.println("historyisusing"+ history.getH_isUsing());
		
		return (Integer)sqlSession.update("mapper.seat.addUpdateHistory",history);
	}
	
	public void removeSeatHistory(History history) throws Exception{
		
		sqlSession.update("mapper.seat.removeUpdateHistory", history);
	}
	
	public List<History> historyList(){

		return sqlSession.selectList("mapper.history.hisList");
	}
	
	public History showUser(int hno) throws Exception{
		
		return sqlSession.selectOne("mapper.history.historySelect",hno);
	}

	public void insertMoney(History his) throws Exception{
		System.out.println("레파지토리에 his"+his);
		sqlSession.update("mapper.history.insertMoney", his);
	}

	@Override
	public History updateMoney(History history) throws Exception {
		
		sqlSession.update("mapper.history.updateMoney",history);
		return null;
	}

	@Override
	public History historySearch(String id) throws Exception {
		
		return sqlSession.selectOne("mapper.history.historySearch",id);
	}
	
	
	
}
