package org.fintech.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//@Data : getter,setter,toString
@Data
//@AllArgsConstructor : 모든 필드의 생성자를 자동 생성 
@AllArgsConstructor
//@NoArgsConstructor : 기본 생성자 자동 생성 
@NoArgsConstructor
public class SampleVO {

	private Integer mno;
	private String firstName;
	private String lastName;
}
//p360 	3/22