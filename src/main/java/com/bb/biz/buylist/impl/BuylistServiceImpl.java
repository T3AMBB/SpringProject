package com.bb.biz.buylist.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bb.biz.buylist.BuylistService;
import com.bb.biz.buylist.BuylistVO;

public class BuylistServiceImpl implements BuylistService{
	
	@Autowired
	private BuylistDAO buylistDAO;
	
	@Override
	public boolean insertBuylist(BuylistVO vo) {
		return buylistDAO.insertBuylist(vo);
	}

	@Override
	public List<BuylistVO> selectAllBuylist(BuylistVO vo) {
		return buylistDAO.selectAllBuylist(vo);
	}
	
}
