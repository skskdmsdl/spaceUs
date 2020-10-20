package com.kh.spaceus.reservation.model.service;

import java.util.List;

import com.kh.spaceus.reservation.model.vo.Reservation;
import com.kh.spaceus.reservation.model.vo.ReservationAvail;
import com.kh.spaceus.reservation.model.vo.Unselectable;

public interface ReservationService {

	//공간별 예약 가능 시간
	List<ReservationAvail> selectListAvail(String spaceNo);

	int insertReservationVail(ReservationAvail reservationAvail);
	
	int deleteRevAvail(String spaceNo);
	
	//공간별 예약
	int insertReservation(Reservation reservation);
	
	List<Reservation> selectListReservation(String email);

	List<Reservation> hostSearchReservation(Reservation reservation);

	List<Reservation> selectUseReservation(String memberEmail, int limit, int offset);
	
	List<Reservation> ingReservation(int limit, int offset, String email);

	int selectingReservationTotalCnt(String email);

	List<Reservation> finishReservation(String email);

	int cancleReservation(String revNo);
	

	List<Reservation> selectHostReservationList(String memberEmail, int limit, int offset);

	int selectHostRevTotalContents(String memberEmail);

	List<Reservation> reservationPaging(int limit, int offset, String memberEmail);

	int selectTotalCnt(String memberEmail);

	int confirmReservation(String spaceNo);

	List<Unselectable> unselectableList(String spaceNo);

	int updateComple();

	int updateRevNo(String oldRevNo, String newRevNo);

	int deleteReservation(String revNo);

}
