package org.fintech.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private Long bno;			//게시물번호	
	private String title;		//게시물제목
	private String content;		//게시물내용
	private String writer;		//게시물작성자
	private Date regdate;		//게시물등록일자
	private Date updateDate;	//게시물수정일자
}
