package com.bb.biz.favorite.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.bb.biz.favorite.FavoriteVO;

@Repository("favoriteDAO")
public class FavoriteDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	final String sql_insert="INSERT INTO FAVORITE(FID,MID,PID) "
			+ "VALUES((SELECT NVL(MAX(FID),0)+1 FROM FAVORITE),?,?";
	
	final String sql_delete="DELETE FROM FAVORITE WHERE=?";

	boolean insertFavorite(FavoriteVO vo) {
		if(!vo.isFlag()) {
			jdbcTemplate.update(sql_insert,vo.getMid(),vo.getPid());
			return true;
		}
		else {
			return false;
		}
	}
	boolean deleteFavorite(FavoriteVO vo) {
		if(vo.isFlag()) {
		jdbcTemplate.update(sql_delete,vo.getFid());
		return true;
		}
		else {
			return false;
		}
	}
}
class FavoriteRowMapper implements RowMapper<FavoriteVO>{

	@Override
	public FavoriteVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		FavoriteVO data = new FavoriteVO();
		data.setFid(rs.getInt("FID"));
		data.setMid(rs.getString("MID"));
		data.setPid(rs.getInt("PID"));
		return data;
	}
	
}

