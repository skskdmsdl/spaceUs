package com.kh.spaceus.reservation.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spaceus.community.group.model.vo.GroupBoard;
import com.kh.spaceus.reservation.model.dao.ReservationDAO;
import com.kh.spaceus.reservation.model.vo.Reservation;
import com.kh.spaceus.reservation.model.vo.ReservationAvail;
import com.kh.spaceus.reservation.model.vo.Unselectable;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationDAO reservationDAO;

	@Override
	public List<ReservationAvail> selectListAvail(String spaceNo) {
		return reservationDAO.selectListAvail(spaceNo);
	}

	@Override
	public int insertReservationVail(ReservationAvail reservationAvail) {
		return reservationDAO.insertReservationVail(reservationAvail);
	}

	@Override
	public int insertReservation(Reservation reservation) {
		return reservationDAO.insertReservation(reservation);
	}

	@Override
	public List<Reservation> hostSearchReservation(Reservation reservation) {
		return reservationDAO.hostSearchReservation(reservation);
	}

	@Override
	public List<Reservation> selectUseReservation(String memberEmail, int limit, int offset) {
		return reservationDAO.selectUseReservation(memberEmail, limit, offset);
	}

	public List<Reservation> selectListReservation(String email) {
		return reservationDAO.selectListReservation(email);
	}
	
	
	
	@Override
	public List<Reservation> ingReservation(int limit, int offset, String email) {
		return reservationDAO.ingReservation(limit,offset,email);
	}

	@Override
	public int selectingReservationTotalCnt(String email) {
		return reservationDAO.selectingReservationTotalCnt(email);
	}

	@Override
	public List<Reservation> finishReservation(String email) {
		return reservationDAO.finishReservation(email);
	}

	@Override
	public int cancleReservation(String revNo) {
		return reservationDAO.cancleReservation(revNo);
	}

	@Override
	public List<Reservation> selectHostReservationList(String memberEmail, int limit, int offset) {
		return reservationDAO.selectHostReservationList(memberEmail, limit, offset);
	}

	@Override
	public int deleteRevAvail(String spaceNo) {
		return reservationDAO.deleteRevAvail(spaceNo);
	}

	@Override
	public int selectHostRevTotalContents(String memberEmail) {
		return reservationDAO.selectHostRevTotalContents(memberEmail);
	}

	@Override
	public List<Reservation> reservationPaging(int limit, int offset, String memberEmail) {
		return reservationDAO.reservationPaging(limit, offset, memberEmail);
	}

	@Override
	public int selectTotalCnt(String memberEmail) {
		return reservationDAO.selectTotalCnt(memberEmail);
	}

	@Override
	public int confirmReservation(String spaceNo) {
		return reservationDAO.confirmReservation(spaceNo);
	}

	@Override
	public List<Unselectable> unselectableList(String spaceNo) {
		return reservationDAO.unselectableList(spaceNo);
	}

	@Override
	public int updateRevNo(String oldRevNo, String newRevNo) {
		return reservationDAO.updateRevNo(oldRevNo, newRevNo);
	}

	@Override
	public int deleteReservation(String revNo) {
		return reservationDAO.deleteReservation(revNo);
	}
	
	public int updateComple() {
		return reservationDAO.updateComple();
	}

	
	
	
	
}
