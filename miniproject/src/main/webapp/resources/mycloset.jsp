<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Style Manager</title>
    <link rel="stylesheet" href="hover.css">  
<style>
	h1{
		text-align : center;
  		text-shadow : 10px 10px 15px black;
  		color : grey;
  	}
  	div{
  		text-align : center;
  	}
	#dropbox {
		position : absolute;
		left : 580px;
		width : 650px;
		height : 800px;
	}
	#defaultCloset {
		position : absolute;
		left : 5px;
		width : 550px;
		height : 800px;
	}
	#picturesbox1 {
		position : absolute;
		left : 5px;
		width : 550px;
		height : 800px;
		overflow:scroll;
	}
	#picturesbox2 {
		position : absolute;
		left : 5px;
		width : 550px;
		height : 800px;
		overflow:scroll;
	}
	#picturesbox3 {
		position : absolute;
		left : 5px;
		width : 550px;
		height : 800px;
		overflow:scroll;
	}
	#picturesbox4 {
		position : absolute;
		left : 5px;
		width : 550px;
		height : 800px;
		overflow:scroll;
	}
	#picturesbox5 {
		position : absolute;
		left : 5px;
		width : 550px;
		height : 800px;
		overflow:scroll;
	}
	#weather{
		padding : 5px;
		position : absolute;
		left : 580px;
		opacity : 0.45;
	}
</style>
<script>
var canvas, drop;
function initiate(){
  var images;
  for(var k=0; k<7; k++){
		images=document.querySelectorAll('#picturesbox'+ k + '> img');
		for(var i=0; i<images.length; i++){
		    images[i].addEventListener('dragstart', dragged, false);
		    images[i].addEventListener('dragend', ending, false);
		}
  }

  drop=document.getElementById('canvas');
  canvas=drop.getContext('2d');

  drop.addEventListener('dragover', function(e){ e.preventDefault(); }, false);
  drop.addEventListener('drop', dropped, false);
}
function ending(e){
 var elem=e.target;
}
function dragged(e){
  var elem=e.target;
	console.log(elem.getAttribute('id'));
  var fit = 'f' + elem.getAttribute('id');
  	console.log(fit);
  e.dataTransfer.setData('aa', 'f' + elem.getAttribute('id'));
  e.dataTransfer.setDragImage(e.target, 0, 0); 
}
function dropped(e){
  e.preventDefault();
  var id=e.dataTransfer.getData('aa');
  var elem=document.getElementById(id);

  var posx=e.pageX-drop.offsetLeft;
  var posy=e.pageY-drop.offsetTop;
  
  canvas.drawImage(elem,posx-593,posy-204,350,350);
  
}
window.addEventListener('load', initiate, false);

function save() {	
    localStorage.setItem("canvas", drop.toDataURL());
}
	
function del() {
 	canvas.clearRect(0,0,drop.width,drop.height);
}	
	
function loading() {	    
	var img = new Image();
    img.src = localStorage.getItem("canvas");
    img.onload = function() {
    	canvas.drawImage(img, 0, 0);
    }
}

function displayWeather(type) {
	if(type == 1) {
		document.getElementById("spring").style.display='block';
		document.getElementById("summer").style.display='none';
		document.getElementById("fall").style.display='none';
		document.getElementById("winter").style.display='none';

	}else if(type == 2) {
		document.getElementById("spring").style.display='none';
		document.getElementById("summer").style.display='block';
		document.getElementById("fall").style.display='none';
		document.getElementById("winter").style.display='none';
	}else if(type == 3){
		document.getElementById("spring").style.display='none';
		document.getElementById("summer").style.display='none';
		document.getElementById("fall").style.display='block';
		document.getElementById("winter").style.display='none';	
	}else if(type == 4){
		document.getElementById("spring").style.display='none';
		document.getElementById("summer").style.display='none';
		document.getElementById("fall").style.display='none';
		document.getElementById("winter").style.display='block';
	}else if(type == 5){
		document.getElementById("spring").style.display='none';
		document.getElementById("summer").style.display='none';
		document.getElementById("fall").style.display='none';
		document.getElementById("winter").style.display='none';
	}
}

