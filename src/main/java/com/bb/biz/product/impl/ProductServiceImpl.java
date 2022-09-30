package com.bb.biz.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bb.biz.product.ProductService;
import com.bb.biz.product.ProductVO;

@Service("ProductService")
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productdao;
	
	@Override
	public ProductVO selectOne(ProductVO vo) {
		return null;
	}

	@Override
	public List<ProductVO> selectAll(ProductVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public boolean insert(ProductVO vo) {

		productdao.insertProduct(vo);
		return true;
	}

}
