package com.kh.spaceus.reservation.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spaceus.community.group.model.vo.GroupBoard;
import com.kh.spaceus.reservation.model.vo.Reservation;
import com.kh.spaceus.reservation.model.vo.ReservationAvail;
import com.kh.spaceus.reservation.model.vo.Unselectable;
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
	public List<Reservation> ingReservation(int limit, int offset, String email) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("reservation.ingReservation", email, rowBounds);
	}

	@Override
	public int selectingReservationTotalCnt(String email) {
		return sqlSession.selectOne("reservation.selectingReservationTotalCnt", email);
	}

	@Override
	public List<Reservation> finishReservation(String email) {
		return sqlSession.selectList("reservation.finishReservation", email);
	}
	
	@Override
	public int cancleReservation(String revNo) {
		return sqlSession.update("reservation.cancleReservation", revNo);
	}
	
	public List<Reservation> selectHostReservationList(String memberEmail, int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("reservation.selectHostReservationList", memberEmail, rowBounds);
	}
		
	@Override
	public List<Reservation> hostSearchReservation(Reservation reservation) {
		return sqlSession.selectList("reservation.hostSearchReservation", reservation);
	}

	@Override
	public List<Reservation> selectUseReservation(String memberEmail, int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("reservation.selectUseReservation", memberEmail, rowBounds);
	}

	@Override
	public int deleteRevAvail(String spaceNo) {
		return sqlSession.delete("reservation.deleteRevAvail", spaceNo);
	}

	@Override
	public int selectHostRevTotalContents(String memberEmail) {
		return sqlSession.selectOne("reservation.selectHostRevTotalContents", memberEmail);
	}

	@Override
	public List<Reservation> reservationPaging(int limit, int offset, String memberEmail) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("reservation.reservationPaging", memberEmail, rowBounds);
	}

	@Override
	public int selectTotalCnt(String memberEmail) {
		return sqlSession.selectOne("reservation.selectTotalCnt", memberEmail);
	}

	@Override
	public int confirmReservation(String spaceNo) {
		return sqlSession.selectOne("reservation.confirmReservation", spaceNo);
	}

	@Override
	public List<Unselectable> unselectableList(String spaceNo) {
		return sqlSession.selectList("reservation.unselectableList", spaceNo);
	}

	@Override
	public int updateRevNo(String oldRevNo, String newRevNo) {
		Map<String,String> map = new HashMap<>();
		map.put("oldRevNo", oldRevNo);
		map.put("newRevNo", newRevNo);
		return sqlSession.update("reservation.updateRevNo", map);
	}

	@Override
	public int deleteReservation(String revNo) {
		return sqlSession.delete("reservation.deleteReservation", revNo);
	}

	public int updateComple() {
		return sqlSession.update("reservation.updateComple");
	}


}
