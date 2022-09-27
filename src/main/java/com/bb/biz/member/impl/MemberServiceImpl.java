package com.bb.biz.member.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.bb.biz.member.MemberService;
import com.bb.biz.member.MemberVO;


public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public boolean insertMember(MemberVO vo) {
		return memberDAO.insertMember(vo);
		
	}

	@Override
	public MemberVO selectOneMember(MemberVO vo) {
		return memberDAO.selectOneMember(vo);
	}

	@Override
	public boolean updateMember(MemberVO vo) {
		return memberDAO.updateMember(vo);
		
	}

	@Override
	public boolean deleteMember(MemberVO vo) {
		return memberDAO.deleteMember(vo);
		
	}

}
