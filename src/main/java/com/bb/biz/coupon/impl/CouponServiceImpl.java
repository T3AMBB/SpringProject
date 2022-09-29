package com.bb.biz.coupon.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bb.biz.coupon.CouponService;
import com.bb.biz.coupon.CouponVO;

@Service("CouponService")
public class CouponServiceImpl implements CouponService{

	@Autowired
	private CouponDAO couponDAO;
	
	@Override
	public boolean insetCoupon(CouponVO vo) {
		return couponDAO.insertCoupon(vo);
	}

	@Override
	public boolean updateCoupon(CouponVO vo) {
		return couponDAO.updateCoupon(vo);
	}

	@Override
	public List<CouponVO> selectAllCoupon(CouponVO vo) {
		return couponDAO.selectAllCoupon(vo);
	}

}
