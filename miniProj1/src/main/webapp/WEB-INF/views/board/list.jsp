<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 목록</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .button-container {
            margin-top: 20px;
        }
        .button-container button {
            padding: 10px 20px;
            font-size: 16px; 
            background-color: #f5f5f5;
        }
    </style>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header class="header py-3"> <!-- 조정된 padding -->
    <div class="container d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center"> <!-- 로고와 메뉴를 한 줄에 배치 -->
            <div class="header-logo mr-3"> <!-- 로고 오른쪽에 여백 추가 -->
                <a href="http://localhost:8090/miniProj1/" class="logo-text">
                    Taste<br>Ming
                </a>
            </div>
        </div>
    </div>
</header>
	<h1>게시물 목록</h1>
	  
    <form id="searchForm" action="board.do" method="post" >
    	<input type="hidden" id="action" name="action" value="list">
    	<label>제목</label>
    	<input type="text" id="searchKey" name="searchKey" value="${param.searchKey}">
    	<input type="submit" value="검색">
    </form>
    
    <form id="listForm" action="board.do" method="post">
    	<input type="hidden" id="action" name="action" value="read">
    	<input type="hidden" id="bno" name="bno" >
    </form>
   
    <table border="1">
        <tr>
            <th>게시물번호</th>
            <th>제목</th>
            <th>내용</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
        <c:forEach var="board" items="${list}">
        <tr>
            <td onclick="jsView('${board.bno}')"  style="cursor:pointer;">${board.bno}</td>
            <td><a href="board.do?action=read&bno=${board.bno}">${board.btitle}</a></td>
            <td>${board.bcontent}</td>
            <td>${board.userId}</td>
            <td>${board.createdAt}</td>
        </tr>
        </c:forEach>
    </table>
<script>
function jsView(bno) {
	//인자의 값을 설정한다 
	bno.value = bno;
	
	//양식을 통해서 서버의 URL로 값을 전달한다
	listForm.submit();
	
}
</script>      
    <div class="button-container">
        <a href="board.do?action=insertForm">등록</a>
    </div>
</body>
</html>

