package com.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.service.BoardService;
import com.board.vo.BoardVO;

public class BoardController {
	private static final long serialVersionUID = 1L;
	
	BoardService boardService = new BoardService();
	
	public BoardController() {
		
	}
	
	public Object list(HttpServletRequest request, BoardVO board) throws ServletException, IOException {
		System.out.println("목록");
		
		//1. 처리
		List<BoardVO> list = boardService.list(board);
		
		//2. jsp 출력할 값 설정
		request.setAttribute("list", list);
		
		return "list";
	}

	public String read(HttpServletRequest request, BoardVO board) throws ServletException, IOException {
		System.out.println("상세보기");
		//1. 처리
		board = boardService.read(board);
		
		//2. JSP 출력할 값 설정
		request.setAttribute("board", board);
		
		return "read";
	}
	
	public Object delete(HttpServletRequest request, BoardVO board) throws ServletException, IOException {
		System.out.println("삭제");
		//1. 처리
		int updated = boardService.delete(board);
		
		Map<String, Object> map = new HashMap<>();
		if (updated == 1) { //성공
			map.put("status", 0);
		} else {
			map.put("status", -99);
			map.put("statusMessage", "게시물 정보 삭제 실패하였습니다");
		}
		
		return map;
	}
	
	public String updateForm(HttpServletRequest request, BoardVO board) throws ServletException, IOException {
		System.out.println("수정화면");
		
		//1. 처리
		board = boardService.updateForm(board);
		
		//2. jsp 출력할 값 설정
		request.setAttribute("board", board);
		
		return "updateForm";
	}

	
	public Object update(HttpServletRequest request, BoardVO board) throws ServletException, IOException {
		System.out.println("수정");
		
		//1. 처리
		int updated = boardService.update(board);
		
		Map<String, Object> map = new HashMap<>();
		if (updated == 1) {	//성공
			map.put("status", 0);
		} else {
			map.put("status", -99);
			map.put("statusMessage", "게시물 정보 수정을 실패하였습니다");
		}
		return map;
	}
	
	public Object insertForm(HttpServletRequest request) throws ServletException, IOException {
		System.out.println("등록화면");
		return "insertForm";
	}
		
	public Object insert(HttpServletRequest request, BoardVO board) throws ServletException, IOException {
		System.out.println("등록");
		Map<String, Object> map = new HashMap<String, Object>();
		
		//1. 처리
		int updated = boardService.insert(board);
		
		if (updated == 1) {	//성공
			map.put("status", 0);
		} else {
			map.put("status", -99);
			map.put("statusMessage", "회원 가입이 실패하였습니다");
		}
		return map;
	}
}
