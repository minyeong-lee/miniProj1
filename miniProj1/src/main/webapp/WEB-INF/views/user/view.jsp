<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User insert form</title>
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
    <h1>
        view 임시 화면
    </h1>
   
      <label>아이디 : ${user.userid}</label> <br/>
      <label>이름 : ${user.username}</label><br/>
      <label>주소: ${user.address}</label><br/>
      <label>휴대폰 번호: ${user.phoneNum}</label>
      <label>성별: ${user.gender}</label><br/><br/>

<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
<script>
function jsDelete() {
	if (confirm("정말로 삭제하시겠습니까?")) {
		/*
		//서버의 URL을 설정한다 
		action.value = "delete";
	
		//서버의 URL로 전송한다 
		viewForm.submit();
		*/
		action.value = "delete";
		myFetch("user.do", "viewForm", json => {
			if(json.status == 0) {
				//성공
				alert("회원정보를 삭제 하였습니다");
				location = "user.do?action=list";
			} else {
				alert(json.statusMessage);
			}
		});
/*		
	    const userid = document.getElementById("userid");
    	//fetch를 사용하여 회원 가입을 함
    	//전송자료 구성 
    	const param = {
			 action : 'delete'
			,userid : userid.value
    	} 
	    	
		fetch("user.do", {
			method:"POST",
			body:JSON.stringify(param),
			headers : {"Content-type" : "application/json; charset=utf-8"}
		}).then(res => res.json()).then(json => {
			//서버로 부터 받은 결과를 사용해서 처리 루틴 구현  
			console.log("json ", json );
			if(json.status == 0) {
				//성공
				alert("회원정보를 삭제 하였습니다");
				location = "user.do?action=list";
			} else {
				alert(json.statusMessage);
			}
		});
*/		
	}
}

function jsUpdateForm() {
	if (confirm("정말로 수정하시겠습니까?")) {
		//서버의 URL을 설정한다 
		action.value = "updateForm";
	
		//서버의 URL로 전송한다 
		viewForm.submit();
	}	
}

</script>
<!-- 두개의 폼을 하나로 합치는 방법 , js를 사용하여 처리  -->
	<form id="viewForm" method="post" action="user.do">
		<input type="hidden" id="action" name="action" value="">
		<input type="hidden" id="userid" name="userid" value="${user.userid}">
		<input type="button" value="삭제" onclick="jsDelete()">
		<input type="button" value="수정" onclick="jsUpdateForm()">
	</form>     
 
	<form action="user.do" method="post">
		<input type="hidden" name="action" value="delete">
		<input type="hidden" name="userid" value="${user.userid}">
		<input type="submit" value="삭제">
	</form>     
	
	<form action="user.do" method="post">
		<input type="hidden" name="action" value="updateForm">
		<input type="hidden" name="userid" value="${user.userid}">
		<input type="submit" value="수정">
	</form>     
	
    <div>
        <a href="user.do?action=list">목록</a>
        <a href="user.do?action=updateForm&userid=${user.userid}">수정</a>
        <a href="user.do?action=delete&userid=${user.userid}">삭제</a>
    </div>
    
    <a href="javascript:jsDelete()">삭제</a>
    
</body>
</html>

