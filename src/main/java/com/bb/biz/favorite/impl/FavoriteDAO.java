package com.bb.biz.favorite.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.bb.biz.favorite.FavoriteVO;

@Repository("favoriteDAO")
public class FavoriteDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	final String sql_insert="INSERT INTO FAVORITE(FID,MID,PID) "
			+ "VALUES((SELECT NVL(MAX(FID),0)+1 FROM FAVORITE),?,?)";
	
	final String sql_delete="DELETE FROM FAVORITE WHERE MID=? AND PID=?";
	final String sql_selectOne="SELECT * FROM FAVORITE WHERE MID=? AND PID=?";
	
	public boolean insertFavorite(FavoriteVO vo) {
			jdbcTemplate.update(sql_insert,vo.getMid(),vo.getPid());
			return true;
	}
	public boolean deleteFavorite(FavoriteVO vo) {
		jdbcTemplate.update(sql_delete,vo.getMid(),vo.getPid());
		return true;
	}
	public FavoriteVO selectOneFavorite(FavoriteVO vo) {
		Object[] args= {vo.getMid(),vo.getPid()};
		try {
			return jdbcTemplate.queryForObject(sql_selectOne,args,new FavoriteRowMapper());
		}
		catch(EmptyResultDataAccessException e) {
			return null;
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

