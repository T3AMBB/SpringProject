package com.bb.biz.product.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.bb.biz.product.ProductVO;

@Repository("productDAO")
public class ProductDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	final String sql_selectOne="SELECT * FROM PRODUCT WHERE PID=?";
	final String sql_selectAll="SELECT * FROM PRODUCT ORDER BY BID DESC";
	
	ProductVO selectOneProduct(ProductVO vo) {
		Object[] args= {vo.getPid()};
		return jdbcTemplate.queryForObject(sql_selectOne,args,new ProductRowMapper());
		
	}
	List<ProductVO> selectAllProduct(ProductVO vo){
		return jdbcTemplate.query(sql_selectAll,new ProductRowMapper());
		
	}
}
class ProductRowMapper implements RowMapper<ProductVO>{

	@Override
	public ProductVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProductVO data=new ProductVO();
		data.setPid(rs.getInt("PID"));
		data.setPname(rs.getString("PNAME"));
		data.setPrice(rs.getInt("PRICE"));
		data.setPcnt(rs.getInt("PCNT"));
		data.setPcom(rs.getString("PCOM"));
		data.setPmade(rs.getString("PMADE"));
		data.setPmat(rs.getString("PMAT"));
		data.setPsize(rs.getString("PSIZE"));
		return data;
	}
	
}
