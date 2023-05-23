package com.studycafe.seat.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studycafe.seat.domain.History;
import com.studycafe.seat.repository.HistoryRepositoryImpl;

@Service
public class HistoryServiceImpl implements HistoryService{
	@Autowired
	HistoryRepositoryImpl historyRepository;
	
	@Override
	public History showUser(int hno) throws Exception {
		History history=historyRepository.showUser(hno);
		
		return history;
	}	
	@Override
	public List<History> historyList() throws Exception{
		List<History> hisList = new ArrayList();
			hisList=historyRepository.historyList();
	return hisList;
	}

	@Override
	public void updateMoney(History his) throws Exception {
		
		historyRepository.updateMoney(his);
		
	}
	@Override
	public History historySearch(String id) throws Exception {
		History history=historyRepository.historySearch(id);
		
		return history;
	}
	
	
	
}
