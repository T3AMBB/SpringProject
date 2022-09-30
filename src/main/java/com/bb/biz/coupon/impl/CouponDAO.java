package com.bb.biz.coupon.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.bb.biz.coupon.CouponVO;

@Repository("couponDAO")
public class CouponDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	final String sql_insert="INSERT INTO COUPON(CID,CODE,DCRATE,CSTATUS,MID) "
			+ "VALUES((SELECT NVL(MAX(CID),0)+1 FROM COUPON),?,?,?,?";
	

	final String sql_updateCI="UPDATE COUPON SET CSTATUS=CSTATUS+1 WHERE CID=?";
	final String sql_updateCD="UPDATE COUPON SET CSTATUS=CSTATUS-1 WHERE CID=?";
	
	
	final String sql_selectAll="SELECT * FROM COUPON ORDER BY BID DESC";


	boolean insertCoupon(CouponVO vo) {
		if(vo.getCode()!=null) {
			jdbcTemplate.update(sql_insert,vo.getCode(),vo.getDcrate(),vo.getCstatus(),vo.getMid());
			return true;
		}
		return false;
	}
	boolean updateCoupon(CouponVO vo) {
		if(vo.getCstatus()==0) {
			jdbcTemplate.update(sql_updateCI,vo.getCid());
			return true;
		}
		else if (vo.getCstatus()==1){
			jdbcTemplate.update(sql_updateCD,vo.getCid());
			return true;
		}
		
		return false;
		
	}
	List<CouponVO> selectAllCoupon(CouponVO vo){
		return jdbcTemplate.query(sql_selectAll, new CouponRowMapper());
		
	}
	
}
class CouponRowMapper implements RowMapper<CouponVO>{

	@Override
	public CouponVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		CouponVO data = new CouponVO();
		data.setCid(rs.getInt("CID"));
		data.setCode(rs.getString("CODE"));
		data.setDcrate(rs.getString("DCRATE"));
		data.setCstatus(rs.getInt("CSTATUS"));
		data.setMid(rs.getString("MID"));
		return data;
	}
	
}