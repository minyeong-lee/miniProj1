<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>수정화면</title>
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
        게시물 수정 수정양식 
    </h1>
    <form action="board.do" method="post">
    	<input type="hidden" name="action" value="update">
        <label>게시물 번호: </label> <input type="text" id="bno" name="bno" value="${board.bno}" readonly="readonly"> <br/>
        <label>제목 : </label><input type="text" id="btitle" name="btitle" value="${board.btitle}"><br/>
        <label>내용: </label> <input type="text" id="bcontent" name="bcontent" value="${board.bcontent}"><br/>
    <div>
        <!-- <input type="button" value="수정" onclick="jsUpdate()"> -->
        <button onclick="jsUpdate()">수정</button>
        <a href="board.do?action=read&bno=${board.bno}">취소</a>
    </div>
    </form>
    <script>
    
    const bno = document.getElementById("bno");
    const btitle = document.getElementById("btitle");
    const bcontent = document.getElementById("bcontent");


    function jsUpdate() {
    	const param = {
    			action:"update",
    			btitle: btitle.value,
    			bcontent: bcontent.value,
    			bno: bno.value
    	};
    	fetch("board.do", {
    		method:"POST",
    		body : JSON.stringify(param),
    		headers : {"Content-type" : "application/json; charset=utf-8"}
    	}).then(res => res.json()).then(json => {
    	//서버로 부터 받은 결과를 사용해서 처리 루틴 구현  
    	if(json.status == 0){
    		alert("게시물 정보를 수정 하였습니다.")
    		location = "board.do?action=list";
    	} else {
    		alert(json.statusMessage);
    	}
    	});	
    }
    
    </script>
    
</body>
</html>
