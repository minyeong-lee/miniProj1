<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그인 - Taste Ming</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Audiowide&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header class="header py-3">
    <div class="container d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center">
            <div class="header-logo mr-3">
                <a href="index.jsp" class="logo-text">Taste<br>Ming</a>
            </div>
        </div>
    </div>
</header>

<main class="container my-5">
    <h1 class="text-center mb-4">로그인</h1>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <c:if test="${not empty param.err}">
            <script>alert("아이디 또는 비밀번호가 잘못되었습니다");</script>  
            </c:if>
            <form id="rForm" action="user.do" method="post" class="needs-validation" novalidate>
                <input type="hidden" name="action" value="login">
                <div class="form-group">
                    <label for="userid">아이디</label>
                    <input type="text" class="form-control" id="userid" name="userid" required="required" value="${param.userid}">
                </div>
                <div class="form-group">
                    <label for="userpassword">비밀번호</label>
                    <input type="password" class="form-control" id="userpassword" name="userpassword" required="required">
                </div>
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="autologin" name="autologin" value="Y">
                    <label class="form-check-label" for="autologin">자동로그인</label>
                </div>
                <div class="text-center">
                    <input type="submit" class="btn btn-outline-secondary" value="로그인">
                    <a href="user.do?action=list" class="btn btn-secondary">취소</a>
                </div>
            </form>
        </div>
    </div>
</main>

<footer class="footer mt-5">
    <div class="container text-center">
        <p>© 2024 Taste Ming. All rights reserved.</p>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="js/common.js" defer></script>
<script>
const rForm = document.getElementById("rForm");

rForm.addEventListener("submit", e => {
    e.preventDefault();
    myFetch("user.do", "rForm", json => {
        if(json.status == 0) {
            alert("로그인 되었습니다");
            location.href = "board.do?action=list";
        } else {
            alert(json.statusMessage);
        }
    });
});
</script>
</body>
</html>