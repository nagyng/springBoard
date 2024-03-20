package org.fintech.domain;

import lombok.Data;


@Data // = @Getter, @Setter, @ToString
public class Criteria {

	private int pageNum;		//현재 페이지 번호
	private int amount;			//한 페이지 당 게시물 행 수 
	
	public Criteria() {			//매개변수 두 개 생성자를 호출. 
		this(1, 10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
}
//p293 	3/20
