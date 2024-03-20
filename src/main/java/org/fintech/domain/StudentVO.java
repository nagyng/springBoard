package org.fintech.domain;

import java.util.Date;

import lombok.Data;

@Data
public class StudentVO {
	
	//private Long sno;
	private String sno;
	private String name;
	private String phone;
	private Date regdate;
	private Date updatedate; 

}
