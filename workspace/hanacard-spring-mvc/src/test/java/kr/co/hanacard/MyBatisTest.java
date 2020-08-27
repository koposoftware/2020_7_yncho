package kr.co.hanacard;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.util.List;

import javax.sql.DataSource;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.hanacard.board.dao.BoardDAO;
import kr.co.hanacard.board.service.BoardService;
import kr.co.hanacard.board.vo.BoardVO;


@RunWith(SpringJUnit4ClassRunner.class) // 얘를 실행시키겠다(?)
@ContextConfiguration(locations= {"classpath:config/spring/spring-mvc.xml"})
public class MyBatisTest { // 객체를 가져오려면, spring-mvc.xml을 읽어야 한다. 

	@Autowired //spring-mvc.xml에 있는 id가 dataSource인 bean. 타입이 같아서 자동으로 주입된 듯!?
	private DataSource ds;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Autowired
	private BoardService boardService;
	
	@Ignore // @Test 어노테이션을 무시함.
	@Test
	public void ds테스트() throws Exception{
		//System.out.println(ds);
		assertNotNull(ds); //ds 객체가 null이 아닐 때 성공한 것이니까.
		//assertNull(ds); // null이기를 기대하는 값. 빨간색이면 null이 아니겠지.
	}
	
	@Ignore 
	@Test
	public void sqlSession테스트() throws Exception{ // 자기가 테스트하는거니까 보통 한글 많이 쓴다고 함
		assertNotNull(session);
	}
	
	@Ignore
	@Test
	public void 전체게시글조회테스트() throws Exception{
		//List<BoardVO> list = session.selectList("board.dao.BoardDAO.selectAll");
		
		//BoardDAO, BoardDAOImple(서비스객체)를 생성한 뒤 새로운 코드
		//List<BoardVO> list = boardDAO.selectAll(); //아..자동으로 자식 클래스에있는 메소드를 호출했지? 오버라이드하면

		//이젠 완벽히 서비스 객체로 db관련 로직을 처리한다. (맞나?)
		List<BoardVO> list = boardService.selectAllBoard();
		
		for(BoardVO board : list) {
			System.out.println(board);
		}
	}
	
	@Test
	public void 게시판상세Test() throws Exception{
		BoardVO board = boardDAO.selectByNo(1);
		System.out.println(board);
		
	}
	
}
