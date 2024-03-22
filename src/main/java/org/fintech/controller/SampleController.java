package org.fintech.controller;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.fintech.domain.SampleVO;
import org.fintech.domain.Ticket;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

//@RestController : 해당 클래스가 REST 방식의 컨트롤러 기능을 수행한다는 어노테이션
@RestController
@RequestMapping("/sample") 				// http://localhost:8080/sample/....
@Log4j
public class SampleController {  
	//consumer : 서버 소비, produce : 서버 응답 형태 
	@GetMapping(value = "/getText", produces = "text/plain; charset=UTF-8")		// http://localhost:8080/sample/getText
	public String getText() {
	
	log.info("MIME TYPE: " + MediaType.TEXT_PLAIN_VALUE);
	
	return "안녕하세요";

	}
	
	//p361 	3/22
	@GetMapping(value = "/getSample", produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE,			// http://localhost:8080/sample/getSample.json
			MediaType.APPLICATION_XML_VALUE 	})			// http://localhost:8080/sample/getSample
	public SampleVO getSample() {
		return new SampleVO(112, "스타", "로드");
	}
	
	//p363 	3/22
	@GetMapping("/getList")				// http://localhost:8080/sample/getList
	public List<SampleVO> getList() {
		// 1~9까지 실행되는 반복문. SampleVO 객체 생성. (e.g. 1, 1First, 1Last) 
		return IntStream.range(1, 10).mapToObj(i -> new SampleVO(i, i + "First", i + " Last")).collect(Collectors.toList());
	}
	
	//p365 	3/22
	@GetMapping(value="/check", params= {"height", "weight"})		// http://localhost:8080/sample/check.json?height=140&weight=60
	public ResponseEntity<SampleVO> check(Double height, Double weight){
		SampleVO vo = new SampleVO(0, "" + height, "" + weight);
		
		ResponseEntity<SampleVO> result = null;
		
		if(height < 150) {
					//BAD_GATEWAY : 상태코드값을 502로 지정 
			result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo);
		} else {
					//OK : 상태코드값을 200로 지정 
			result = ResponseEntity.status(HttpStatus.OK).body(vo);
		}

		return result;
	}
	
	//p366 	3/22
	//주소에 있는 매개변수 값 가져오기 
	@GetMapping("/product/{cat}/{pid}")			// http://localhost:8080/sample/product/bags/1234
	public String[] getPath(
			//@PathVariable : REST 방식에서 url 에 있는 매개변수를 가져오는 어노테이션 
			@PathVariable("cat") String cat,
			@PathVariable("pid") Integer pid) {
		return new String[] { "category: " + cat, "productid: " + pid };
	}
	
	//p368 	3/22 
	@PostMapping("/ticket")		
	// @RequestBody : 매개변수로 전달되는 JSON 형태를 자바 클래스 형태로 변환.
	public Ticket convert(@RequestBody Ticket ticket) {
		
		log.info("convert.........ticket" + ticket);
		
		return ticket;
	}
	
	
	
	
	
}
//p360 	3/22 