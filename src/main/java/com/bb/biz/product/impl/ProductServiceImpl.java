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
	public ProductVO selectOneProduct(ProductVO vo) {
		return productdao.selectOneProduct(vo);
	}

	@Override
	public List<ProductVO> selectAllProduct(ProductVO vo) {
		return productdao.selectAllProduct(vo);
	}
	
	@Override
	public boolean insertProduct(ProductVO vo) {
		return productdao.insertProduct(vo);
	}
	@Override
	public boolean updateProduct(ProductVO vo) {
		return productdao.updateProduct(vo);
	}

}
