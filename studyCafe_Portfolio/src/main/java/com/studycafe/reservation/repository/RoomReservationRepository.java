package com.studycafe.reservation.repository;

import java.util.Date;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.studycafe.reservation.domain.RoomReservation;

public interface RoomReservationRepository {

	//예약하기
	public int insertRoomReservation(RoomReservation roomReservation) throws DataAccessException;
	
	//전체 예약조회
	public List<RoomReservation> getAllReservationDetail() throws DataAccessException;
	
	//특정 예약조회
	public List<RoomReservation> getReservationDetail(int user_number) throws DataAccessException;
	
	//날짜별 예약가능 조회 101
	public List<RoomReservation> timeCheckA(String rs_date) throws DataAccessException;

	//날짜별 예약가능 조회 102
	public List<RoomReservation> timeCheckB(String rs_date) throws DataAccessException;
	
	//날짜별 예약가능 조회 103
	public List<RoomReservation> timeCheckC(String rs_date) throws DataAccessException;
	
	//날짜별 예약가능 조회 104
	public List<RoomReservation> timeCheckD(String rs_date) throws DataAccessException;
	
	
}
