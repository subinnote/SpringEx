package com.momo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StopWatch;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.momo.service.BookService;
import com.momo.vo.BookVO;
import com.momo.vo.Criteria;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/book/*")
@Log4j
public class BookController {
	
	@Autowired
	BookService bookService;
	
	/**
	 * 
	 * @param cri
	 * @param model
	 */
	@GetMapping("list")
	public void list(Criteria cri, Model model) {
		
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		// pageNo type int -> '' 입력시 오류 발생

		// 리스트 조회
		bookService.getList(cri, model);
		
		log.info("======================list");
		log.info("cri : " + cri);
		
		
		// 화면에 전달
		model.addAttribute("msg", "/book/list");
		// return "/book/list";
		// -> WEB-INF/views/book/list.jsp
		
		stopWatch.stop();
		log.info("수행시간: " + stopWatch.getTotalTimeMillis()+"(ms)초");
	}
	
	@GetMapping("view")
	public void getOne(BookVO book, Model model) {
		bookService.getOne(book.getNo(), model);
	}
	
}
