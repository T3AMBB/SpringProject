package com.bb.biz.member;


public interface MemberService {
	boolean insertMember(MemberVO vo);
	MemberVO selectOneMember(MemberVO vo);
	MemberVO selectOneMember_CHECK(MemberVO vo);
	boolean updateMember(MemberVO vo);
	boolean deleteMember(MemberVO vo);
	boolean updateMileage(MemberVO vo);
}
