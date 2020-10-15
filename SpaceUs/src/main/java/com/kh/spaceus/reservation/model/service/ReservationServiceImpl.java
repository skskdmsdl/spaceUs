package com.kh.spaceus.reservation.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spaceus.reservation.model.dao.ReservationDAO;
import com.kh.spaceus.reservation.model.vo.Reservation;
import com.kh.spaceus.reservation.model.vo.ReservationAvail;

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
	public List<Reservation> selectUseReservation(String memberEmail) {
		return reservationDAO.selectUseReservation(memberEmail);
	}

	public List<Reservation> selectListReservation(String email) {
		return reservationDAO.selectListReservation(email);
	}
	
	@Override
	public List<Reservation> ingReservation(String email) {
		return reservationDAO.ingReservation(email);
	}
	
	@Override
	public List<Reservation> finishReservation(String email) {
		return reservationDAO.finishReservation(email);
	}

	@Override
	public int cancleReservation(String revNo) {
		return reservationDAO.cancleReservation(revNo);
	}

	public List<Reservation> selectHostReservationList(String memberEmail) {
		return reservationDAO.selectHostReservationList(memberEmail);
	}

	@Override
	public int deleteRevAvail(String spaceNo) {
		return reservationDAO.deleteRevAvail(spaceNo);
	}
	
}
