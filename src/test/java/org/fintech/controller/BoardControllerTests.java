package org.fintech.controller;
 
 
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
// @WebAppConfiguration : 
// Controller 및 Web 환경에 사용되는 기본적인 Bean들을 자동 생성하여 등록처리해주는 어노테이션 
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class BoardControllerTests {

	//인터페이스를 사용하기 위해 자동주입 
	@Autowired
	private WebApplicationContext ctx;

	//웹 어플리케이션을 톰캣서버에 배포하지 않고 
	//테스트용 MVC 환경을 만들어 요청 및 응답처리를 제공해주는 가짜 서버용 객체  
	private MockMvc mockMvc;
	

	//MockMvc 초기화작업 
	@Before 
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Ignore
	public void testList() throws Exception {
		
		//perform 				: MockMvc 를 실행 
		//get 					: 전송방식 
		//("") 					: 클라이언트 요청 url
		//.andReturn()			: 테스트한 결과값 리턴받을 경우 선언. 
		//.getModelAndView() 	: 리턴되는 view 와 model 에 저장된 속성값을 가져오는 메서드 
		//.getModelMap()		: 리턴값을 (Key, value) 형태로 가져온다.
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
	
	//p216
	@Ignore 
	public void testRegister() throws Exception{
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
				//url 에 매개변수를 전달 
				.param("title", "테스트 새글")
				.param("content", "테스트 내용")
				.param("writer", "글쓴이2")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	//p218  	3/19
	@Ignore
	public void testGet() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders	//
				.get("/board/get")						// url 주소 
				.param("bno", "1")						// ? 뒤의 주소 : ?bno=1
				)
				.andReturn()							//
				.getModelAndView().getModelMap()		//
				);
	}
	
	//p220  	3/19
	@Ignore
	public void testModify() throws Exception {
		
		//리턴되는 url 을 변수에 대입 
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/board/modify")
					.param("bno", "11")
					.param("title", "수정된 새글제목")
					.param("content", "수정된 새글내용")
					.param("writer", "user00")
					)
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	//p221  	3/19
	@Ignore
	public void testRemove() throws Exception {
		//삭제전 데이터베이스에 게시물 번호 확인할 것
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
					.param("bno", "31")
					).andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	 
	//p301  	3/20
	//페이징 처리
	@Test
	public void testListPaging() throws Exception {
		
		log.info(mockMvc.perform(
				MockMvcRequestBuilders
				.get("/board/list")
				.param("pageNum", "2")
				.param("amount", "10")
				)
				.andReturn()
				.getModelAndView()
				.getModelMap());
	} 
	
	
	
	
}
