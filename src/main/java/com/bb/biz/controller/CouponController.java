package com.bb.biz.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
		
		return "selectAllC.do";
	}

	@RequestMapping(value="/selectAllC.do")
	public String SellectAllCoupon(CouponVO cVO, Model model,HttpSession session) {
		
		cVO.setMid((String)session.getAttribute("member"));
		List<CouponVO> coupon = couponService.selectAllCoupon(cVO);
		
		for(CouponVO v: coupon) {
			if(v.getCode().equals("고객감사쿠폰20%")) {
				model.addAttribute("flag", 1);
			}
		}
		
		model.addAttribute("coupon", coupon);
		
		return "myCoupon.jsp";
	}
}
