package org.fintech.controller;

import java.util.List;

import org.fintech.domain.Criteria;
import org.fintech.domain.ReplyPageDTO;
import org.fintech.domain.ReplyVO;
import org.fintech.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

//해당 클래스가 REST방식으로 처리된다는 어노테이션
@RestController
//클라이언트가 http://localhost:8080/replies/* 요청처리
@RequestMapping("/replies/")
//모든 필드를 매개변수로 하는 생성자를 자동으로 생성
@AllArgsConstructor
@Log4j
public class ReplyController {

	//자동주입
	@Autowired
	private ReplyService service;
	
	//신규 댓글 등록 처리
	@PostMapping(value="/new",
			     //모든 클라이언트의 요청중에서 데이터가
			     //json 형태로 들어오는 URL만 서버가 처리한다는 선언
			     consumes="application/json",
			     //서버가 클라이언트에게 응답처리시 텍스트 형태로 응답
			     produces= {MediaType.TEXT_PLAIN_VALUE})
	//서버가 클라이언트에게 응답처리시 데이터 + Http상태코드값을
	//함께 전송
	public ResponseEntity<String> create(
			//json 형태의 데이터를 자바클래스 형태로 매핑
			@RequestBody ReplyVO vo){
		
		log.info("ReplyVO:" + vo);
		
		//신규 댓글 등록 처리 완료
		int insertCount = service.register(vo);
		
		log.info("댓글 등록 건수:" + insertCount);
		
		//삼항연산자를 사용하여 Http상태코드값과 메시지를 전송
		return insertCount == 1 ?
			new ResponseEntity<>("success!",HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	
	
	//p395  	3/25
	//특정 게시물의 댓글 목록 확인 
	@GetMapping(value = "/pages/{bno}/{page}",		// {} : 매개변수 
			//클라이언트 응답 데이터 형식 선언 (XML, JSON)
			produces = {
					MediaType.APPLICATION_XHTML_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	//p435		3/26
	public ResponseEntity<ReplyPageDTO> getList(
			//@PathVariable : 전달되는 매개변수 값을 가져온다.
			@PathVariable("page") int page,
			@PathVariable("bno") Long bno) {
		
		log.info("getList() 실행");
		
		Criteria cri = new Criteria(page,10);
		
		log.info("cri 정보:" + cri);
		
		//정상적으로 실행되면 200번 상태코드값,댓글 리스트를
		//리턴
		return new ResponseEntity<>(service.getListPage(cri,bno),HttpStatus.OK);
	}
	
	
	
	//p397  	3/26
	//댓글 조회
	@GetMapping(value = "/{rno}", 
				produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE
				}) 
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno) {
		
		log.info("get: " + rno);
		
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
		
	}
	//댓글 삭제
	@DeleteMapping(value = "/{rno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {

		log.info("remove: " + rno);
		
		return service.remove(rno) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//댓글 수정
	@RequestMapping(value="/{rno}",
			        //PUT : 전체항목을 수정시 사용
			        //PATCH: 일부를 수정시 사용
			        method= {RequestMethod.PATCH,
			        		 RequestMethod.PUT},
			        //클라이언트의 요청중 JSON형태만 처리
			        consumes="application/json",
			        produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody ReplyVO vo,
			@PathVariable("rno") Long rno){
		
		//댓글번호를 ReplyVO 클래스의 필드에 대입
		vo.setRno(rno);
		
		return service.modify(vo) == 1 ?
				new ResponseEntity<>("success",HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	
	 
	
	
	
	
	
	
}
//p392  	3/25