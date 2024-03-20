package org.fintech.service;

import java.util.List;

import org.fintech.domain.BoardVO;
import org.fintech.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/*서비스 기능을 수행한다는 어노테이션*/
@Service
//클래스의 모든 필드를 매개변수로 하는 생성자를 자동으로 생성
@AllArgsConstructor
/* 콘솔창에 출력 */
@Log4j
//구현객체를 생성
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;

	//p205 	3/18
	@Override
	public void register(BoardVO board) {

		log.info("신규 게시물 등록................." + board);
		
		mapper.insertSelectKey(board);
		
	}

	@Override
	public BoardVO get(Long bno) {
		//207
		log.info("get.............." + bno);
		
		return mapper.read(bno);
	}

	
	//특정 게시물 수정 처리
	@Override
	public boolean modify(BoardVO board) { 
		//208 
		log.info("modify..............." + board);
		
		return mapper.update(board) == 1;
	}
	//특정 게시물 삭제 처리 
	@Override
	public boolean remove(Long bno) {
		//208 
		log.info("remove..............." + bno);
		
		return mapper.delete(bno) == 1;
	}

	
	@Override
	public List<BoardVO> getList() {
		//p206
		log.info("get List......................");
	
		return mapper.getList();
	}

	
}

//p200	3/18