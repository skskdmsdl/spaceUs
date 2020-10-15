package com.kh.spaceus.reservation.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spaceus.reservation.model.vo.Reservation;
import com.kh.spaceus.reservation.model.vo.ReservationAvail;
import com.kh.spaceus.space.model.vo.Space;
import com.kh.spaceus.space.model.vo.Tag;


@Repository
public class ReservationDAOImpl implements ReservationDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ReservationAvail> selectListAvail(String spaceNo) {
		return sqlSession.selectList("reservation.selectListAvail", spaceNo);
	}

	@Override
	public int insertReservationVail(ReservationAvail reservationAvail) {
		return sqlSession.insert("reservation.insertReservationVail", reservationAvail);
	}

	@Override
	public int insertReservation(Reservation reservation) {
		return sqlSession.insert("reservation.insertReservation", reservation);
	}

	@Override
	public List<Reservation> selectListReservation(String email) {
		return sqlSession.selectList("reservation.selectListReservation", email);
	}

	@Override
	public List<Reservation> ingReservation(String email) {
		return sqlSession.selectList("reservation.ingReservation", email);
	}

	@Override
	public List<Reservation> finishReservation(String email) {
		return sqlSession.selectList("reservation.finishReservation", email);
	}
	
	@Override
	public int cancleReservation(String revNo) {
		return sqlSession.update("reservation.cancleReservation", revNo);
	}
	
	public List<Reservation> selectHostReservationList(String memberEmail) {
		return sqlSession.selectList("reservation.selectHostReservationList", memberEmail);
	}
		
	@Override
	public List<Reservation> hostSearchReservation(Reservation reservation) {
		return sqlSession.selectList("reservation.hostSearchReservation", reservation);
	}

	@Override
	public List<Reservation> selectUseReservation(String memberEmail) {
		return sqlSession.selectList("reservation.selectUseReservation", memberEmail);
	}

	@Override
	public int deleteRevAvail(String spaceNo) {
		return sqlSession.delete("reservation.deleteRevAvail", spaceNo);
	}

}
