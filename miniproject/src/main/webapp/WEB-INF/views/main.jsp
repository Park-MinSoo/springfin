<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 페이지</title>

<style>
#video {
	position: absolute;
	top: 0px;
	left: 0px;
	min-width: 100%;
	min-height: 100%;
	width: 60%;
	height: 60%;
	z-index: -1;
	overflow: hidden;
}

* {
      	margin: 0;
    	padding: 0;
	box-sizing: border-box;
}

*::before, *::after {
	box-sizing: border-box;
}

body {
	font-family: 'Mukta', sans-serif;
	font-size: 1rem;
	line-height: 1.5;
	display: flex;
	margin: 0;
	min-height: 100vh;
	background: #f3f8fa;
}




@
supports (display: grid ) {body { display:grid;
	grid-template-columns: repeat(4, 1fr);
	grid-gap: 0.625rem;
	grid-template-areas: ". main main ." ". main main .";
}

#container {
	grid-area: main;
	align-self: left;
	justify-self: left;
}

}
.container {
	display: flex;
	flex-direction: column;
	text-align: center;
}

.container .logo {
	position: fixed;
	left: 430px;
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 1.25em 0;
	text-align: center;
}

.container .logo:last-child {
	margin-bottom: 0;
}


.container .logo-name::before {
	content: '';
	position: absolute;
	top: calc(40% - 2px);
	left: 0;
	width: 100%;
	height: 20px;
	pointer-events: none;
	background-color: green;
	opacity: 0.5;
	transform: scale3d(0, 1, 1);
	transform-origin: 100% 50%;
	transition: transform 0.5s;
	transition-timing-function: cubic-bezier(0.8, 0, 0.2, 1);
}

.container .logo:hover .logo-name::before, .container .logo:focus .logo-name::before
	{
	transform: scale3d(1, 1, 1);
	transform-origin: 0% 50%;
}

