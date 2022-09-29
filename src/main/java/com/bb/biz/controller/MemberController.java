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

public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String selectOne(Model model,MemberVO mVO,HttpSession session){

		mVO=memberService.selectOneMember(mVO);
		if(mVO==null) {
			return "login.jsp";
		}
		else {
			session.setAttribute("member", mVO.getMid());
			
			model.addAttribute("data", mVO);
			return "redirect:main.do";
		}

	}
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(@ModelAttribute("data")MemberVO mVO,HttpSession session,Model model) {
		
		
		session.invalidate();
		
		return "redirect:main.do";

	}
	
	
	@RequestMapping(value="/signUp.do",method=RequestMethod.POST)
	public String signUp(MemberVO mVO) {
		memberService.insertMember(mVO);
		
		return "redirect:main.do";

	}
	@RequestMapping(value="/updateM.do",method=RequestMethod.POST)
	public String update(Model model,@ModelAttribute("data")MemberVO vo,HttpSession session){
		if(vo != null) {
			
			memberService.updateMember(vo);
			
//			model.addAttribute("data", vo);
			
			
		}
		else {
			return"signin.jsp";
		}
		return "redirect:main.do";
	}
	@RequestMapping(value="/deleteM.do",method=RequestMethod.GET)
	public String delete(@ModelAttribute("data")MemberVO mVO,HttpSession session ) {

		if(mVO != null) {
			
			memberService.deleteMember(mVO);
			session.invalidate();
			System.out.println("만료된회원: "+mVO);
		}
		return "redirect:main.do";
	}
	@RequestMapping("/mypage.do")
	public String mypage(MemberVO mVO,MemberDAO dao,HttpSession session) {
		
		if(mVO != null) {
			return "mypage.jsp";
		}
		else {
			return "main.do";
		}	
		
	}
	
	

}