function displayClothes(type) {
	if(type == 1) {
		document.getElementById("defaultCloset").style.display='none';
		document.getElementById("picturesbox1").style.display='block';
		document.getElementById("picturesbox2").style.display='none';
		document.getElementById("picturesbox3").style.display='none';
		document.getElementById("picturesbox4").style.display='none';
		document.getElementById("picturesbox5").style.display='none';
	}else if(type == 2) {
		document.getElementById("defaultCloset").style.display='none';
		document.getElementById("picturesbox1").style.display='none';
		document.getElementById("picturesbox2").style.display='block';
		document.getElementById("picturesbox3").style.display='none';
		document.getElementById("picturesbox4").style.display='none';
		document.getElementById("picturesbox5").style.display='none';
	}else if(type == 3){
		document.getElementById("defaultCloset").style.display='none';
		document.getElementById("picturesbox1").style.display='none';
		document.getElementById("picturesbox2").style.display='none';
		document.getElementById("picturesbox3").style.display='block';
		document.getElementById("picturesbox4").style.display='none';	
		document.getElementById("picturesbox5").style.display='none';
	}else if(type == 4){
		document.getElementById("defaultCloset").style.display='none';
		document.getElementById("picturesbox1").style.display='none';
		document.getElementById("picturesbox2").style.display='none';
		document.getElementById("picturesbox3").style.display='none';
		document.getElementById("picturesbox4").style.display='block';
		document.getElementById("picturesbox5").style.display='none';
	}
	else if(type == 5){
		document.getElementById("defaultCloset").style.display='none';
		document.getElementById("picturesbox1").style.display='none';
		document.getElementById("picturesbox2").style.display='none';
		document.getElementById("picturesbox3").style.display='none';
		document.getElementById("picturesbox4").style.display='none';
		document.getElementById("picturesbox5").style.display='block';
	}
	else if(type == 6){
		document.getElementById("defaultCloset").style.display='block';
		document.getElementById("picturesbox1").style.display='none';
		document.getElementById("picturesbox2").style.display='none';
		document.getElementById("picturesbox3").style.display='none';
		document.getElementById("picturesbox4").style.display='none';
		document.getElementById("picturesbox5").style.display='none';
	}
}

</script>
<body>
<h1><img src="images/logo.png" height = "75px">Style Manager<img src="images/logo.png" height = "75px"></h1>
<div>
<p>
    <button onclick="save();">코디 저장하기</button>
    <button onclick="loading();">코디 읽어오기</button>
    <button onclick="del();">코디 지우기</button>
