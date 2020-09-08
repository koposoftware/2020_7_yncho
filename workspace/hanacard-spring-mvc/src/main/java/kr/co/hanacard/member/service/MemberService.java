package kr.co.hanacard.member.service;

import java.util.List;

import kr.co.hanacard.member.vo.MemberVO;

public interface MemberService {
	
	MemberVO login(MemberVO member);
	
	List<String> getHanaList(String resiNum);
}
