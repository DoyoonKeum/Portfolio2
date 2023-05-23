package com.studycafe.reservation.repository;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.studycafe.reservation.domain.RoomReservation;

@Repository
public class RoomReservationRepositoryImpl implements RoomReservationRepository {

	
	@Autowired
	private SqlSession sqlSession;
	
	//예약하기
	public int insertRoomReservation(RoomReservation roomReservation) throws DataAccessException {
		int cnt = sqlSession.insert("mapper.roomreservation.insertRoomReservation", roomReservation);
		System.out.println("cnt="+cnt);
		return cnt;
		
	}
	
	//전체 예약조회
	public List<RoomReservation> getAllReservationDetail() throws DataAccessException {
		List<RoomReservation> list = sqlSession.selectList("mapper.roomreservation.getAllReservationConfirm");
		return list;
	}
	
	//특정 예약조회
		public List<RoomReservation> getReservationDetail(int user_number) throws DataAccessException {
			List<RoomReservation> list = sqlSession.selectList("mapper.roomreservation.getReservationConfirm", user_number);
			return list;
		}
		
	//날짜별 예약가능 조회 101
	public List<RoomReservation> timeCheckA(String rs_date) throws DataAccessException{
		List<RoomReservation> list = sqlSession.selectList("mapper.roomreservation.timeCheckA", rs_date);
		return  list;
	}
	
	//날짜별 예약가능 조회 102
	public List<RoomReservation> timeCheckB(String rs_date) throws DataAccessException{
		List<RoomReservation> list = sqlSession.selectList("mapper.roomreservation.timeCheckB", rs_date);
		return  list;
	}
	
	//날짜별 예약가능 조회 103
	public List<RoomReservation> timeCheckC(String rs_date) throws DataAccessException{
		List<RoomReservation> list = sqlSession.selectList("mapper.roomreservation.timeCheckC", rs_date);
		return  list;
	}
	
	//날짜별 예약가능 조회 104
	public List<RoomReservation> timeCheckD(String rs_date) throws DataAccessException{
		List<RoomReservation> list = sqlSession.selectList("mapper.roomreservation.timeCheckD", rs_date);
		return  list;
	}
	
}