</p>
<p>
  <!-- 옷장 탭구분 등록 fuction -->  
    <button onclick="displayClothes(1);">상의</button>
    <button onclick="displayClothes(2);">하의</button>
    <button onclick="displayClothes(3);">신발</button>
    <button onclick="displayClothes(4);">기타</button>
    <button onclick="displayClothes(5);">SM's 추천 코디</button>
    <button onclick="displayClothes(6);">옷장 문 닫기</button>
  </p>
  <p> 
    <!-- 계절 BG 등록 fuction -->  
    <button onclick="displayWeather(1);">봄</button>
    <button onclick="displayWeather(2);">여름</button>
    <button onclick="displayWeather(3);">가을</button>
    <button onclick="displayWeather(4);">겨울</button>
    <button onclick="displayWeather(5);">배경 없음</button>
   </p>
   </div>
   
	<br>
  <!-- 캔버스 영역 설정  -->
  <section id="dropbox">
    <canvas id="canvas" width="650" height="1500"></canvas>
  </section>
   
   <!-- 상의 아이템 -->
  <section id="picturesbox1" style="display:none">
 
  	<!-- 여성 상의 -->
  	<label>여성</label>
  	<hr>
    <img id="wt001" src="images/wt001.png" height="125px">
    <img id="wt002" src="images/wt002.png" height="125px">
    <img id="wt003" src="images/wt003.png" height="125px">
    <img id="wt004" src="images/wt004.png" height="125px">
    <img id="wt005" src="images/wt005.png" height="125px">
    <img id="wt006" src="images/wt006.png" height="125px">
    <img id="wt007" src="images/wt007.png" height="125px">
    <img id="wt008" src="images/wt008.png" height="125px">
    <img id="wt009" src="images/wt009.png" height="125px">
    <img id="wt010" src="images/wt010.png" height="125px">
    <img id="wt011" src="images/wt011.png" height="125px">
    <img id="wt012" src="images/wt012.png" height="125px">
    <img id="wt013" src="images/wt013.png" height="125px">
    <img id="wt014" src="images/wt014.png" height="125px">
    <img id="wt015" src="images/wt015.png" height="125px">
    <img id="wt016" src="images/wt016.png" height="125px">
    <img id="wt017" src="images/wt017.png" height="125px">
    <img id="wt018" src="images/wt018.png" height="125px">
    <img id="wt019" src="images/wt019.png" height="125px">
    <img id="wt020" src="images/wt020.png" height="125px">
    <img id="wt021" src="images/wt021.png" height="125px">
    <img id="wt022" src="images/wt022.png" height="125px">
    <img id="wt023" src="images/wt023.png" height="125px">
    <img id="wt024" src="images/wt024.png" height="125px">
    <img id="wt025" src="images/wt025.png" height="125px">
    <img id="wt026" src="images/wt026.png" height="125px">
    <img id="wt027" src="images/wt027.png" height="125px">
    <img id="wt028" src="images/wt028.png" height="125px">
    <img id="wt029" src="images/wt029.png" height="125px">
    <img id="wt030" src="images/wt030.png" height="125px">
    <img id="wt031" src="images/wt031.png" height="125px">
    
    <!-- 남성 상의 -->
    <br>
    <label>남성</label>
  	<hr>
    <img id="mt001" src="images/mt001.png" height="125px">
    <img id="mt002" src="images/mt002.png" height="125px">
    <img id="mt003" src="images/mt003.png" height="125px">
    <img id="mt004" src="images/mt004.png" height="125px">
    <img id="mt005" src="images/mt005.png" height="125px">
    <img id="mt007" src="images/mt007.png" height="125px">
    <img id="mt008" src="images/mt008.png" height="125px">
    <img id="mt009" src="images/mt009.png" height="125px">
    <img id="mt010" src="images/mt010.png" height="125px">
    <img id="mt011" src="images/mt011.png" height="125px">
    <img id="mt012" src="images/mt012.png" height="125px">
    <img id="mt013" src="images/mt013.png" height="125px">
    <img id="mt014" src="images/mt014.png" height="125px">
    <img id="mt015" src="images/mt015.png" height="125px">
    <img id="mt016" src="images/mt016.png" height="125px">
    <img id="mt017" src="images/mt017.png" height="125px">
    <img id="mt018" src="images/mt018.png" height="125px">
    <img id="mt019" src="images/mt019.png" height="125px">
    <img id="mt020" src="images/mt020.png" height="125px">         	
    <img id="mt021" src="images/mt021.png" height="125px">
    <img id="mt022" src="images/mt022.png" height="125px">
    <img id="mt023" src="images/mt023.png" height="125px">
    <img id="mt024" src="images/mt024.png" height="125px">
    <img id="mt025" src="images/mt025.png" height="125px">
    <img id="mt026" src="images/mt026.png" height="125px">
    <img id="mt027" src="images/mt027.png" height="125px">
    <img id="mt028" src="images/mt028.png" height="125px">
    <img id="mt029" src="images/mt029.png" height="125px">
    <img id="mt030" src="images/mt030.png" height="125px">
    <img id="mt031" src="images/mt031.png" height="125px">
    <img id="mt032" src="images/mt032.png" height="125px">
    <img id="mt033" src="images/mt033.png" height="125px">
    <img id="mt034" src="images/mt034.png" height="125px">
    <img id="mt035" src="images/mt035.png" height="125px">
    <img id="mt036" src="images/mt036.png" height="125px">
    <img id="mt037" src="images/mt037.png" height="125px">
    <img id="mt038" src="images/mt038.png" height="125px"> 	
  </section>
  
   <!-- 하의 아이템 --> 
  <section id="picturesbox2" style="display:none">
  
  <!-- 여성 하의 -->
    <label>여성</label>
  	<hr>
    <img id="wp001" src="images/wp001.png" height="125px">
    <img id="wp002" src="images/wp002.png" height="125px">
    <img id="wp003" src="images/wp003.png" height="125px">
    <img id="wp004" src="images/wp004.png" height="125px">
    <img id="wp005" src="images/wp005.png" height="125px">
    <img id="wp006" src="images/wp006.png" height="125px">
    <img id="wp007" src="images/wp007.png" height="125px">
    <img id="wp008" src="images/wp008.png" height="125px">
    <img id="wp009" src="images/wp009.png" height="125px">
    <img id="wp010" src="images/wp010.png" height="125px">
    <img id="wp011" src="images/wp011.png" height="125px">
    <img id="wp012" src="images/wp012.png" height="125px">
    <img id="wp013" src="images/wp013.png" height="125px">
    <img id="wp014" src="images/wp014.png" height="125px">
    <img id="wp015" src="images/wp015.png" height="125px">
    <img id="wp016" src="images/wp016.png" height="125px">
    <img id="wp017" src="images/wp017.png" height="125px">
    <img id="wp018" src="images/wp018.png" height="125px">
    <img id="wp019" src="images/wp019.png" height="125px">
    <img id="wp020" src="images/wp020.png" height="125px">
    <img id="wp021" src="images/wp021.png" height="125px">
    
  <!-- 남성 하의 -->
  	<br>
    <label>남성</label>
  	<hr>
    <img id="mp001" src="images/mp001.png" height="125px">
    <img id="mp002" src="images/mp002.png" height="125px">
    <img id="mp003" src="images/mp003.png" height="125px">
    <img id="mp004" src="images/mp004.png" height="125px">
    <img id="mp005" src="images/mp005.png" height="125px">
    <img id="mp006" src="images/mp006.png" height="125px">
    <img id="mp007" src="images/mp007.png" height="125px">
    <img id="mp008" src="images/mp008.png" height="125px">
    <img id="mp009" src="images/mp009.png" height="125px">
 </section> 
 
   <!-- 신발 아이템-->
  <section id="picturesbox3" style="display:none">
    <!-- 여성 신발 -->
    <label>여성</label>
  	<hr>
    <img id="ws001" src="images/ws001.png" height="125px">
    <img id="ws002" src="images/ws002.png" height="125px">
    <img id="ws003" src="images/ws003.png" height="125px">
    <img id="ws004" src="images/ws004.png" height="125px">
    <img id="ws005" src="images/ws005.png" height="125px">
    <img id="ws006" src="images/ws006.png" height="125px">
    
    <!-- 남성 신발 -->
    <br>
    <label>남성</label>
  	<hr>
  	
 </section> 
 
   <!-- 기타 아이템 -->
   <section id="picturesbox4" style="display:none">
   <!-- 여성 기타 -->
    <label>여성</label>
  	<hr>
    <img id="we002" src="images/we002.png" height="125px">   
    <img id="we003" src="images/we003.png" height="125px">
    <img id="we004" src="images/we004.png" height="125px">
    <img id="we005" src="images/we005.png" height="125px">
    <img id="we006" src="images/we006.png" height="125px">
    <img id="we007" src="images/we007.png" height="125px">
    <img id="we008" src="images/we008.png" height="125px">
    
    <!-- 남성 기타 -->
    <br>
    <label>남성</label>
  	<hr>
    <img id="me001" src="images/me001.png" height="125px">
    <img id="me004" src="images/me004.png" height="125px">
    <img id="me006" src="images/me006.png" height="125px">
    <img id="me007" src="images/me007.png" height="125px">
    <img id="me008" src="images/me008.png" height="125px">
    <img id="me009" src="images/me009.png" height="125px">
    <img id="me011" src="images/me011.png" height="125px">
    <img id="me012" src="images/me012.png" height="125px">
    <img id="me013" src="images/me013.png" height="125px">
    <img id="me014" src="images/me014.png" height="125px">
    <img id="me015" src="images/me015.png" height="125px">    	
 </section> 

	<!-- 랜덤 아이템 --> 
  <section id="picturesbox5" style="display:none">
    <% 
  	int wshirtnum = (int)(Math.random()*31+1); // 상의 31개
  	String wshirt = String.format("%03d",wshirtnum);
  	int wpantsnum = (int)(Math.random()*21+1); // 하의 21개
  	String wpants = String.format("%03d",wpantsnum);
  	int wshoes = (int)(Math.random()*6+1); // 신발 6개
  	%>
  	<!-- 여성 랜덤 -->
  	<label>여성</label>
  	<hr>
	<img id="wt<%= wshirt %>" src="images/wt<%= wshirt %>.png" height="125px">
	<img id="wp<%= wpants %>" src="images/wp<%= wpants %>.png" height="125px">
	<img id="ws00<%= wshoes %>"src="images/ws00<%= wshoes %>.png" height="125px">
	
	<% 
  	int mshirtnum = (int)(Math.random()*37+1); // 상의 37개
  	String mshirt = String.format("%03d",mshirtnum);
  	int mpantsnum = (int)(Math.random()*8+1); // 하의 8개
  	String mpants = String.format("%03d",mpantsnum);
  	int mshoes = (int)(Math.random()*6+1); // 신발 6개
  	%>
	
   	<!-- 남성 랜덤 -->
   	<br>
  	<label>남성</label>
  	<hr>
	<img id="mt<%= mshirt %>" src="images/mt<%= mshirt %>.png" height="125px">
	<img id="mp<%= mpants %>" src="images/mp<%= mpants %>.png" height="125px">
	<img id="ms00<%= mshoes %>"src="images/ms00<%= mshoes %>.png" height="125px">  
 </section> 
 
 <!-- 착용샷 변환용 -->
 <section id="picturesbox6" style="display:none">
 <!-- 여성 상의 --> 
    <img id="fwt001" src="images/fwt001.png" height="400px">
    <img id="fwt002" src="images/fwt002.png" height="400px">
    <img id="fwt003" src="images/fwt003.png" height="400px">
    <img id="fwt004" src="images/fwt004.png" height="400px">
    <img id="fwt005" src="images/fwt005.png" height="400px">
    <img id="fwt006" src="images/fwt006.png" height="400px">
    <img id="fwt007" src="images/fwt007.png" height="400px">
    <img id="fwt008" src="images/fwt008.png" height="400px">
    <img id="fwt009" src="images/fwt009.png" height="400px">
    <img id="fwt010" src="images/fwt010.png" height="400px">
    <img id="fwt011" src="images/fwt011.png" height="400px">
    <img id="fwt012" src="images/fwt012.png" height="400px">
    <img id="fwt013" src="images/fwt013.png" height="400px">
    <img id="fwt014" src="images/fwt014.png" height="400px">
    <img id="fwt015" src="images/fwt015.png" height="400px">
    <img id="fwt016" src="images/fwt016.png" height="400px">
    <img id="fwt017" src="images/fwt017.png" height="400px">
    <img id="fwt018" src="images/fwt018.png" height="400px">
    <img id="fwt019" src="images/fwt019.png" height="400px">
    <img id="fwt020" src="images/fwt020.png" height="400px">
    <img id="fwt021" src="images/fwt021.png" height="400px">
    <img id="fwt022" src="images/fwt022.png" height="400px">
    <img id="fwt023" src="images/fwt023.png" height="400px">
    <img id="fwt024" src="images/fwt024.png" height="400px">
    <img id="fwt025" src="images/fwt025.png" height="400px">
    <img id="fwt026" src="images/fwt026.png" height="400px">
    <img id="fwt027" src="images/fwt027.png" height="400px">
    <img id="fwt028" src="images/fwt028.png" height="400px">
    <img id="fwt029" src="images/fwt029.png" height="400px">
    <img id="fwt030" src="images/fwt030.png" height="400px">
    <img id="fwt031" src="images/fwt031.png" height="400px">
    
 <!-- 남성 상의 -->
    <img id="fmt001" src="images/fmt001.png" height="125px">
    <img id="fmt002" src="images/fmt002.png" height="125px">
    <img id="fmt003" src="images/fmt003.png" height="125px">
    <img id="fmt004" src="images/fmt004.png" height="125px">
    <img id="fmt005" src="images/fmt005.png" height="125px">
    <img id="fmt007" src="images/fmt007.png" height="125px">
    <img id="fmt008" src="images/fmt008.png" height="125px">
    <img id="fmt009" src="images/fmt009.png" height="125px">
    <img id="fmt010" src="images/fmt010.png" height="125px">
    <img id="fmt011" src="images/fmt011.png" height="125px">
    <img id="fmt012" src="images/fmt012.png" height="125px">
    <img id="fmt013" src="images/fmt013.png" height="125px">
    <img id="fmt014" src="images/fmt014.png" height="125px">
    <img id="fmt015" src="images/fmt015.png" height="125px">
    <img id="fmt016" src="images/fmt016.png" height="125px">
    <img id="fmt017" src="images/fmt017.png" height="125px">
    <img id="fmt018" src="images/fmt018.png" height="125px">
    <img id="fmt019" src="images/fmt019.png" height="125px">
    <img id="fmt020" src="images/fmt020.png" height="125px">         	
    <img id="fmt021" src="images/fmt021.png" height="125px">
    <img id="fmt022" src="images/fmt022.png" height="125px">
    <img id="fmt023" src="images/fmt023.png" height="125px">
    <img id="fmt024" src="images/fmt024.png" height="125px">
    <img id="fmt025" src="images/fmt025.png" height="125px">
    <img id="fmt026" src="images/fmt026.png" height="125px">
    <img id="fmt027" src="images/fmt027.png" height="125px">
    <img id="fmt028" src="images/fmt028.png" height="125px">
    <img id="fmt029" src="images/fmt029.png" height="125px">
    <img id="fmt030" src="images/fmt030.png" height="125px">
    <img id="fmt031" src="images/fmt031.png" height="125px">
    <img id="fmt032" src="images/fmt032.png" height="125px">
    <img id="fmt033" src="images/fmt033.png" height="125px">
    <img id="fmt034" src="images/fmt034.png" height="125px">
    <img id="fmt035" src="images/fmt035.png" height="125px">
    <img id="fmt036" src="images/fmt036.png" height="125px">
    <img id="fmt037" src="images/fmt037.png" height="125px">
    <img id="fmt038" src="images/fmt038.png" height="125px"> 	
    
