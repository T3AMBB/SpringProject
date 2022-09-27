package com.bb.biz.buylist;

import java.util.List;

public interface BuylistService {
	boolean insertBuylist(BuylistVO vo);
	List<BuylistVO> selectAllBuylist(BuylistVO vo);
}
