package kr.co.hanacard.member.dao;

import java.util.List;

import kr.co.hanacard.member.vo.MemberVO;
import kr.co.hanacard.member.vo.OwncardVO;

public interface MemberDAO {

	MemberVO login(MemberVO member);
	
	List<OwncardVO> getHanaList(String resiNum);
	//OwncardVO getHanaList(String resiNum);
	//List<String> getHanaList(String resiNum);

}
