package com.bb.biz.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bb.biz.member.MemberService;
import com.bb.biz.member.MemberVO;
import com.bb.biz.member.impl.MemberDAO;

@Controller
@SessionAttributes("data")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String selectOneMember(Model model,MemberVO mVO,HttpSession session){

		mVO=memberService.selectOneMember(mVO);
		if(mVO==null) {
			return "login.jsp";
		}
		else {
			session.setAttribute("member", mVO.getMid());
			
			model.addAttribute("data", mVO);
			return "main.do";
		}

	}
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session,Model model) {
		session.invalidate();
		return "redirect:main.do";
	}
	
	@RequestMapping(value="/signUp.do",method=RequestMethod.POST)
	public String insertMember(MemberVO mVO) {
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
