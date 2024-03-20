package org.fintech.service;

import java.util.List;

import org.fintech.domain.BoardVO;

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
	public List<BoardVO> getList();
	
}
//p199 	3/18