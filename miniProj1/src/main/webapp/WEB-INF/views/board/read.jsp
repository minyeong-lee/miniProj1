<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>게시물 상세보기</title>
    <style>
        label {
            display: inline-block;
            width: 200px;
        }
        input {
            margin-bottom: 10px; 
        }
    </style>
</head>
<body>
    <h1>게시물 상세보기</h1>
    <label>게시물 번호: ${board.bno}</label> <br/>
    <label>제목 : ${board.btitle}</label><br/>
    <label>내용 : ${board.bcontent}</label><br/>
    <label>작성자 : ${board.userId}</label><br/>
    <label>작성일 : ${board.createdAt}</label><br/>

    <script src="<c:url value='/js/common.js'/>"></script>
    <script>
    function jsDelete() {
        if (confirm("정말로 삭제하시겠습니까?")) {
            document.getElementById('action').value = "delete";
            myFetch("board.do", "viewForm", json => {
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
            document.getElementById('action').value = "updateForm";
            viewForm.submit(); // 이 부분은 myFetch를 사용하지 않고 form을 직접 제출하는 것으로 유지됩니다.
        }
    }
    </script>
    <form id="viewForm" method="post" action="board.do">
        <input type="hidden" id="action" name="action" value="">
        <input type="hidden" name="bno" value="${board.bno}">
        <input type="button" value="삭제" onclick="jsDelete()">
        <input type="button" value="수정" onclick="jsUpdateForm()">
        <input type="button" value="목록" onclick="location.href='board.do?action=list'">
    </form>     
</body>
</html>