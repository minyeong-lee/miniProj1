<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Taste Ming, 로컬 맛집 추천 서비스</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Google Fonts (Inter and Audiowide) -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Audiowide&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/script.js" defer></script>
</head>
<body>

<header class="header py-3"> <!-- 조정된 padding -->
    <div class="container d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center"> <!-- 로고와 메뉴를 한 줄에 배치 -->
            <div class="header-logo mr-3"> <!-- 로고 오른쪽에 여백 추가 -->
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
                <a href="login.jsp" class="btn btn-outline-light m-2">로그인</a>
                <a href="signup.jsp" class="btn btn-outline-light m-2">회원가입</a>
            </c:if>
            <c:if test="${isLoggedIn}">
                <a href="logout.jsp" class="btn btn-outline-light m-2">로그아웃</a>
            </c:if>
        </div>
    </div>
</header>

<main class="d-flex align-items-center justify-content-center" style="height: 80vh;">
    <h2 class="text-center">Welcome to Taste Ming Road!</h2>
</main>

<footer class="footer">
    <div class="container">
        <p>© 2024 Taste Ming. All rights reserved.</p>
    </div>
</footer>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>