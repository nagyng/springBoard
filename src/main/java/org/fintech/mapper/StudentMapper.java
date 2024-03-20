package org.fintech.mapper;

import java.util.List;
 
import org.fintech.domain.StudentVO;

public interface StudentMapper {
	
	public List<StudentVO> studentList();
	public void studentInsert(StudentVO student);
	//public StudentVO studentDetail(Long sno);
	//public int studentDelete(Long sno);
	public StudentVO studentDetail(String sno);
	public int studentDelete(String sno);
	public int studentUpdate(StudentVO student);

}
