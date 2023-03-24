package com.momolearn.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.momolearn.exception.NotExistException;
import com.momolearn.model.dto.BoardDTO;
import com.momolearn.model.dto.BoardSaveDTO;
import com.momolearn.model.entity.Board;
import com.momolearn.model.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	//모든 게시글 목록
//	@GetMapping("/")
//	public String list(Model model, @PageableDefault(sort = "comNo", direction = Sort.Direction.DESC) Pageable pageable) {
//		System.out.println("list()---------------");
//		model.addAttribute("list", boardService.findAll());
//		boardService.findAll().forEach(e->System.out.print(e));
//		return "forward:/page/board/list.jsp";
//	}
	
	//모든 게시글 목록+페이징
	//https://dev-coco.tistory.com/114
	@GetMapping("/")
	public String list(Model model, @PageableDefault(sort = "comNo", direction = Sort.Direction.DESC) Pageable pageable) {
		System.out.println("list()---------------");
		
		Page<Board> listPage = boardService.paging(pageable);
		
		model.addAttribute("list", listPage.getContent());
		model.addAttribute("previous", pageable.previousOrFirst().getPageNumber());
		model.addAttribute("next", pageable.next().getPageNumber());
		model.addAttribute("hasNext", listPage.hasNext());
		model.addAttribute("hasPrev", listPage.hasPrevious());
		
		return "board/list";  
	}
	
	//게시글 작성창으로 이동
	@GetMapping("/writeForm")
	public String writeForm() {
		return "forward:/page/board/writeForm.jsp";
	}
	
	//게시글 작성 produces = "application/json;charset=utf-8"
	@PostMapping
	public String write(@Valid BoardSaveDTO dto, BindingResult bindingResult) throws NotExistException{
		System.out.println("write()---------------");
		System.out.println(dto.toString());
		
		//유효성 검증
		if(bindingResult.hasErrors()) {
			//에러를 list에 저장
			List<ObjectError> errorList = bindingResult.getAllErrors();
			for(ObjectError error : errorList) {
				log.info("등록 실패: "+error.getDefaultMessage());
			}
			errorList.forEach(e -> System.out.print(e));
			
			return "forward:/board/";
		}
		
		int comNo = boardService.save(dto); //->해당 게시글로 가게할지?고민중
		return "redirect:/board/";
	}
	
	//게시글 보기 + 조회수증가
	@GetMapping("/{comNo}")
	public String read(@PathVariable int comNo, Model model) throws NotExistException{
		System.out.println("read()------------");
		//조회
		BoardDTO dto = boardService.read(comNo);
		//조회수증가
		boardService.increaseViewCount(comNo);
		
		model.addAttribute("dto", dto);
		model.addAttribute("localDateTimeFormat", new SimpleDateFormat("yyyy-MM-dd hh:mm"));
		return "board/read";
	}
	
	//게시글 수정화면으로 이동
	@GetMapping("/updateForm/{comNo}")
	public String updateForm(@PathVariable int comNo, Model model) throws NotExistException{
		System.out.println("updateForm()----------------");
		model.addAttribute("dto", boardService.read(comNo));
		return "forward:/page/board/updateForm.jsp";
	}
	
	//게시글 수정
	@PutMapping("/{comNo}")
	public String update(@PathVariable int comNo, @Valid @ModelAttribute BoardSaveDTO dto, BindingResult bindingResult) throws NotExistException{
		System.out.println("update()------------------");
		
		//유효성 검증(입력 NotNull)
		if(bindingResult.hasErrors()) {
			//에러를 list에 저장
			List<ObjectError> errorList = bindingResult.getAllErrors();
			errorList.forEach(e -> System.out.print(e));
			return "forward:/board/";
		}
		
		boardService.update(comNo, dto);
		return "redirect:/board/";
		
	}
	
	//게시글 삭제
	@DeleteMapping("/{comNo}")
	public String delete(@PathVariable int comNo) {
		System.out.println("delete() ---------");
		boardService.delete(comNo);
		return "redirect:/board/";
	}
	
	
	
	@ExceptionHandler
	public String exHandler(NotExistException e) {
		e.printStackTrace();
		return "redirect:404.html"; //임시
	}
}
