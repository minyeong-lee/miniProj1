package com.board.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import com.board.dao.BoardDAO;
import com.board.vo.BoardVO;

public class BoardService {
	private static final long serialVersionUID = 1L;
	
	BoardDAO boardDAO = new BoardDAO();
	
	public BoardService() {
		
	}
	
	public List<BoardVO> list(BoardVO board) throws ServletException, IOException {
		return boardDAO.list(board);
	}

	public BoardVO read(BoardVO board) throws ServletException, IOException {
		return boardDAO.read(board);
	}

	public int delete(BoardVO board) throws ServletException, IOException {
		return boardDAO.delete(board);
	}

	public BoardVO updateForm(BoardVO board) throws ServletException, IOException {
		return boardDAO.read(board);
	}
	
	public int update(BoardVO board) throws ServletException, IOException {
		return boardDAO.update(board);
	}
	
	public int insert(BoardVO board) throws ServletException, IOException {
		return boardDAO.insert(board);
	}
	
}
