<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>게시물 상세보기 - Taste Ming</title>
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
        </div>
    </header>

    <main class="container my-5">
        <h1>게시물 상세보기</h1>
        <div class="mb-3">
            <label class="font-weight-bold">게시물 번호:</label> <span>${board.bno}</span>
        </div>
        <div class="mb-3">
            <label class="font-weight-bold">제목:</label> <span>${board.btitle}</span>
        </div>
        <div class="mb-3">
            <label class="font-weight-bold">내용:</label> <span>${board.bcontent}</span>
        </div>
        <div class="mb-3">
            <label class="font-weight-bold">작성자:</label> <span>${board.userId}</span>
        </div>
        <div class="mb-3">
            <label class="font-weight-bold">작성일:</label> <span>${board.createdAt}</span>
        </div>
        <form id="viewForm" method="post" action="board.do" class="mt-4">
            <input type="hidden" id="action" name="action" value="">
            <input type="hidden" name="bno" value="${board.bno}">
            <button type="button" class="btn btn-danger" onclick="jsDelete()">삭제</button>
            <button type="button" class="btn btn-primary" onclick="jsUpdateForm()">수정</button>
            <button type="button" class="btn btn-secondary" onclick="location.href='board.do?action=list'">목록</button>
        </form>
    </main>

    <script>
        function jsDelete() {
            if (confirm("정말로 삭제하시겠습니까?")) {
                document.getElementById('action').value = "delete";
                myFetch("board.do", { bno: "${board.bno}", action: "delete" }, json => {
                    if(json.status == 0) {
                        alert("게시물 정보를 삭제 하였습니다");
                        location.href = "board.do?action=list";
                    } else {
                        alert(json.statusMessage);
                    }
                });
            }
        }

        function jsUpdateForm() {
            if (confirm("정말로 수정하시겠습니까?")) {
            	location.href = `board.do?action=updateForm&bno=${board.bno}`;
            }
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>