package com.users;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request, response);
	}

	
	//공통 처리 함수
	private void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 설정
		request.setCharacterEncoding("utf-8");
		
		String action = request.getParameter("action");
		switch (action) {
		case "login" -> login(request, response);
		case "loginForm" -> loginForm(request, response);
		case "mypage" -> mypage(request,response);
		case "admin" -> admin(request, response);
		}
		
		//3. jsp 포워딩
		//포워딩
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/"+ action +".jsp");
		rd.forward(request, response);
	}
	
	
	private void login(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("로그인");
	}
	
	private void loginForm(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("로그인양식");
	}
	
	private void mypage(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("마이페이지");
	}
	
	private void admin(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("관리자의 회원관리 페이지");
	}
	
}
