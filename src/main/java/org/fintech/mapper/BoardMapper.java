package org.fintech.mapper;

import java.util.List;

import org.fintech.domain.BoardVO;
import org.fintech.domain.Criteria;

public interface BoardMapper {

	//게시물 내역 조회
	//@Select("select * from tbl_board where bno > 0")
	public List<BoardVO> getList();

	//p190		3/18 
	//신규 게시물 등록
	public void insert(BoardVO board);
	
	//신규 게시물 등록(등록시점에서 bno 게시물번호를 가져오는 경우)
	public void insertSelectKey(BoardVO board); 
	
	//p193
	//특정 게시물 번호에 대한 상세내역 처리
	public BoardVO read(Long bno);
	
	//p194
	//특정 게시물 내역 삭제 처리
	//delete 문을 수행 후 delete 된 행 수를 리턴받는다.
	public int delete(Long bno);
	
	//p196 
	//특정 게시물 내역 수정 처리
	public int update(BoardVO board);
	
	//p294  	3/20
	//페이징 처이
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	
	
	
	
}


