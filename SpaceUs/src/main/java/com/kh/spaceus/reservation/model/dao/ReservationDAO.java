package com.kh.spaceus.reservation.model.dao;

import java.util.List;

import com.kh.spaceus.reservation.model.vo.Reservation;
import com.kh.spaceus.reservation.model.vo.ReservationAvail;
import com.kh.spaceus.space.model.vo.Space;
import com.kh.spaceus.space.model.vo.Tag;

public interface ReservationDAO {

	List<ReservationAvail> selectListAvail(String spaceNo);

	int insertReservationVail(ReservationAvail reservationAvail);

	List<Reservation> selectListReservation(String email);

	List<Reservation> selectHostReservationList(String memberEmail);

	
	
}
