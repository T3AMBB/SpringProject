package com.bb.biz.buylist.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.bb.biz.buylist.BuylistVO;

@Repository("buylistDAO")
public class BuylistDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	final String sql_insert="INSERT INTO BUYLIST(BUYID,MID,PID,BUYCNT,SHIPPING,PRCADR)"
			+ "VALUES((SELECT NVL(MAX(BUYID),0)+1 FROM BUYLIST),?,?,?,?,?)";
	final String sql_selectAll="SELECT * FROM BUYLIST WHERE MID=? ORDER BY BUYID DESC";


	boolean insertBuylist(BuylistVO vo) {
		if(vo.getMid()!=null) {
		jdbcTemplate.update(sql_insert,vo.getMid(),vo.getPid(),vo.getBuydate(),vo.getBuycnt(),vo.getShipping(),vo.getPrcadr());
		return true;
		}
		else {
			return false;
		}
	}
	List<BuylistVO> selectAllBuylist(BuylistVO vo){
		return jdbcTemplate.query(sql_selectAll,new BuylistRowMapper());
	
		}
	}
class BuylistRowMapper implements RowMapper<BuylistVO>{

	@Override
	public BuylistVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		BuylistVO data=new BuylistVO();
		data.setBuyid(rs.getInt("BUYID"));
		data.setMid(rs.getString("MID"));
		data.setPid(rs.getInt("PID"));
		data.setBuydate(rs.getString("BUYDATE"));
		data.setBuycnt(rs.getInt("BUYCNT"));
		data.setShipping(rs.getString("SHIPPING"));
		data.setPrcadr(rs.getString("PRCADR"));
		return data;
	}
	
}



