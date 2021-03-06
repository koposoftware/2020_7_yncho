package kr.co.hanacard.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.hanacard.member.vo.MemberVO;
import kr.co.hanacard.member.vo.OwncardVO;



@Repository // DB 작업하는 bean에는 @Repository로 붙이는가?
public class MemberDAOImpl implements MemberDAO{
	
	//마이바티스 연동을 위해, SqlSessionTemplet 객체가 있어야 한다.
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public kr.co.hanacard.member.vo.MemberVO login(MemberVO member) {
		
		MemberVO loginVO = sqlSession.selectOne("member.dao.MemberDAO.login", member);
		//selectOne("매퍼의 namespace + <select>태그의 id")
		
		return loginVO;
	}

	@Override
	public List<OwncardVO> getHanaList(String resiNum) {
		
		List<OwncardVO> hanaList = sqlSession.selectList("member.dao.MemberDAO.getHanaList", resiNum);
		//OwncardVO hanaList = sqlSession.selectOne("member.dao.MemberDAO.getHanaList", resiNum);
		//List<String> hanaList = sqlSession.selectList("member.dao.MemberDAO.getHanaList", resiNum);
		
		return hanaList;
	}
	
//	@Override
//	public List<String> getHanaList(String resiNum) {
//		
//		List<String> hanaList = sqlSession.selectList("member.dao.MemberDAO.getHanaList", resiNum);
//		
//		return hanaList;
//	}
	
	
	

	
}
