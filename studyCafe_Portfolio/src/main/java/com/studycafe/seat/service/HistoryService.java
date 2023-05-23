package com.studycafe.seat.service;

import java.util.List;

import com.studycafe.seat.domain.History;

public interface HistoryService {
	
	public History showUser(int hno)throws Exception;
	
	public List<History> historyList()throws Exception;
	
	public void updateMoney(History history) throws Exception;
	
	public History historySearch(String id) throws Exception;
}
