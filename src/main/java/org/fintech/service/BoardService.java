package org.fintech.service;

import java.util.List;

import org.fintech.domain.BoardVO;
import org.fintech.domain.Criteria;

public interface BoardService {

	//신규 게시물 등록
	public void register(BoardVO board);
	
	//특정 게시물 번호에 대한 상세내역 
	public BoardVO get(Long bno);
	
	//특정 게시물 번호 수정 처리
	public boolean modify(BoardVO board);
	
	//특정 게시물 번호 삭제 처리
	public boolean remove(Long bno);
	
	//게시물 목록 조회 처리
	//public List<BoardVO> getList();
	
	//게시물 페이징 처리
	//p299  	3/20
	public List<BoardVO> getList(Criteria cri);
	
	//p323  	3/21
	//전체 행 수 구하기
	public int getTotal(Criteria cri);
	
	
}
//p199  	3/18