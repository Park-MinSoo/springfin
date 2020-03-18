<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style>
body {
	background-color: black;
	background-size: 100%;
}
*{
	text-align: center;
}
h2{
	color: white;
	font-size: 50px;
	font-weight: bold;
}


.bt{
	border: 2px solid white;
	color: white;
	font-family: 'Lalezar';
	font-size: 15px;
	border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
    background-color: #1F1E1E;
	padding: 5px;
    width: 100px;
    height: 30px;
    text-align: center;
 	position: relative;
  
	

}

#btn-address{
	border: 2px solid white;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
    background-color: #1F1E1E;
	padding: 5px;
    margin-left: auto;
    margin-right: auto;
    width: 55px;
    height: 30px;
    color: white; 

}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/miniproject/resources/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.address.value = roadFullAddr;
			
}

function passConfirm(){
		/* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
		
		var sm_pwd = document.getElementById('sm_pwd');				
		var sm_pwd_check = document.getElementById('sm_pwd_check');	
		var confirmMsg = document.getElementById('confirmMsg');				
		var correctColor = "#00ff00";
		var wrongColor ="#ff0000";	
		
		if(sm_pwd.value == sm_pwd_check.value){
			confirmMsg.style.color = correctColor;
			confirmMsg.innerHTML = "비밀번호 일치";
		}else{
			confirmMsg.style.color = wrongColor;
			confirmMsg.innerHTML = "비밀번호 불일치";
		}

}
function CheckId(){
	console.log(form.sm_id.value);
	$.ajax({
		type :"post",// 전송 방식 
		url :"/miniproject/idcheck",  //컨트롤러 사용할 때. 내가 보낼 데이터의 주소. 
		data : {"sm_id" : form.sm_id.value},
		
		// JSON형식 안에 JSON 형식으로 표현한 데이터. 
        //"파라미터 이름" : 폼태그에 적은 NAME 값.ID입력창의 NAME값.value 여러 개도 가능				
		
		dataType : "text",	// text, xml, html, script, json, jsonp 가능 
        //정상적인 통신을 했다면 function은 백엔드 단에서 데이터를 처리.
		success : function(data){	
			if(data=="1"){
				alert("이 아이디는 사용 가능합니다.");
			}else{
				alert("이 아이디는 사용  불가능합니다.");
			}
		},
		error : function(){
			alert("아이디 중복 확인 ajax 실행 실패");
		}
	});
} 

function check(){
	alert("회원가입을 축하합니다.");
	document.getElementById("signup").submit();	
}
</script>
</head>
<body>
<h2>Make your Account</h2>
	<form method="post" action="/miniproject/signup" name="form" id="signup">
		<table>
		<tr><td> ID  	</td><td><input type = "text" name="sm_id" id="sm_id" placeholder="아이디를 입력해주세요" required>
								<input type = "button" name="idcheck" onClick="CheckId(); return false;" value="중복확인"/></td></tr>
		<tr><td> PASSWORD	</td><td><input type = "password" name="sm_pwd" id="sm_pwd" placeholder="비밀번호를 입력해주세요" required></td></tr>
		<tr><td> Check PASSWORD	</td><td>	<input type = "password" name="sm_pwd_check" id="sm_pwd_check" placeholder="비밀번호를 다시 입력해주세요" required onKeyup="passConfirm();">
									<span id="confirmMsg"></span></td></tr>
		<tr><td> Nickname		</td><td><input type = "text" name="nic" id="nic" placeholder="닉네임을 입력해주세요"></td></tr>
		<tr><td> NAME	</td><td><input type = "text" name="name" id="name" placeholder="이름을 입력해주세요" required></td></tr>
		<tr><td> AGE	</td><td><input type = "number" name="age" id="age" max="999" min="1" placeholder="나이를 입력해주세요"></td></tr>
		<tr><td> HEIGHT	</td><td><input type = "number" name="height" id="height" max="999" min="1" placeholder="키를 입력해주세요"></td></tr>
		<tr><td> WEIGHT	</td><td><input type = "number" name="weight" id="weight" max="999" min="1" placeholder="몸무게를 입력해주세요"></td></tr>
		<tr><td> GENDER  	</td><td><input type="radio" id="male" name="gender" value="male">
									<label for="male">Male</label>
									<input type="radio" id="female" name="gender" value="female">
									<label for="female">Female</label><br/></td></tr>
		<tr><td> ADDRESS		</td><td><input type="text"  style="width:500px;" id="address"  name="address" />
								<input type="button" id="btn-address" onClick="goPopup();" value="주소입력"/></td></tr>
		</table>
				<br>
				<br>
			
		<input type = "button" onclick="check();" value = "submit" class="bt">
		<input type = "reset" value = "reset" class="bt">
		<button onclick="${ requestScope.referer }" class="bt">cancel</button>
	</form>
</body>
</html>