<!-- 여성 하의 -->
    <img id="fwp001" src="images/fwp001.png" height="125px">
    <img id="fwp002" src="images/fwp002.png" height="125px">
    <img id="fwp003" src="images/fwp003.png" height="125px">
    <img id="fwp004" src="images/fwp004.png" height="125px">
    <img id="fwp005" src="images/fwp005.png" height="125px">
    <img id="fwp006" src="images/fwp006.png" height="125px">
    <img id="fwp007" src="images/fwp007.png" height="125px">
    <img id="fwp008" src="images/fwp008.png" height="125px">
    <img id="fwp009" src="images/fwp009.png" height="125px">
    <img id="fwp010" src="images/fwp010.png" height="125px">
    <img id="fwp011" src="images/fwp011.png" height="125px">
    <img id="fwp012" src="images/fwp012.png" height="125px">
    <img id="fwp013" src="images/fwp013.png" height="125px">
    <img id="fwp014" src="images/fwp014.png" height="125px">
    <img id="fwp015" src="images/fwp015.png" height="125px">
    <img id="fwp016" src="images/fwp016.png" height="125px">
    <img id="fwp017" src="images/fwp017.png" height="125px">
    <img id="fwp018" src="images/fwp018.png" height="125px">
    <img id="fwp019" src="images/fwp019.png" height="125px">
    <img id="fwp020" src="images/fwp020.png" height="125px">
    <img id="fwp021" src="images/fwp021.png" height="125px">
    
