package org.fintech.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data; 

@Data
@AllArgsConstructor 
public class ReplyPageDTO {

	private int replyCnt;		 	//총 댓글 수 
	private List<ReplyVO> list;	 	//댓글 목록을 가지는 List


}
//p433  	3/26 

