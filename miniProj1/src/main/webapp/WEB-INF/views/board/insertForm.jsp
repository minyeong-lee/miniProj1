<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>등록화면</title>
    <style>
        label {
            display: inline-block;
            width: 120px;
        }
        input {
            margin-bottom: 10px; 
        }
    </style>
</head>
<body>
    <h1>
        게시물 등록양식 
    </h1>
    <form action="board.do" method="post">
    	<input type="hidden" name="action" value="insert">
        <label>제목 : </label><input type="text" id="btitle" name="btitle" required="required"><br/>
        <label>내용 : </label><input type="text" id="bcontent" name="bcontent" required="required"><br/>
        <label>작성자 : </label><input type="text" id="userId" name="userId" required="required"><br/>
    <div>
        <button onclick="jsInsert()">등록</button>
        <a href="board.do?action=list">취소</a>
    </div>
    </form>
    <script>
    const btitle = document.getElementById("btitle");
    const bcontent = document.getElementById("bcontent");
    const userId = document.getElementById("userId");
	
    function jsInsert() {
    	const param = {
    			action:"insert",
    			btitle: btitle.value,
    			bcontent: bcontent.value,
    			userId: userId.value
    	};
    	fetch("board.do", {
    		method:"POST",
    		body : JSON.stringify(param),
    		headers : {"Content-type" : "application/json; charset=utf-8"}
    	}).then(res => res.json()).then(json => {
    	//서버로 부터 받은 결과를 사용해서 처리 루틴 구현  
    	if(json.status == 0){
    		alert("게시물을 등록하였습니다.")
    		location = "board.do?action=list";
    	} else {
    		alert(json.statusMessage);
    	}
    	});	
    }
    </script>
    
</body>
</html>
