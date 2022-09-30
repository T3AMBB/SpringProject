package com.bb.biz.product;

import java.util.List;

public interface ProductService {
	boolean insertProduct(ProductVO vo);
	ProductVO selectOneProduct(ProductVO vo);
	List<ProductVO> selectAllProduct(ProductVO vo);
}
