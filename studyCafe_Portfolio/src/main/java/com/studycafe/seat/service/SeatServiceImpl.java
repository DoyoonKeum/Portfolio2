package com.studycafe.seat.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studycafe.seat.domain.History;
import com.studycafe.seat.domain.Seat;
import com.studycafe.seat.repository.HistoryRepositoryImpl;
import com.studycafe.seat.repository.SeatRepositoryImpl;
import com.studycafe.user.domain.User;


@Service
public class SeatServiceImpl {
	
	@Autowired
	SeatRepositoryImpl seatRepository;
	
	@Autowired
	HistoryRepositoryImpl historyRepository;
	
	
	public User showLoginUser(String userId)throws Exception{
		System.out.println("서비스"+userId);
		User member =seatRepository.showLoginUser(userId);
		
		return member;
	}
	
	public List<Seat> showSeat()throws Exception{
		
		List<Seat>list=seatRepository.showSeat();
		return list;
	}
	
	public History showUser(int hno) throws Exception{
		History history=seatRepository.showUser(hno);
		
		return history;
	}
	

    public boolean reserveSeat(int seatNumber,int hno) throws Exception {
    		
    		System.out.println("seatNumber"+seatNumber);
    		System.out.println("hno"+hno);
    	
    		History history = new History();
    		history.setH_isUsing(seatNumber);
    		history.setH_number(hno);
    		System.out.println("서비스impl"+history);
    		
    		History his=seatRepository.showUser(hno);
    		System.out.println("his"+his);
    		if(his.getH_isUsing()!=0 || his.getH_wallet()<3000) {	
    			return false;
    		
    		}else{
    			
    			historyRepository.addSeatHistory(history);
    			Seat seat = seatRepository.findBySeat(seatNumber);
    			
    			System.out.println("seat"+seat);
    			
    			if (seat == null) {
    				throw new IllegalArgumentException("해당 좌석이 존재하지 않습니다.");
    			}
    			if (seat.getS_isusing() == 1) {
    				return false; // 이미 사용중인 좌석
    			}
    			seat.setS_isusing(1);
    			if(his.getH_wallet()<3000) {
    				return false;
    			}else {
    			his.setH_wallet((his.getH_wallet()-3000));
    			historyRepository.insertMoney(his);}
			
			boolean result=seatRepository.reserveSeat(seat);
			System.out.println("service에서 result"+result);
			return result;
    		}
		}//reservceSeat() 끝
    
 
    public void cancelSeat(int seatNumber,int hno) throws Exception {
    	History history = new History();
		history.setH_isUsing(0);
		history.setH_number(hno);
    	
		historyRepository.removeSeatHistory(history);
    	
    	Seat seat = seatRepository.findBySeat(seatNumber);

      if (seat == null) {
        throw new IllegalArgumentException("해당 좌석이 존재하지 않습니다.");
      }

      if (seat.getS_isusing()== 0) {
        throw new IllegalStateException("이미 비활성화된 좌석입니다.");
      }

      seatRepository.cancelSeat(seatNumber);
    }
    	
    public List<History> historyList() throws Exception{
    	List<History> historyList = new ArrayList();
    	historyList=historyRepository.historyList();
    	return historyList;
    }
    
    
    public boolean reserveSeat2(int seatNumber,int hno) throws Exception {
		
		System.out.println("seatNumber"+seatNumber);
		System.out.println("hno"+hno);
	
		History history = new History();
		history.setH_isUsing(seatNumber);
		history.setH_number(hno);
		System.out.println(history);
		
		History his=seatRepository.showUser(hno);
		System.out.println("his"+his);
		if(his.getH_isUsing()!=0) {	
			return false;
		
		}else{
			
			historyRepository.addSeatHistory(history);
			Seat seat = seatRepository.findBySeat(seatNumber);
			
			System.out.println("seat"+seat);
			
			if (seat == null) {
				throw new IllegalArgumentException("해당 좌석이 존재하지 않습니다.");
			}
			if (seat.getS_isusing() == 1) {
				return false; // 이미 사용중인 좌석
			}
			seat.setS_isusing(1);
		
		boolean result=seatRepository.reserveSeat(seat);
		System.out.println("service에서 result"+result);
		return result;
		}
	}//reservceSeat2() 끝
    
    public void cancelSeat2(int seatNumber,int hno) throws Exception {
    	History history = new History();
		history.setH_isUsing(0);
		history.setH_number(hno);
    	
		historyRepository.removeSeatHistory(history);
    	
    	Seat seat = seatRepository.findBySeat(seatNumber);

      if (seat == null) {
        throw new IllegalArgumentException("해당 좌석이 존재하지 않습니다.");
      }

      if (seat.getS_isusing()== 0) {
        throw new IllegalStateException("이미 비활성화된 좌석입니다.");
      }

      seatRepository.cancelSeat(seatNumber);
    }
    
	}

