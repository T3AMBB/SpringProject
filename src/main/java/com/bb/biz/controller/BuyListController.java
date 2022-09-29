package com.bb.biz.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bb.biz.buylist.BuylistService;
import com.bb.biz.buylist.BuylistVO;
import com.bb.biz.coupon.CouponService;
import com.bb.biz.coupon.CouponVO;
import com.bb.biz.member.MemberService;
import com.bb.biz.member.MemberVO;
import com.bb.biz.member.impl.MemberDAO;

@Controller
public class BuyListController {
	
	@Autowired
	private BuylistService buylistService;
	@Autowired
	private CouponService couponService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/insertB.do")
	public String InsertBuylist(BuylistVO bVO, CouponVO cVO, MemberVO mVO, Model model, HttpSession session) {

		if(cVO!=null) {
			couponService.updateCoupon(cVO);
		}
		if(mVO!=null) {
//			memberService.updateMileage(mVO);
		}
		
		buylistService.insertBuylist(bVO);
		
		model.addAttribute("buyProduct", bVO); 

		/*
		 * List cart =(List)session.getAttribute("cart");
		 * session.removeAttribute("cart");
		 */
		
		return "success.jsp";
	}
	
	@RequestMapping(value="/selectAllB.do")
	public String SelectAllBuylist(BuylistVO bVO, Model model) {
		List<BuylistVO> buylist =buylistService.selectAllBuylist(bVO);
		
		model.addAttribute("buylist", buylist);
		return "myBuylist.jsp";

	}
}