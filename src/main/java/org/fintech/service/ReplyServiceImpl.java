package org.fintech.service;

import java.util.List;

import org.fintech.domain.Criteria;
import org.fintech.domain.ReplyPageDTO;
import org.fintech.domain.ReplyVO;
import org.fintech.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

//(서비스)구현객체
@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper mapper;
	
	//신규댓글입력 ReplyMapper 인터페이스에 처리 (insert 메서드)
	@Override
	public int register(ReplyVO vo) {
		// TODO Auto-generated method stub
		
		log.info("레지스터........." + vo);
		
		return mapper.insert(vo);
	
	}

	//특정댓글상세 ReplyMapper 인터페이스에 처리 
	@Override
	public ReplyVO get(Long rno) {
		// TODO Auto-generated method stub

		log.info("겟........." + rno);
		
		return mapper.read(rno);
		
	}

	//특정댓글수정 ReplyMapper 인터페이스에 처리 
	@Override
	public int modify(ReplyVO vo) {
		// TODO Auto-generated method stub

		log.info("모디파이........." + vo);
		
		return mapper.update(vo);
	}

	//특정댓글삭제 ReplyMapper 인터페이스에 처리 
	@Override
	public int remove(Long rno) {
		// TODO Auto-generated method stub

		log.info("리무브........." + rno);
		
		return mapper.delete(rno);
		
	}

	//댓글목록 ReplyMapper 인터페이스에 처리 
	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		// TODO Auto-generated method stub

		log.info("get Ready List of a Board " + bno);
		
		return mapper.getListWithPaging(cri, bno);
		
	}
	//스프링 4.3을 이용하는 경우 (생략) 

	
	//p434		3/26
	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		
		return new ReplyPageDTO(
				mapper.getCountByBno(bno),
				mapper.getListWithPaging(cri, bno)
				);
	}
	
	

}
//p389  	3/25