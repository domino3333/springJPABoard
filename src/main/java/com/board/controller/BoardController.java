package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.domain.Board;
import com.board.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {

	@Autowired(required = false) 
	private BoardService boardService;

	
	
	
	@GetMapping("/insertForm")
	public String insertForm(Model model) {
		
		return "board/insertForm";
	}
	
	@PostMapping("/insert")
	public String insert(Board board, Model model) {
		log.info("insert board="+board.toString());
		try {
			int count = boardService.register(board);
			if(count > 0) {
				model.addAttribute("message","%s님의 게시글이 등록되었습니다.".formatted(board.getWriter()));

				return "board/success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("message","%s님의 게시판 등록이 실패하였습니다.".formatted(board.getWriter()));

		return "board/failed";
	}
	
	@GetMapping("/boardList")
	public String boardList(Model model) {
		log.info("boardList");

		try {
			List<Board> boardList = boardService.list();
			model.addAttribute("boardList",boardList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/boardList";
	}
	
	@GetMapping("/detail")
	public String detail(Board b, Model model) {
		log.info("boardDetail board="+b.toString());
		
		try {
			Board board = boardService.read(b);
			if(board==null) {
				model.addAttribute("message","%d번 게시판의 상세정보가 없습니다.".formatted(board.getNo()));
				return "board/failed";
			}
			model.addAttribute("board",board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/detail";
	}
	
	@GetMapping("/delete")
	public String delete(Board board, Model model) {
		log.info("board delete board="+board.toString());
		
		try {
			int count = boardService.remove(board);
			if(count>0) {
				model.addAttribute("message","%d번 게시판이 삭제되었습니다.".formatted(board.getNo()));
				return "board/success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("message","%d번 게시판을 삭제하지 못했습니다.".formatted(board.getNo()));
		return "board/failed";
	}
	
	@GetMapping("/updateForm")
	public String updateForm(Board b, Model model) {
		log.info("board updateForm="+b.toString());
		
		try {
			Board board = boardService.read(b);
			if(board==null) {
				model.addAttribute("message","%d님의 정보가 없습니다.".formatted(board.getNo()));
				return "board/failed";
			}
			model.addAttribute("board",board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/updateForm";
	}
	
	@PostMapping("/update")
	public String update(Board b, Model model) {
		log.info("board update="+b.toString());
		
		try {
			int count = boardService.modify(b);
			if(count > 0) {
				model.addAttribute("message","%s님의 게시판 수정 성공".formatted(b.getWriter()));
				return "board/success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("message","%s님의 게시판 수정 실패".formatted(b.getWriter()));
		return "board/failed";
	}
	
	@GetMapping("/search")
	public String boardsearch(String searchType,String keyword, Model model) {
		log.info("boardSearch : searchType= " + searchType+" keyword= " + keyword);

		try {
			List<Board> boardList = boardService.search(searchType,keyword);
			model.addAttribute("boardList",boardList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/boardList";
	}
	
	
	
	
}

















