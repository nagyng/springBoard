package org.fintech.service;

import static org.junit.Assert.assertNotNull;

import org.fintech.domain.BoardVO;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Autowired
	private BoardService service;
	
	@Ignore
	public void testExist() {
		
		log.info(service);
		
		//BoardServiceImpl.java 클래스가 제대로 Bean생성이 되었는지 확인하는 메서드
		assertNotNull(service);
	}
	
	//p205
	@Ignore
	public void testRegister() {
		
		BoardVO board = new BoardVO();
		board.setTitle("새 글");
		board.setContent("새 내용");
		board.setWriter("글쓴이");
		
		service.register(board);
		
		log.info("새 게시글의 번호: " + board.getBno());
		
	}
	
	//206	
	@Ignore
	public void testGetList() {
		
		//게시물 목록을 리턴받아 반복문을 사용해 콘솔창에 출력.
		service.getList().forEach(board -> log.info(board));
	}
	
	//207
	//특정 게시물 상세보기
	@Ignore
	public void testGet() {
							//1L = bno 게시물번호가 1 
		log.info(service.get(1L));
	}
	
	//209
	@Ignore
	public void testDelete() {
		
		//게시물 번호의 존재여부를 확인하고 테스트할 것 
		log.info("삭제 결과: " + service.remove(2L));
	}
	//209
	@Test 
	public void testUpdate() {

		//게시물 번호의 존재여부를 확인
		BoardVO board = service.get(6L);
		
		if(board == null) {
			return;	//void 선언 시 return 은 프로그램 종료.
		}
		
		board.setTitle("제목을 수정함");
		log.info("수정 결과: " + service.modify(board));
	}
	
	
	
	
}
//	3/18


