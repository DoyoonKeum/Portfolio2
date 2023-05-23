package com.studycafe.seat.repository;

import java.util.List;

import com.studycafe.seat.domain.History;

public interface HistoryRepository {
	
	public List<History> historyList() throws Exception;
	
	public Integer addSeatHistory(History history) throws Exception;
	
	public void removeSeatHistory(History history) throws Exception;
	
	public History showUser(int hno) throws Exception;
	
	public History updateMoney(History history) throws Exception;
	
	public History historySearch(String id) throws Exception;
}
