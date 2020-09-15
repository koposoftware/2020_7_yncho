package kr.co.hanacard.member.service;

import java.util.List;

import kr.co.hanacard.member.vo.MemberVO;
import kr.co.hanacard.member.vo.OwncardVO;

public interface MemberService {
	
	MemberVO login(MemberVO member);
	
	List<OwncardVO> getHanaList(String resiNum);
	//OwncardVO getHanaList(String resiNum);
	//List<> getHanaList(String resiNum);
}
