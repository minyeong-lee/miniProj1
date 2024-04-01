<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 목록 - Taste Ming</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Audiowide&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/script.js" defer></script>
</head>
<body>
    <header class="header py-3">
        <div class="container d-flex justify-content-between align-items-center">
            <div class="d-flex align-items-center">
                <div class="header-logo mr-3">
                    <a href="index.jsp" class="logo-text">
                        Taste<br>Ming
                    </a>
                </div>
                <nav class="header-menu">
                    <a href="views/aboutFirm.html" class="btn btn-outline-light m-2">회사소개</a>
                    <a href="board.do?action=list" class="btn btn-outline-light m-2">게시물</a>
                </nav>
            </div>
            <div>
                <c:if test="${!isLoggedIn}">
                    <a href="user.do?action=loginForm" class="btn btn-outline-light m-2">로그인</a>
                    <a href="user.do?action=insertForm" class="btn btn-outline-light m-2">회원가입</a>
                </c:if>
                <c:if test="${isLoggedIn}">
                    <a href="logout.jsp" class="btn btn-outline-light m-2">로그아웃</a>
                </c:if>
            </div>
        </div>
    </header>

    <main class="container my-5">
        <h1 class="mb-4">게시물 목록</h1>
        <form id="searchForm" class="mb-3" action="board.do" method="post">
            <input type="hidden" id="action" name="action" value="list">
            <div class="input-group mb-3">
                <input type="text" class="form-control" id="searchKey" name="searchKey" placeholder="제목으로 검색" value="${param.searchKey}">
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" type="submit">검색</button>
                </div>
            </div>
        </form>
        <table class="table">
            <thead class="thead-light">
                <tr>
                    <th scope="col">목록</th>
                    <th scope="col">제목</th>
                    <th scope="col">내용</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="board" items="${list}">
                    <tr onclick="jsView('${board.bno}')" style="cursor:pointer;">
                        <th scope="row">${board.bno}</th>
                        <td><a href="board.do?action=read&bno=${board.bno}">${board.btitle}</a></td>
                        <td>${board.bcontent}</td>
                        <td>${board.userId}</td>
                        <td>${board.createdAt}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="text-right">
            <a href="board.do?action=insertForm" class="btn btn-primary">새 게시물 작성</a>
        </div>
    </main>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>