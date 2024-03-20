package org.fintech.mapper;

import org.fintech.domain.StudentVO;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class StudentMapperTests {

	@Autowired
	private StudentMapper mapper;

	@Ignore
	public void testStudentList() { 
		mapper.studentList().forEach(student -> log.info(student));  
	}
	
	@Ignore
	public void testStudentInsert() {
		
		StudentVO student = new StudentVO();
		student.setSno("4000");		//(4L)
		student.setName("넷째");
		student.setPhone("010-4444-4444");
		
		mapper.studentInsert(student);
		
		log.info(student);
		
	}

	@Ignore
	public void testStudentDetail() {

		StudentVO student = mapper.studentDetail("1000");	//(5L)
	}
	
	@Ignore
	public void testStudentDelete() {

		log.info("삭제건수: " + mapper.studentDelete("4000"));	//(4L)
	}

	@Test
	public void testStudentUpdate() {

		StudentVO student = new StudentVO();
		//student.setSno(5L);
		student.setSno("4000");		//(4L)
		student.setName("다섯째");
		student.setPhone("010-5555-5555");
		
		int count = mapper.studentUpdate(student);
		log.info("수정건수: " + count);
	}
	
	
	
	
}
// 3/18 문제 
