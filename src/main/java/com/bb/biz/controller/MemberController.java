package com.bb.biz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bb.biz.coupon.CouponService;
import com.bb.biz.coupon.CouponVO;
import com.bb.biz.member.MemberService;
import com.bb.biz.member.MemberVO;

@Controller
@SessionAttributes("user")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private CouponService couponService;
	
	  @RequestMapping(value="/naverLogin.do")
	   public String naverLogin(MemberVO mvo, MemberVO mVO,HttpSession session, HttpServletRequest request, Model model){
	     
		  mvo.setMid(request.getParameter("mid"));
	      mVO=memberService.selectOneMember_CHECK(mvo);
	      if(mVO == null) {
	         model.addAttribute("mname",request.getParameter("mname"));
	         model.addAttribute("mid",request.getParameter("mid"));
	         return "signUp.jsp";
	      }
	      session.setAttribute("member", mVO.getMid());
	      System.out.println("네이버 로그인 성공");
	      model.addAttribute("user", mVO);
	      return "main.do";
	   }
	   @RequestMapping(value="/kakaoLogin.do")
	   public String kakaoLogin(MemberVO mvo, MemberVO mVO,HttpSession session, HttpServletRequest request, Model model){
		  
		   mvo.setMid(request.getParameter("mid")); 
		   mVO=memberService.selectOneMember_CHECK(mvo);
		      if(mVO == null) {
		         model.addAttribute("mname",request.getParameter("mname"));
		         model.addAttribute("mid",request.getParameter("mid"));
		         return "signUp.jsp";
		      }
		      session.setAttribute("member", mVO.getMid());
		      System.out.println("카카오 로그인 성공");
		      model.addAttribute("user", mVO);
		      return "main.do";
		   }
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String selectOneMember(Model model,MemberVO mVO,HttpSession session){

		mVO=memberService.selectOneMember(mVO);
		if(mVO==null) {
			return "login.jsp";
		}
		else {
			session.setAttribute("member", mVO.getMid());
			
			model.addAttribute("user", mVO);
			return "main.do";
		}

	}
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session,Model model) {
		session.invalidate();
		return "redirect:main.do";
	}
	
	@RequestMapping(value="/signUp.do",method=RequestMethod.POST)
	public String insertMember(MemberVO mVO,CouponVO cVO) {
		
		cVO.setMid(mVO.getMid());
		cVO.setCode("회원가입 10% 쿠폰");
		cVO.setDcrate(0.9);
		couponService.insetCoupon(cVO);	
		memberService.insertMember(mVO);
		
		return "redirect:main.do";

	}
	
	@RequestMapping(value="/signUp.do",method=RequestMethod.GET)
	public String insertMember() {
		return "signUp.jsp";
	}
	
	@RequestMapping(value="/updateM.do",method=RequestMethod.POST)
	public String updateMember(Model model,@ModelAttribute("data")MemberVO vo,HttpSession session){
		if(vo != null) {
			memberService.updateMember(vo);
		}
		return "myPage.jsp";
	}
	
	@RequestMapping(value="/deleteM.do",method=RequestMethod.GET)
	public String deleteMember(@ModelAttribute("data")MemberVO mVO,HttpSession session ) {

		if(mVO != null) {
			
			memberService.deleteMember(mVO);
			session.invalidate();
			System.out.println("만료된회원: "+mVO);
		}
		return "redirect:main.do";
	}
	
	@RequestMapping("/mypage.do")
	public String mypage(MemberVO mVO) {
		
		if(mVO != null) {
			return "myPage.jsp";
		}
		else {
			return "main.do";
		}	
		
	}
	
}
