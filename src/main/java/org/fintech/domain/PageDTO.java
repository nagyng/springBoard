package org.fintech.domain;

import lombok.Data;

@Data
public class PageDTO {

	//필드 선언
	//각 페이지 하단에 표시되는 시작페이지
	private int startPage;
	//각 페이지 하단에 표시되는 종료페이지
	private int endPage;
	//이전페이지, 이후페이지 출력 여부 
	private boolean prev, next;
	
	//출력할 총 게시물 수
	private int total;
	//현재 페이지의 게시물을 보여주는 클래스 
	private Criteria cri;
	
	//생성자
	public PageDTO(Criteria cri, int total) {
		
		this.cri = cri;
		this.total = total; 
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;		// 지금 2페이지면 1~10페이지까지 표시됨. (12페이지면 11~20)
		
		this.startPage = this.endPage - 9;			// 1~10, 11~20, 21~30, ...
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));		//실제 페이지 수 (남은 페이지)
		
		if (realEnd < this.endPage) {
			this.endPage = realEnd;		//10단위까지 못갈때 남은 페이지가 끝페이지로.
		}
		
		this.prev = this.startPage > 1;			//시작페이지가 10부터 이전페이지 존재
		
		this.next = this.endPage < realEnd;		//남은페이지가 있을 때 다음페이지 존재
		
	}
	
}
//p306  	3/20