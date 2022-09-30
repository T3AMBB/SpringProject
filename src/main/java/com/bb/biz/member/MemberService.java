package com.bb.biz.member;


public interface MemberService {
	boolean updateMileage(MemberVO vo);
	boolean insertMember(MemberVO vo);
	MemberVO selectOneMember(MemberVO vo);
	boolean updateMember(MemberVO vo);
	boolean deleteMember(MemberVO vo);
}
