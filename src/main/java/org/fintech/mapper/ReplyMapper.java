package org.fintech.mapper;

import org.fintech.domain.ReplyVO;

public interface ReplyMapper {

	//신규 댓글 등록 처리
	public int insert(ReplyVO vo);
	
	//p384 	3/22
	public ReplyVO read(Long rno);		//특정 댓글 상세 읽기
	
	//p385 	3/22
	public int delete(Long rno);		//특정 댓글 삭제
	
	//p386 	3/22 
	public int update(ReplyVO reply);	//댓글 수정
	
	
}
//p382 	3/22