package com.bb.biz.product;

import java.util.List;

public interface ProductService {
	boolean insert(ProductVO vo);
	ProductVO selectOne(ProductVO vo);
	List<ProductVO> selectAll(ProductVO vo);
}