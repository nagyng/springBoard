package org.fintech.mapper;

import java.util.List;

import org.fintech.domain.BoardVO;
import org.fintech.domain.Criteria;
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
public class BoardMapperTests {

	//인터페이스를 DI(Dependency Injection)의존적주입 
	@Autowired
	private BoardMapper mapper;
	
	@Ignore
	public void testGetList() {
		//getList()로 데이터가져오기 forEach()반복문 board변수에넣는다 게시물내역출력
		mapper.getList().forEach(board -> log.info(board));
	}
	
	//p191  Insert
	@Ignore
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글 select key");
		board.setContent("새로 작성하는 내용 select key");
		board.setWriter("홍길동");
		
		//BoardMapper.java 인터페이스에 있는 insert 추상메서드가 호출되면 BoardMapper.xml 의 id가 insert 인 mybatis 가 동작한다. 
		mapper.insert(board); 
		
		log.info(board);
	}
	
	//p192  InsertSelectKey
	@Ignore
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setTitle("반품요청");
		board.setContent("빠른 수거");
		board.setWriter("이순신");
		
		//BoardMapper.java 인터페이스에 있는 insert 추상메서드가 호출되면 BoardMapper.xml 의 id가 insert 인 mybatis 가 동작한다. 
		mapper.insertSelectKey(board);
		
		log.info("현재 등록한 게시물번호: " + board.getBno());
	}
	
	//p194  Read
	@Ignore
	public void testRead() {
		
		//존재하는 게시물  번호로 테스트
		BoardVO board = mapper.read(5L);
		
		log.info(board);
	}
	
	//p195  Delete 
	@Ignore
	public void testDelete() {
		
		log.info("삭제건수: " + mapper.delete(2L));
	}

	//p197  Update 
	@Ignore
	public void testUpdate() {
		
		BoardVO board = new BoardVO();
		//실행 전 존재하는 번호인지 확인할 것 
		board.setBno(5L);
		board.setTitle("수정된 제목");
		board.setContent("수정된 내용");
		board.setWriter("구준표");
		
		int count = mapper.update(board);
		log.info("수정건수: " + count);
	}
	
	//p295  	3/20
	//페이징 처리
	@Ignore
	public void testPaging() {
		
		// 1페이지 10개씩 보여주는 Criteria 인스턴스 생성
		Criteria cri = new Criteria();
		//list 변수에 1페이지 게시물 내역이 대입
		List<BoardVO> list = mapper.getListWithPaging(cri);
		//반복문으로 콘솔창에 출력
		list.forEach(board -> log.info(board)); 
	}
	
	//p297  	3/20
	//페이징 처리 - 수정 
	@Test
	public void testPaging2() {
		 
		Criteria cri = new Criteria();
		//글 10개씩 2페이지
		cri.setPageNum(2);
		cri.setAmount(10);
		 
		List<BoardVO> list = mapper.getListWithPaging(cri);
		 
		list.forEach(board -> log.info(board.getBno())); 
	}
	
	
	
	
}
