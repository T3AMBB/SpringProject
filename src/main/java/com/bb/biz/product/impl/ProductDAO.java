package com.bb.biz.product.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

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

	


	final String sql_selectAll_LPrice="SELECT * FROM PRODUCT WHERE PNAME LIKE '%'||?||'%' "
			+ "AND PCOM LIKE '%'||?||'%' AND PMADE LIKE '%'||?||'%' AND PMAT LIKE '%'||?||'%' "
			+ "AND PRICE BETWEEN ? AND ? AND PSIZE BETWEEN ? AND ? ORDER BY PRICE ASC";
	final String sql_selectAll_HPrice="SELECT * FROM PRODUCT WHERE PNAME LIKE '%'||?||'%' "
			+ "AND PCOM LIKE '%'||?||'%' AND PMADE LIKE '%'||?||'%' AND PMAT LIKE '%'||?||'%' "
			+ "AND PRICE BETWEEN ? AND ? AND PSIZE BETWEEN ? AND ? ORDER BY PRICE DESC";

	final String sql_selectAll_Pcnt="SELECT * FROM PRODUCT ORDER BY PCNT ASC";
	final String sql_selectAll_Pname="SELECT * FROM PRODUCT WHERE PNAME LIKE '%'||?||'%' ORDER BY PID ASC";

	final String sql_insert="INSERT INTO PRODUCT VALUES((SELECT NVL(MAX(PID),0)+1 FROM PRODUCT),?,?,?,?,?,?,?,?,?)";

	final String sql_update="UPDATE PRODUCT SET PCNT=PCNT-? WHERE PID=?";


	boolean updateProduct(ProductVO vo) { // 재고 차감

		Object[] args= {vo.getPcnt(),vo.getPid()};
		jdbcTemplate.update(sql_update,args);
		return true;
	}

	ProductVO selectOneProduct(ProductVO vo) {
		Object[] args= {vo.getPid()};
		return jdbcTemplate.queryForObject(sql_selectOne,args,new ProductRowMapper());
	}

	List<ProductVO> selectAllProductCnt(ProductVO vo){

		return jdbcTemplate.query(sql_selectAll_Pcnt,new ProductRowMapper());	
	}

	List<ProductVO> selectAllProduct(ProductVO vo){
		Object[] args= {vo.getPname(),vo.getPrice(),vo.getPrice2(),vo.getPsize(),vo.getPsize2()};
		ArrayList<String> pmat;
		ArrayList<String> pmade;
		ArrayList<String> pcom;

		if(vo.getPmat1()==null) {
			pmat = new ArrayList<String>(); 
		}
		else {
			pmat = vo.getPmat1();
		}

		if(vo.getPmade1()==null) {
			pmade = new ArrayList<String>(); 
		}
		else {
			pmade = vo.getPmade1();
		}

		if(vo.getPcom1()==null) {
			pcom = new ArrayList<String>(); 
		}
		else {
			pcom = vo.getPcom1();
		}

		if(vo.getPdetail()==null) { // 아래 equals 비교시 pdetail이 null이면 오류 발생하므로, null이라면 공백으로 설정해둠
			vo.setPdetail("");
		}

		if(vo.getPdetail().equals("low")) { // 낮은가격순
			String sql_selectAll_LPrice="SELECT * FROM PRODUCT WHERE PNAME LIKE '%'||?||'%' "
					+ "AND PRICE BETWEEN ? AND ? AND PSIZE BETWEEN ? AND ? ";
			//			+ "AND PCOM LIKE '%'||?||'%' AND PMADE LIKE '%'||?||'%' AND PMAT LIKE '%'||?||'%' "

			//			if(pname.size()>0) {
			//				for(int i=0; i < pname.size();i++) {
			//					
			//					System.out.println("로그: "+pname.get(i));
			//					if(pname.get(i)!=null) {
			//						if(pname.get(i).equals("")) {
			//								
			//						}
			//						else {
			//							sql_selectSearch += "OR PNAME LIKE '%'||"+"'"+pname.get(i)+"'"+"||'%' ";
			//						}
			//					}
			//					
			//					
			//
			//
			//				}
			//
			//			}
			if(!pmat.isEmpty()) { // 재질 배열에 값이 존재한다면(재질 필터를 검색했다면)
				System.out.println("pmat: "+ pmat);
				for(int i=0; i < pmat.size();i++) {

					if(i==0) { // 배열의 첫번째 요소는 sql문을 AND로 시작
						sql_selectAll_LPrice += "AND (PMAT LIKE '%'||"+"'"+pmat.get(i)+"'"+"||'%' ";
						continue; // 첫번째 요소만 AND로 시작해야하므로 아래 명령을 무시하고 다음 반복을 실행하도록함
					}

					if(pmat.get(i)!=null) { // 두개 이상 검색했을때
						sql_selectAll_LPrice += "OR PMAT LIKE '%'||"+"'"+pmat.get(i)+"'"+"||'%' ";
					}
				}
				sql_selectAll_LPrice += ")";
				System.out.println("재질 로그: "+sql_selectAll_LPrice);
			}
			
			if(!pcom.isEmpty()) { // 제조사 배열에 값이 존재한다면(제조사 필터를 검색했다면)
				System.out.println("pcom: "+ pcom);
				for(int i=0; i < pcom.size();i++) {

					if(i==0) {
						sql_selectAll_LPrice += "AND (PCOM LIKE '%'||"+"'"+pcom.get(i)+"'"+"||'%' ";
						continue;
					}
					if(pcom.get(i)!=null) {
						sql_selectAll_LPrice += "OR PCOM LIKE '%'||"+"'"+pcom.get(i)+"'"+"||'%' ";
					}
				}
				sql_selectAll_LPrice += ")";
				System.out.println("제조사 로그: "+sql_selectAll_LPrice);
			}

			if(!pmade.isEmpty()) { // 원산지 배열에 값이 존재한다면(원산지 필터를 검색했다면)
				System.out.println("pmade: "+ pmade);
				for(int i=0; i < pmade.size();i++) {

					if(i==0) {
						sql_selectAll_LPrice += "AND (PMADE LIKE '%'||"+"'"+pmade.get(i)+"'"+"||'%' ";
						continue;
					}
					if(pmade.get(i)!=null) {
						sql_selectAll_LPrice += "OR PMADE LIKE '%'||"+"'"+pmade.get(i)+"'"+"||'%' ";
					}
				}
				sql_selectAll_LPrice += ")";
				System.out.println("원산지 로그: "+sql_selectAll_LPrice);

			}

			sql_selectAll_LPrice += "ORDER BY PRICE ASC";
			System.out.println("최종 로그: "+sql_selectAll_LPrice);
			return jdbcTemplate.query(sql_selectAll_LPrice,new ProductRowMapper(),args);
		}
		else if(vo.getPdetail().equals("high")) { // 높은가격순
			String sql_selectAll_HPrice="SELECT * FROM PRODUCT WHERE PNAME LIKE '%'||?||'%' "
					+ "AND PRICE BETWEEN ? AND ? AND PSIZE BETWEEN ? AND ? ";
			//			+ "AND PCOM LIKE '%'||?||'%' AND PMADE LIKE '%'||?||'%' AND PMAT LIKE '%'||?||'%' "

			//			if(pname.size()>0) {
			//				for(int i=0; i < pname.size();i++) {
			//					
			//					System.out.println("로그: "+pname.get(i));
			//					if(pname.get(i)!=null) {
			//						if(pname.get(i).equals("")) {
			//								
			//						}
			//						else {
			//							sql_selectSearch += "OR PNAME LIKE '%'||"+"'"+pname.get(i)+"'"+"||'%' ";
			//						}
			//					}
			//					
			//					
			//
			//
			//				}
			//
			//			}
			if(!pmat.isEmpty()) {
				System.out.println("pmat: "+ pmat);
				for(int i=0; i < pmat.size();i++) {

					if(i==0) {
						sql_selectAll_HPrice += "AND (PMAT LIKE '%'||"+"'"+pmat.get(i)+"'"+"||'%' ";
						continue;
					}

					if(pmat.get(i)!=null) {
						sql_selectAll_HPrice += "OR PMAT LIKE '%'||"+"'"+pmat.get(i)+"'"+"||'%' ";
					}
				}
				sql_selectAll_HPrice += ")";
				System.out.println("재질 로그: "+sql_selectAll_HPrice);
			}
			
			if(!pcom.isEmpty()) {
				System.out.println("pcom: "+ pcom);
				for(int i=0; i < pcom.size();i++) {

					if(i==0) {
						sql_selectAll_HPrice += "AND (PCOM LIKE '%'||"+"'"+pcom.get(i)+"'"+"||'%' ";
						continue;
					}
					if(pcom.get(i)!=null) {
						sql_selectAll_HPrice += "OR PCOM LIKE '%'||"+"'"+pcom.get(i)+"'"+"||'%' ";
					}
				}
				sql_selectAll_HPrice += ")";
				System.out.println("제조사 로그: "+sql_selectAll_HPrice);
			}

			if(!pmade.isEmpty()) {
				System.out.println("pmade: "+ pmade);
				for(int i=0; i < pmade.size();i++) {

					if(i==0) {
						sql_selectAll_HPrice += "AND (PMADE LIKE '%'||"+"'"+pmade.get(i)+"'"+"||'%' ";
						continue;
					}
					if(pmade.get(i)!=null) {
						sql_selectAll_HPrice += "OR PMADE LIKE '%'||"+"'"+pmade.get(i)+"'"+"||'%' ";
					}
				}
				sql_selectAll_HPrice += ")";
				System.out.println("원산지 로그: "+sql_selectAll_HPrice);

			}

			sql_selectAll_HPrice += "ORDER BY PRICE DESC";
			System.out.println("최종 로그: "+sql_selectAll_HPrice);
			return jdbcTemplate.query(sql_selectAll_HPrice,new ProductRowMapper(),args);
		}
		else if(vo.getPdetail().equals("pname")) {
			return jdbcTemplate.query(sql_selectAll_Pname,new ProductRowMapper(),vo.getPname());
		}
		else if(vo.getPdetail().equals("search")) { // 필터검색
			System.out.println(pcom);
			System.out.println(pmade);
			System.out.println(pmat);
			String sql_selectSearch="SELECT * FROM PRODUCT WHERE PNAME LIKE '%'||?||'%' "
					+ "AND PRICE BETWEEN ? AND ? AND PSIZE BETWEEN ? AND ? ";
			//			+ "AND PCOM LIKE '%'||?||'%' AND PMADE LIKE '%'||?||'%' AND PMAT LIKE '%'||?||'%' "

			//			if(pname.size()>0) {
			//				for(int i=0; i < pname.size();i++) {
			//					
			//					System.out.println("로그: "+pname.get(i));
			//					if(pname.get(i)!=null) {
			//						if(pname.get(i).equals("")) {
			//								
			//						}
			//						else {
			//							sql_selectSearch += "OR PNAME LIKE '%'||"+"'"+pname.get(i)+"'"+"||'%' ";
			//						}
			//					}
			//					
			//					
			//
			//
			//				}
			//
			//			}
			if(!pmat.isEmpty()) {
				System.out.println("pmat: "+ pmat);
				for(int i=0; i < pmat.size();i++) {

					if(i==0) {
						sql_selectSearch += "AND (PMAT LIKE '%'||"+"'"+pmat.get(i)+"'"+"||'%' ";
						continue;
					}

					if(pmat.get(i)!=null) {
						sql_selectSearch += "OR PMAT LIKE '%'||"+"'"+pmat.get(i)+"'"+"||'%' ";
					}
				}
				sql_selectSearch += ")";
				System.out.println("재질 로그: "+sql_selectSearch);
			}
			
			if(!pcom.isEmpty()) {
				System.out.println("pcom: "+ pcom);
				for(int i=0; i < pcom.size();i++) {

					if(i==0) {
						sql_selectSearch += "AND (PCOM LIKE '%'||"+"'"+pcom.get(i)+"'"+"||'%' ";
						continue;
					}
					if(pcom.get(i)!=null) {
						sql_selectSearch += "OR PCOM LIKE '%'||"+"'"+pcom.get(i)+"'"+"||'%' ";
					}
				}
				sql_selectSearch += ")";
				System.out.println("제조사 로그: "+sql_selectSearch);
			}

			if(!pmade.isEmpty()) {
				System.out.println("pmade: "+ pmade);
				for(int i=0; i < pmade.size();i++) {

					if(i==0) {
						sql_selectSearch += "AND (PMADE LIKE '%'||"+"'"+pmade.get(i)+"'"+"||'%' ";
						continue;
					}
					if(pmade.get(i)!=null) {
						sql_selectSearch += "OR PMADE LIKE '%'||"+"'"+pmade.get(i)+"'"+"||'%' ";
					}
				}
				sql_selectSearch += ")";
				System.out.println("원산지 로그: "+sql_selectSearch);

			}

			
			sql_selectSearch += "ORDER BY PID DESC";
			System.out.println("최종 로그: "+sql_selectSearch);
			return jdbcTemplate.query(sql_selectSearch, new ProductRowMapper(), args);
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
