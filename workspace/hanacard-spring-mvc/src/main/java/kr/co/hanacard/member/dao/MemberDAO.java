package kr.co.hanacard.member.dao;

import java.util.List;

import kr.co.hanacard.member.vo.MemberVO;

public interface MemberDAO {

	MemberVO login(MemberVO member);
	
	List<String> getHanaList(String resiNum);

}
