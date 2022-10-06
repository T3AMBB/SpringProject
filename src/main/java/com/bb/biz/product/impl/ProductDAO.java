package com.bb.biz.product.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.bb.biz.controller.Crawling;
import com.bb.biz.product.ProductVO;

@Repository("productDAO")
public class ProductDAO {
	
	public ProductDAO(){
		System.out.println("DAO생성로그");
	}
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	final String sql_selectOne="SELECT * FROM PRODUCT WHERE PID=?";
	final String sql_selectAll="SELECT * FROM PRODUCT ORDER BY PID DESC";
	
	
	final String sql_selectAll_LPrice="SELECT * FROM PRODUCT ORDER BY PRICE DESC";
	final String sql_selectAll_HPrice="SELECT * FROM PRODUCT ORDER BY PRICE ASC";
	final String sql_selectAll_Pcnt="SELECT * FROM PRODUCT ORDER BY PCNT ASC";

	final String sql_insert="INSERT INTO PRODUCT VALUES((SELECT NVL(MAX(PID),0)+1 FROM PRODUCT),?,?,?,?,?,?,?,?,?)";
	
	
	ProductVO selectOneProduct(ProductVO vo) {
		Object[] args= {vo.getPid()};
		return jdbcTemplate.queryForObject(sql_selectOne,args,new ProductRowMapper());
		
	}
	List<ProductVO> selectAllProductCnt(ProductVO vo){
		return jdbcTemplate.query(sql_selectAll_Pcnt,new ProductRowMapper());	
	}
	
	List<ProductVO> selectAllProduct(ProductVO vo){
		
		if(vo.getPdetail().equals("low")) {
			return jdbcTemplate.query(sql_selectAll_LPrice,new ProductRowMapper());
		}
		else if(vo.getPdetail().equals("high")) {
			return jdbcTemplate.query(sql_selectAll_HPrice,new ProductRowMapper());
		}
		return jdbcTemplate.query(sql_selectAll,new ProductRowMapper());
		
	}
		
	boolean insertProduct(ProductVO vo) {
		
		System.out.println("insertProduct로그"+vo);
		jdbcTemplate.update(sql_insert,vo.getPname(),vo.getPrice(),vo.getPcnt(),vo.getPcom(),vo.getPmade(),vo.getPmat(),vo.getPsize(),vo.getPimg(),vo.getPdetail());
		
		return true;
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
		data.setPimg(rs.getString("PIMG"));
		data.setPdetail(rs.getString("PDETAIL"));
		return data;
	}
	
}
