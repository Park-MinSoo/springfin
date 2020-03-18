<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Style Manager</title>
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

button {
    position: fixed;
    left: 0;
    display: inline-block;
    cursor: pointer;
    outline: none;
    border: 0;
    vertical-align: middle;
    text-decoration: none;
    background: transparent;
    padding: 0;
    font-size: inherit;
    font-family: inherit;
}

button.learn-more {
    width: 12rem;
    height: auto;
}

button.learn-more .circle {
    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
    position: relative;
    display: block;
    margin: 0;
    width: 3rem;
    height: 3rem;
    background: #282936;
    border-radius: 1.625rem;
}

button.learn-more .circle .icon {
    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
    position: absolute;
    top: 0;
    bottom: 0;
    margin: auto;
    background: #fff;
}

button.learn-more .circle .icon.arrow {
    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
    left: 0.625rem;
    width: 1.125rem;
    height: 0.125rem;
    background: none;
}

button.learn-more .circle .icon.arrow::before {
    position: absolute;
    content: '';
    top: -0.25rem;
    right: 0.0625rem;
    width: 0.625rem;
    height: 0.625rem;
    border-top: 0.125rem solid #fff;
    border-right: 0.125rem solid #fff;
    transform: rotate(45deg);
}

button.learn-more .button-text {
    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    padding: 0.75rem 0;
    margin: 0 0 0 1.85rem;
    color: #282936;
    font-weight: 700;
    line-height: 1.6;
    text-align: center;
    text-transform: uppercase;
}

button:hover .circle {
    width: 100%;
}

button:hover .circle .icon.arrow {
    background: #fff;
    transform: translate(1rem, 0);
}

button:hover .button-text {
    color: #fff;
}
.main1{
	position: fixed;
	left: 0;
}

td{
 	color: black;
	font-weight: bold;
}
@supports (display: grid) {
    body {
        display: grid;
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



</style>
<body>
<%-- <%@ include file="/menu.jsp" %> --%>
  <div id ="main" align ="center">
      <div id ="container" align ="center">
          <video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
      		<source src ="/miniproject/resources/images/main1.mp4">
	  </video>
      </div>
  </div>

<form name="loginform" method="post" class="main1" action="/miniproject/menu">
	<table>
		<tr>
			<td>ID</td>
			<td><input name="sm_id" id="sm_id"></td>
		</tr>
		<tr>
			<td>PASSWORD</td>
			<td><input type="password" name="sm_pwd" id="sm_pwd"></td>
		</tr>
		<tr>
			<td>
				<div class="container">
					<button class="learn-more">
						<span class="circle" aria-hidden="true">
						<span class="icon arrow"></span>
						</span>
						<span class="button-text">
						Sign In
						</span>
					</button>
					<c:if test="${ msg=='fail'}">
						<script>
							alert("아이디 혹은 비밀번호를 다시 확인해주세요");
						</script>
					</c:if>
				</div>
			</td>
		</tr>
		<!-- <tr>
			<td>
				<div class="container">
					<button class="learn-more">
						<span class="circle" aria-hidden="true">
						<span class="icon arrow"></span>
						</span>
						<span class="button-text">
						Sign Up
						</span>
					</button>
				</div>
			</td>
		</tr> -->
	</table>
</form>
</body>
</html>