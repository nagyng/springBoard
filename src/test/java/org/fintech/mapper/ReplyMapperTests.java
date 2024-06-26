package org.fintech.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.fintech.domain.Criteria;
import org.fintech.domain.ReplyVO;
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
public class ReplyMapperTests {

	//테스트 전에 해당 번호의 게시물이 존재하는지 반드시 확인할 것
	//Long 타입의 배열을 선언
	private Long[] bnoArr = { 379L, 376L, 375L, 374L, 373L };
	
	@Autowired
	private ReplyMapper mapper;
	
	@Ignore
	public void testCreate() {
		
		IntStream.rangeClosed(1, 10).forEach(i -> {
			
			ReplyVO vo = new ReplyVO();
			
			//게시물의 번호
			vo.setBno(bnoArr[ i % 5 ]);
			vo.setReply("댓글 테스트 " + i);
			vo.setReplyer("replyer" + i);
			
			mapper.insert(vo);
			 
		});
	}
	
	@Ignore  
	public void testMapper() {
		log.info(mapper);
	} 
	
	//p385  	3/22 
	@Ignore
	public void testRead() {
		
		Long targetRno = 11L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		log.info(vo);
		
	}
	
	//p386  	3/22
	@Ignore
	public void testDelete() {
		
		Long targetRno = 9L;
		
		mapper.delete(targetRno);
	}
	
	//p387  	3/22
	@Ignore
	public void testUpdate() {
		
		Long targetRno = 10L;
		//수정할 댓글 존재 여부 확인
		ReplyVO vo = mapper.read(targetRno);
		
		vo.setReply("Update Reply ");
		//댓글 수정 후 수정 건수를 변수에 대입 
		int count = mapper.update(vo);
		
		log.info("업데이트 COUNT: " + count);
	}
	
	//p388  	3/25
	//댓글 페이징 처리
	@Ignore
	public void testList() {
		
		Criteria cri = new Criteria();
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
		
		replies.forEach(reply -> log.info(reply));
	}
	
	//p431  	3/26
	//댓글 페이징 처리 테스트 
	@Ignore
	public void testList2() {
		//댓글 목록 1페이지 10개를 보여준다. 
		Criteria cri = new Criteria(1, 10);
		//특정 게시물 번호에 대한 댓글 목록을 가져온다.
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 379L);
		
		replies.forEach(reply -> log.info(reply));
		
	}
	
	
	
	
	
	
	
}
//p383 	3/22