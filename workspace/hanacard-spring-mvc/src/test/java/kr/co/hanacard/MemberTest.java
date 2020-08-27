package kr.co.hanacard;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.hanacard.member.dao.MemberDAO;
import kr.co.hanacard.member.vo.MemberVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/*.xml"})
public class MemberTest {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Test
	public void 로그인테스트() throws Exception{
		
		MemberVO member = new MemberVO();
		member.setId("hello");
		member.setPassword("1234");
		
		MemberVO loginVO = memberDAO.login(member);
		assertNotNull(loginVO);
		
	}

}
