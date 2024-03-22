package org.fintech.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private Long rno; //댓글번호
	private Long bno; //게시물번호
	private String reply; //댓글내용
	private String replyer; //댓글작성자
	private Date replyDate; //댓글등록일자
	private Date updateDate; //댓글수정일자
	
}
//p378  	3/22 