*, *:after, *:before {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

ul, li {
	margin: 0;
	padding: 0;
}


body {
	 width: 100%;
   	 min-height: 100vh;
    	background: black;
    	user-select: none;
	color: white;
}
.container{
    padding: 50px 100px;
    transition: .5s;
}
.container header{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: auto;
    padding: 40px 50px;
    background: #e1e6ec;
    box-shadow: 0 2px 10px rgba(0, 0, 0, .4);
}
.container header nav{
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.container header nav .logo .logo-name{
    font-size: 3em;
    color: #000;
    text-transform: uppercase;
    font-family: ;
    font-weight: bold;
    padding: 0 0.25em;
}

.container header nav .login ul{
    list-style-type: none;
}

.container header nav .login ul li{
    display: inline;
    padding: 12px 18px;
    margin: 0 16px;
    font-size: 1.5rem;
    font-family: ;
    font-weight: 100;
    cursor: pointer;
}
.container header nav .login ul li{
    padding: 16px 22px;
    border-radius: 50px;
    background: #e1e6ec;
    box-shadow: 3px 3px 10px 1px rgba(0, 0, 0, .2),
                -3px -3px 10px 1px rgba(255, 255, 255, 1);
}

.container header nav .login ul li:active{
    box-shadow: inset 3px 3px 10px 1px rgba(0, 0, 0, .2),
                inset -3px -3px 10px 1px rgba(255, 255, 255, 1);
}
.signup-form,
.login-form{
    position: absolute;
    top: 45%;
    left: 50%;
    transform: translate(-50%, -50%);
    background: #fff;
    border-radius: 10px;
    box-shadow: 3px 3px 10px 1px rgba(0, 0, 0, .2);
    transition: .5s;
    visibility: hidden;
    opacity: 0;
}
.form{
    width: 500px;
    padding: 20px 50px;
}
.form .close{
    text-align: right;
    cursor: pointer;
}
.form .text h1{
    text-align: center;
    margin: 30px 0;
}
.form form{
    display: block;
    margin: auto;
}
.form .row{
    display: flex;
    justify-content: space-between;
}
.form .row input{
    margin-bottom: 0;
}
.form .row input:first-child{
    margin-right: 10px;
}
.form .row input:last-child{
    margin-left: 10px;
}
.form form input{
    width: 100%;
    display: block;
    border: 1px solid #000;
    border-radius: 50px;
    padding: 20px 16px;
    margin: 20px auto;
    outline: none;
}
.signup-form.active,
.login-form.active{
    top: 50%;
    transition: .5s;
    visibility: visible;
    opacity: 1;
}
.container.active{
    filter: blur(20px);
    transition: .5s;
    pointer-events: none;
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
	document.signupform.address.value = roadFullAddr;
			
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
	console.log(signupform.sm_id.value);
	$.ajax({
		type :"post",// 전송 방식 
		url :"/miniproject/idcheck",  //컨트롤러 사용할 때. 내가 보낼 데이터의 주소. 
		data : {"sm_id" : signupform.sm_id.value},
		
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
	document.getElementById("signupform").submit();	
}
</script>
<body>
	<%-- <%@ include file="/menu.jsp"  http://localhost:8000/miniproject/login%> --%>
	<div class="container">
		<header>
			<nav>
			     <a class="logo" href="/miniproject/login" style="text-decoration: none;">
				 <span class="logo-name">STYLE COORDER</span></a>
			       <div class="login">
                    	<ul>
                        	<li onclick="loginToggle()"><i class="far fa-user"></i></li>
							<li onclick="signupToggle()"><i class="fas fa-user-plus"></i></li>
                    	</ul>
                	</div>
			</nav>
		</header>
	</div>


	<div id="main" align="center">
		<div id="container" align="center">
			<video id="video" preload="auto" autoplay="true" loop="loop"
				muted="muted" volume="0">
				<source src="/miniproject/resources/images/main1.mp4">
			</video>
		</div>
	</div>
	<div class="signup-form">
        		<div class="form">
            		<div class="close" onclick="signupToggle()">&times;</div>
           			<div class="text">
                	<h1>Register Form</h1>
                	<img src="/miniproject/resources/images/signup.png" width="20">
            		</div>
            	<form name="signupform" id="signupform" method="post" class="main1" action="/miniproject/signup">
                	
                <input type = "text" name="sm_id" id="sm_id" placeholder="ID" required>
				<input type = "button" name="idcheck" onClick="CheckId(); return false;" value="Check ID"/>
                <input type = "password" name="sm_pwd" id="sm_pwd" placeholder="Password" required>
                <input type = "password" name="sm_pwd_check" id="sm_pwd_check" placeholder="Confirm Password" required onKeyup="passConfirm();" value="Cofirm Password">
               	<span id="confirmMsg"></span>
				<input type = "text" name="name" id="name" placeholder="NAME" required>
				<input type = "text" name="nic" id="nic" placeholder="Nickname">
				<input type = "number" name="age" id="age" max="999" min="1" placeholder="Age">
				<input type = "number" name="height" id="height" max="999" min="1" placeholder="Height">
				<input type = "number" name="weight" id="weight" max="999" min="1" placeholder="Weight">
				<input type="radio" id="male" name="gender" value="male">
					<label for="male">Male</label>
				<input type="radio" id="female" name="gender" value="female">
					<label for="female">Female</label><br/>
				<input type="text"  style="width:500px;" id="address"  name="address" />
				<input type="button" id="btn-address" onClick="goPopup();" value="Address"/>
				<input type="submit" value="Sign up" onclick="check();">
            		</form>
        		</div>
    	</div>
	<div class="login-form">
		<div class="form">
	 		<div class="close" onclick="loginToggle()">&times;</div>
            		<div class="text">
                			<h1>Welcome</h1><img src="/miniproject/resources/images/signin.png" width="20">
            		</div>
			<form name="loginform" method="post" class="main1"
				action="/miniproject/menu">
		
				<input name="sm_id" id="sm_id" placeholder="ID">
				<input type="password" name="sm_pwd" id="sm_pwd" placeholder="PASSWORD">
				<input type="submit" value="Sign In">
					
				<c:if test="${ msg=='fail'}">
				<script>
				        alert("아이디 혹은 비밀번호를 다시 확인해주세요");
				</script>
				</c:if>
			</form>
		</div>
	</div>
	<script>
		function signupToggle(){
            		var container = document.querySelector('.container');
            		container.classList.toggle('active');
            		var popup = document.querySelector('.signup-form');
            		popup.classList.toggle('active');
       		 }
        		function loginToggle(){
           			 var container = document.querySelector('.container');
            		container.classList.toggle('active');
           			 var popup = document.querySelector('.login-form');
            		popup.classList.toggle('active');
        		}
    	</script>		
				
	
</body>
</html>