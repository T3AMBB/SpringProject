package com.bb.biz.product;

import java.util.List;

public interface ProductService {
	boolean insertProduct(ProductVO vo);
	ProductVO selectOneProduct(ProductVO vo);
	List<ProductVO> selectAllProduct(ProductVO vo);
	// List<ProductVO> selectAllProductPriceASC(ProductVO vo);
	// List<ProductVO> selectAllProductPriceDESC(ProductVO vo);
	// List<ProductVO> selectAllProductCnt(ProductVO vo);
}
