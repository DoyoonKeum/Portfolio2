package com.studycafe.reservation.service;

import java.util.Date;
import java.util.List;

import com.studycafe.reservation.domain.RoomReservation;

public interface RoomReservationService {

	//예약하기
	public int insertRoomReservation(RoomReservation roomReservation) throws Exception;
	
	//전체 예약 조회
	public List<RoomReservation> getAllReservationDetail() throws Exception;
	
	//특정 예약 조회
	public List<RoomReservation> getReservationDetail(int user_number) throws Exception;
	
	//날짜별 예약가능 조회 101
	public List<RoomReservation> timeCheckA(String rs_date) throws Exception;
	
	//날짜별 예약가능 조회 102
	public List<RoomReservation> timeCheckB(String rs_date) throws Exception;
	
	//날짜별 예약가능 조회 103
	public List<RoomReservation> timeCheckC(String rs_date) throws Exception;
	
	//날짜별 예약가능 조회 104
	public List<RoomReservation> timeCheckD(String rs_date) throws Exception;
	
}
