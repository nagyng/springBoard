package org.fintech.controller;

import org.fintech.domain.BoardVO;
import org.fintech.domain.Criteria;
import org.fintech.domain.PageDTO;
import org.fintech.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")		//클라이언트에 요청 url 주소 처리 http://localhost:8080/board/......
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	
	//겟 방식
	//@GetMapping("/list")		// http://localhost:8080/board/list 게시물 목록 처리
	//public void list(Model model) {		//model : 데이터값 jsp에전송
		
	//	log.info("list");
		
	//  model.addAttribute == request.setAttribute
	//	model.addAttribute("list", service.getList());
	//}
	
	//p300  	3/20
	//페이징 처리
	@GetMapping("/list") 
	public void list(Criteria cri, Model model) { 
		
		log.info("list : " + cri); 
		model.addAttribute("list", service.getList(cri)); 
		//p307  	3/20  
		//model.addAttribute("pageMaker", new PageDTO(cri, 123)); 
		
		//p324  	3/21
		//전체 행 수 구하기
		int total = service.getTotal(cri);
		
		log.info("total: " + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total)); 
		
		
	}
	
	
	//p216 
	//포스트 방식
	@PostMapping("/register")			//RedirectAttributes : 일회성 데이터값 전송을 위해 사용 
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		log.info("register: " + board);
		
		//신규 게시물을 등록처리 
		service.register(board);
		
		//일회성 속성이 result 에 현재 가입하려는 게시물 번호를 대입 
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/board/list";
	}
	
	//p218  	3/19
	//@GetMapping("/get")			// http://localhost:8080/board/get?bno=00
	//public void get(@RequestParam("bno") Long bno, Model model) {		//@RequestParam : url 의 매개변수값을 가져오는 어노테이션 
		
	//	log.info("/get");			//service.get(bno) : 특정 게시물번호에 대해 상세보기 실행해 결과값을 board 라는 속성에 대입 
	//	model.addAttribute("board", service.get(bno));
	//}
	
	 
	//p259 3/20 					
	@GetMapping({"/get","/modify"})					//p316 		3/21  수정 
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {	 
		
		log.info("/get");		 
		model.addAttribute("board", service.get(bno));
	}
	
	
	//p219  	3/19 
	@PostMapping("/modify")		//수정 	http://localhost:8080/board/modify
										//p316 		3/21  수정 
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + board);
		
		if(service.modify(board)) {
			//게시물 수정 후 일회성 속성을 지정.
			rttr.addFlashAttribute("result","success");
		}
		
		//p316 		3/21
		//일회성 속성 선언 (현재 페이지 번호, 행 수)
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		//게시물 목록으로 이동 
		return "redirect:/board/list";
	}
	
	//p220	
	@PostMapping("/remove")								//p316 		3/21  수정 
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr){
		
		log.info("remove.........." + bno);
		//특정 게시물 삭제 처리
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result","success");		//addFlashAttribute : 삭제
		}
		//p316 		3/21
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/board/list";
	}
	
	//p239  	3/20
	//신규 게시물 등록 화면 처리
	// views -> board -> register.jsp 생성 
	@GetMapping("/register") 
	public void register() {
		
	}
	
	
	
	
	
}
//p211 p212 	3/18 