package com.kh.spaceus.reservation.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	

}