<!-- 남성 하의 -->    
    <img id="fmp001" src="images/fmp001.png" height="125px">
    <img id="fmp002" src="images/fmp002.png" height="125px">
    <img id="fmp003" src="images/fmp003.png" height="125px">
    <img id="fmp004" src="images/fmp004.png" height="125px">
    <img id="fmp005" src="images/fmp005.png" height="125px">
    <img id="fmp006" src="images/fmp006.png" height="125px">
    <img id="fmp007" src="images/fmp007.png" height="125px">
    <img id="fmp008" src="images/fmp008.png" height="125px">
    <img id="fmp009" src="images/fmp009.png" height="125px">
    
<!-- 여성 신발 -->
    <img id="fws001" src="images/fws001.png" height="125px">
    <img id="fws002" src="images/fws002.png" height="125px">
    <img id="fws003" src="images/fws003.png" height="125px">
    <img id="fws004" src="images/fws004.png" height="125px">
    <img id="fws005" src="images/fws005.png" height="125px">
    <img id="fws006" src="images/fws006.png" height="125px">
    
<!-- 여성 기타 -->
    <img id="fwe002" src="images/fwe002.png" height="200px">
    <img id="fwe003" src="images/fwe003.png" height="200px">
    <img id="fwe004" src="images/fwe004.png" height="200px">
    <img id="fwe005" src="images/fwe005.png" height="200px">
    <img id="fwe006" src="images/fwe006.png" height="200px">
    <img id="fwe007" src="images/fwe007.png" height="200px">
    <img id="fwe008" src="images/fwe008.png" height="200px">
    
<!-- 남성 기타 -->    
    <img id="fme001" src="images/fme001.png" height="125px">
    <img id="fme004" src="images/fme004.png" height="125px">
    <img id="fme006" src="images/fme006.png" height="125px">
    <img id="fme007" src="images/fme007.png" height="125px">
    <img id="fme008" src="images/fme008.png" height="125px">
    <img id="fme009" src="images/fme009.png" height="125px">
    <img id="fme011" src="images/fme011.png" height="125px">
    <img id="fme012" src="images/fme012.png" height="125px">
    <img id="fme013" src="images/fme013.png" height="125px">  
    <img id="fme014" src="images/fme014.png" height="125px">
    <img id="fme015" src="images/fme015.png" height="125px">
 </section> 
 
 <section id=defaultCloset style="display:block">
 	<br>
 	<img src="images/closet.png">
 </section>

<section id = "weather">
<img id="spring" src="images/spring.png" style="display:none" width="660px" height="810px">
<img id="summer" src="images/summer.png" style="display:none" width="660px" height="810px">
<img id="fall" src="images/fall.png" style="display:none" width="660px" height="810px">
<img id="winter" src="images/winter.png" style="display:none" width="660px" height="810px">
</section>
</body>
</html>
