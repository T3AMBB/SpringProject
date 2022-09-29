package com.bb.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bb.biz.coupon.CouponService;
import com.bb.biz.coupon.CouponVO;

@Controller
public class CouponController {
	
	@Autowired
	private CouponService couponService;
	
	@RequestMapping(value="/insertC.do")
	public String InsertCoupon(CouponVO cVO) {
		
		couponService.insetCoupon(cVO);
		
		return "myCoupon.jsp";
	}

	@RequestMapping(value="/selectAllC.do")
	public String SellectAllCoupon(CouponVO cVO,Model model ) {
		
		List<CouponVO> coupon = couponService.selectAllCoupon(cVO);
		
		model.addAttribute("coupon", coupon);
		
		return "myCoupon.jsp";
	}
}
