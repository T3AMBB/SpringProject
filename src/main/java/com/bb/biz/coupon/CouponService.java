package com.bb.biz.coupon;

import java.util.List;

public interface CouponService {
	boolean insetCoupon(CouponVO vo);
	boolean updateCoupon(CouponVO vo);
	List<CouponVO> selectAllCoupon(CouponVO vo);
	List<CouponVO> selectAllCoupon_STA(CouponVO vo);
	CouponVO selectOneCoupon(CouponVO vo);
}
