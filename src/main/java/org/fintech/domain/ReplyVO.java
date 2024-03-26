package org.fintech.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReplyVO {

	private Long rno; //댓글번호
	private Long bno; //게시물번호
	private String reply; //댓글내용
	private String replyer; //댓글작성자
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul") 	//@JsonFormat : 날짜타입으로 표시
	private Date replyDate; //댓글등록일자
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date updateDate; //댓글수정일자
	
}
//p378  	3/22