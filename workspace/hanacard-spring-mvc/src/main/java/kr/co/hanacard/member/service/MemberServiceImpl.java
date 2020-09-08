package kr.co.hanacard.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hanacard.member.dao.MemberDAO;
import kr.co.hanacard.member.vo.MemberVO;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO login(MemberVO member) {
		
		return memberDAO.login(member);
	}

	@Override
	public List<String> getHanaList(String resiNum) {
		
		return memberDAO.getHanaList(resiNum);
	}
	
	

}
