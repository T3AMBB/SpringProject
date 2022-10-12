package com.bb.biz.member.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.bb.biz.member.MemberVO;



@Repository("memberDAO")
public class MemberDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	final String sql_selectOne="SELECT * FROM MEMBER WHERE MID=? AND MPW=?";
	final String sql_selectOne_CHECK="SELECT * FROM MEMBER WHERE MID=?";
	final String sql_insert="INSERT INTO MEMBER (MID,MPW,MNAME,STREETADDRESS,ZIPCODE,ADDRESS,MPHONE) VALUES(?,?,?,?,?,?,?)";
	final String sql_update="UPDATE MEMBER SET MPW=? WHERE MID=?";
	final String sql_delete="DELETE MEMBER WHERE MID=? AND MPW=?";
	final String sql_updateMileage="UPDATE MEMBER SET MILEAGE=MILEAGE+? WHERE MID=?";
	
	
	public boolean updateMileage(MemberVO vo) {
		if(vo!=null && vo.getMid()!=null) {
		jdbcTemplate.update(sql_updateMileage,vo.getMileage(),vo.getMid());
		return true;
		}
		else {
			return false;
		}
	}
	
	boolean insertMember(MemberVO vo) {
		if(vo.getMid()!=null) {
		jdbcTemplate.update(sql_insert,vo.getMid(),vo.getMpw(),vo.getMname(),vo.getStreetaddress(),vo.getZipcode(),vo.getAddress(),vo.getMphone());
		return true;
		}
		else {
			return false;
		}
	}
	boolean deleteMember(MemberVO vo) {
		if(vo!=null && vo.getMpw()!=null) {
		jdbcTemplate.update(sql_delete,vo.getMid(),vo.getMpw());
		return true;
		}
		else {
			return false;
		}
	}
	boolean updateMember(MemberVO vo) {
		if(vo!=null && vo.getMid()!=null) {
		jdbcTemplate.update(sql_update,vo.getMpw(),vo.getMid());
		return true;
		}
		else {
			return false;
		}
	}
	MemberVO selectOneMember(MemberVO vo) {
		Object[] args= {vo.getMid(),vo.getMpw()};
		try {
			return jdbcTemplate.queryForObject(sql_selectOne,args,new MemberRowMapper());
		}
		catch(EmptyResultDataAccessException e) {
			return null;
		}
	}
	MemberVO selectOneMember_CHECK(MemberVO vo) {
		Object[] args= {vo.getMid()};
		try {
			return jdbcTemplate.queryForObject(sql_selectOne,args,new MemberRowMapper());
		}
		catch(EmptyResultDataAccessException e) {
			return null;
		}
	}

}
class MemberRowMapper implements RowMapper<MemberVO> {

	@Override
	public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		MemberVO data=new MemberVO();
		data.setMid(rs.getString("MID"));
		data.setMpw(rs.getString("MPW"));
		data.setMname(rs.getString("MNAME"));
		data.setStreetaddress(rs.getString("STREETADDRESS"));
		data.setZipcode(rs.getString("ZIPCODE"));
		data.setAddress(rs.getString("ADDRESS"));
		data.setMphone(rs.getString("MPHONE"));
		data.setMileage(rs.getInt("MILEAGE"));
		return data;
	}
	
}

