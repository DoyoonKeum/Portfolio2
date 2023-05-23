package com.studycafe.reservation.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studycafe.reservation.domain.RoomReservation;
import com.studycafe.reservation.repository.RoomReservationRepository;

@Service
public class RoomReservationServiceImpl implements RoomReservationService {

	@Autowired
	RoomReservationRepository roomReservationRepository;
	
	//예약하기
	public int insertRoomReservation(RoomReservation roomReservation) throws Exception{
		return roomReservationRepository.insertRoomReservation(roomReservation);
	}
	
	//예약 전체조회
	public List<RoomReservation> getAllReservationDetail() throws Exception{
		return roomReservationRepository.getAllReservationDetail();
	}
	
	//예약 상세조회
	public List<RoomReservation> getReservationDetail(int user_number) throws Exception{
		return roomReservationRepository.getReservationDetail(user_number);
	}
	
	//날짜별 예약가능 조회 101
	public List<RoomReservation> timeCheckA(String rs_date) throws Exception{
		return roomReservationRepository.timeCheckA(rs_date);
	}
	
	//날짜별 예약가능 조회 102
	public List<RoomReservation> timeCheckB(String rs_date) throws Exception{
		return roomReservationRepository.timeCheckB(rs_date);
	}
	
	//날짜별 예약가능 조회 103
	public List<RoomReservation> timeCheckC(String rs_date) throws Exception{
		return roomReservationRepository.timeCheckC(rs_date);
	}
	
	//날짜별 예약가능 조회 104
	public List<RoomReservation> timeCheckD(String rs_date) throws Exception{
		return roomReservationRepository.timeCheckD(rs_date);
	}
	
}
