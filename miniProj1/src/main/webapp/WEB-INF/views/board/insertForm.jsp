<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>게시물 등록 - Taste Ming</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Audiowide&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/common.js" defer></script> 
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
        <h1>게시물 등록</h1>
        <form id="insertForm" action="board.do" method="post">
            <input type="hidden" name="action" value="insert">
            <div class="form-group">
                <label for="btitle">제목</label>
                <input type="text" class="form-control" id="btitle" name="btitle" required>
            </div>
            <div class="form-group">
                <label for="bcontent">내용</label>
                <textarea class="form-control" id="bcontent" name="bcontent" rows="3" required></textarea>
            </div>
            <div class="form-group">
                <label for="userId">작성자</label>
                <input type="text" class="form-control" id="userId" name="userId" required>
            </div>
            <button type="button" class="btn btn-primary" onclick="jsInsert()">등록</button>
            <a href="board.do?action=list" class="btn btn-secondary">취소</a>
        </form>
    </main>

    <script>
        function jsInsert() {
            myFetch("board.do", "insertForm", function(json) {
                //서버로부터 받은 결과를 처리
                if(json.status == 0){
                    alert("게시물을 등록하였습니다.");
                    location.href = "board.do?action=list";
                } else {
                    alert(json.statusMessage);
                }
            });
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>