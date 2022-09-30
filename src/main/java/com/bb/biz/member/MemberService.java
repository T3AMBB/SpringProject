package com.bb.biz.member;


public interface MemberService {
	boolean insertMember(MemberVO vo);
	MemberVO selectOneMember(MemberVO vo);
	boolean updateMember(MemberVO vo);
	boolean deleteMember(MemberVO vo);
}
