<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>What In My Closet</title>
  	<link href="https://fonts.googleapis.com/css?family=Poor Story:400" rel="stylesheet">
    <link rel="stylesheet" href="http://70.12.115.167:8000/miniproject/resources/hover.css">  
<style>
 	body{
		background-color: black;
	} 
	
	h1{
		
		text-align : center;
  		color : #fff;
  	}
  	label{
  		text-align : center;
  		font-family : Poor Story;
  		font-size : 17px;
  		font-weight : bold;
  	  	color : grey;
  	}
  	
  	div{
  		text-align : center;
  	}
  	html{
  		
  		background-repeat : no-repeat;
   		background-position : center;
		background-size : cover;
  	}
	#dropbox {
		position : absolute;
		z-index:1000;
		left : 580px;
		width : 650px;
		height : 800px;
	}
	#defaultCloset {
		position : absolute;
		left : 150px;
		top : 300px;
		width : 220px;
		height : 500px;
		background-image : url(http://70.12.115.167:8000/miniproject/resources/images/closet21.png);
  		background-repeat : no-repeat;
  		z-index: -1000;
  		border-radius : 20px;
  		
	}
	#picturesbox1 {
		position : absolute;
		left : 5px;
		width : 550px;
		height : 515px;
		overflow:scroll;
	}
	#picturesbox2 {
		position : absolute;
		left : 5px;
		width : 550px;
		height : 515px;
		overflow:scroll;
	}
	#picturesbox3 {
		position : absolute;
		left : 5px;
		width : 550px;
		height : 515px;
		overflow:scroll;
	}
	#picturesbox4 {
		position : absolute;
		left : 5px;
		width : 550px;
		height : 515px;
		overflow:scroll;
	}
	#picturesbox5 {
		position : absolute;
		left : 5px;
		width : 550px;
		height : 515px;
		overflow:scroll;
	}
	#weather{
		padding : 5px;
		position : absolute;
		z-index:0;
		left : 580px;
		opacity : 0.9;
	}

</style>
<script>
var canvas, drop1, drop2;
var imgInfo = new Array();
var imgDom = new Array();
var imgX = new Array();
var imgY = new Array();

function initiate(){
  var images;
  for(var k=0; k<7; k++){
		images=document.querySelectorAll('#picturesbox'+ k + '> img');
		for(var i=0; i<images.length; i++){
		    images[i].addEventListener('dragstart', dragged, false);
		    images[i].addEventListener('dragend', ending, false);
		}
  }

  drop1=document.getElementById('canvas');
  drop2=document.getElementById('weather');	// 그림위에도 이미지를 드래그 앤 드롭 가능하게 하기위하여 구현
  canvas=drop1.getContext('2d');

  drop1.addEventListener('dragover', function(e){ e.preventDefault(); }, false);
  drop1.addEventListener('drop', dropped, false);
  
  drop2.addEventListener('dragover', function(e){ e.preventDefault(); }, false);
  drop2.addEventListener('drop', dropped, false);
	//그림위에도 이미지를 드래그 앤 드롭 가능하게 하기위하여 구현
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
  // Data에 Set할때 id를 받아와 앞에 f를 붙여 담아냄으로 이미지를 드래그 앤 드롭 했을 때 제품샷이 -> 착용샷으로 변경되게 끔 설정.
  e.dataTransfer.setDragImage(e.target, 0, 0); 
}
function dropped(e){
  e.preventDefault();
  var id=e.dataTransfer.getData('aa');
  var elem=document.getElementById(id);

  var posx=e.pageX-drop1.offsetLeft;
  var posy=e.pageY-drop1.offsetTop;
  canvas.drawImage(elem,posx-593,posy-304);
  //캔버스에 이미지가 들어가게될 위치의 영점조절(-593,-304)및 해당 크기로 들어가 지게끔 설정.
  imgDom.push(elem);
  imgX.push(posx-593);
  imgY.push(posy-304);

 // imgInfo.push({imgDom:elem, imgX:posx-593, imgY:posy-434}); //착용정보의 이미지 태그가 담김
  console.log(imgDom);
  
}
window.addEventListener('load', initiate, false);

function save() {
    localStorage.setItem("canvas", drop1.toDataURL());
}
	
function del() {
 	canvas.clearRect(0,0,drop1.width,drop1.height);
 	// (0,0)좌표 부터 (drop1.width,drop1.height)의 영역 만큼 제거
 	
	for(var i = 0; i <= imgDom.length; i++){
		imgDom.pop();
		imgX.pop();
		imgY.pop();	
 		//imgInfo 에 담긴 객체를 전부 삭제
	}
}

function loading() {
	var img = new Image();
    img.src = localStorage.getItem("canvas");
    img.onload = function() {
    	canvas.drawImage(img, 0, 0);
    }
}

function cancel() {
	canvas.clearRect(0,0,drop1.width,drop1.height);// 먼저 화면 비우고
	//imgInfo.pop();

	imgDom.pop();
	imgX.pop();
	imgY.pop();	
	for(var i = 0; i <= imgDom.length; i++){
		canvas.drawImage(imgDom[i],imgX[i],imgY[i]);
 		//imgInfo 에 담긴 객체를 가지고 순서대로 전부 drawImage
	}
}

// tpo에 따른 계절 배경이 해당 버튼마다 나타났다 사라지는 display 함수 구현 
function displayWeather(type) {
	if(type == 1) {
		document.getElementById("backimg").style.display='none';
		document.getElementById("spring").style.display='block';
		document.getElementById("summer").style.display='none';
		document.getElementById("fall").style.display='none';
		document.getElementById("winter").style.display='none';

	}else if(type == 2) {
		document.getElementById("backimg").style.display='none';
		document.getElementById("spring").style.display='none';
		document.getElementById("summer").style.display='block';
		document.getElementById("fall").style.display='none';
		document.getElementById("winter").style.display='none';
	}else if(type == 3){
		document.getElementById("backimg").style.display='none';
		document.getElementById("spring").style.display='none';
		document.getElementById("summer").style.display='none';
		document.getElementById("fall").style.display='block';
		document.getElementById("winter").style.display='none';	
	}else if(type == 4){
		document.getElementById("backimg").style.display='none';
		document.getElementById("spring").style.display='none';
		document.getElementById("summer").style.display='none';
		document.getElementById("fall").style.display='none';
		document.getElementById("winter").style.display='block';
	}else if(type == 5){
		document.getElementById("backimg").style.display='none';
		document.getElementById("spring").style.display='none';
		document.getElementById("summer").style.display='none';
		document.getElementById("fall").style.display='none';
		document.getElementById("winter").style.display='none';
	}
}
// 옷장 이미지와 상의, 하의, 신발, 기타, 랜덤의 분류 버튼을 나타내줄 display 함수 구현
function displayClothes(type) {
	if(type == 1) {
		document.getElementById("defaultCloset").style.opacity='0.3';
		document.getElementById("picturesbox1").style.display='block';
		document.getElementById("picturesbox2").style.display='none';
		document.getElementById("picturesbox3").style.display='none';
		document.getElementById("picturesbox4").style.display='none';
		document.getElementById("picturesbox5").style.display='none';
	}else if(type == 2) {
		document.getElementById("defaultCloset").style.opacity='0.3';
		document.getElementById("picturesbox1").style.display='none';
		document.getElementById("picturesbox2").style.display='block';
		document.getElementById("picturesbox3").style.display='none';
		document.getElementById("picturesbox4").style.display='none';
		document.getElementById("picturesbox5").style.display='none';
	}else if(type == 3){
		document.getElementById("defaultCloset").style.opacity='0.3';
		document.getElementById("picturesbox1").style.display='none';
		document.getElementById("picturesbox2").style.display='none';
		document.getElementById("picturesbox3").style.display='block';
		document.getElementById("picturesbox4").style.display='none';	
		document.getElementById("picturesbox5").style.display='none';
	}else if(type == 4){
		document.getElementById("defaultCloset").style.opacity='0.3';
		document.getElementById("picturesbox1").style.display='none';
		document.getElementById("picturesbox2").style.display='none';
		document.getElementById("picturesbox3").style.display='none';
		document.getElementById("picturesbox4").style.display='block';
		document.getElementById("picturesbox5").style.display='none';
	}
	else if(type == 5){
		document.getElementById("defaultCloset").style.opacity='0.3';
		document.getElementById("picturesbox1").style.display='none';
		document.getElementById("picturesbox2").style.display='none';
		document.getElementById("picturesbox3").style.display='none';
		document.getElementById("picturesbox4").style.display='none';
		document.getElementById("picturesbox5").style.display='block';
	}
	else if(type == 6){
		document.getElementById("defaultCloset").style.opacity='1.0';
		document.getElementById("picturesbox1").style.display='none';
		document.getElementById("picturesbox2").style.display='none';
		document.getElementById("picturesbox3").style.display='none';
		document.getElementById("picturesbox4").style.display='none';
		document.getElementById("picturesbox5").style.display='none';
	}
}

</script>
<body>
<br>
<h1>What In My Closet</h1>
<div>

  <!-- 코디 저장 및 불러오기 fuction -->
<p>
<div class="btn_wrap" >
	<span id="boxing" >Make MY LOOKBOOK</span>
		<div class="container">
    		<button onclick="save();">Save your Look</button>
    		<button onclick="loading();">Load your Look</button>
    		<button onclick="del();">Initialize your Look</button>
    		<button onclick="cancel();">Get back to Look you just made</button>
    	</div>
</div>
</p>

  <!-- 옷장 탭구분 등록 fuction -->
<p>
<div class="btn_wrap1" >
	<span id="boxing1" >MY CLOSET TOUR</span>
		<div class="container1">
    		<button onclick="displayClothes(1);">Tops</button>
   		 	<button onclick="displayClothes(2);">Bottoms</button>
    		<button onclick="displayClothes(3);">Shoes</button>
    		<button onclick="displayClothes(4);">Bags & Hats</button>
   			<button onclick="displayClothes(5);">SM STYLING TIPS</button>
    		<button onclick="displayClothes(6);">CLOSE MY CLOSET</button>
       </div>
</div>
  </p>
  
  <!-- 계절 BG 등록 fuction -->
  <p> 
  <div class="btn_wrap2" >
	<span id="boxing2" >TIME, PLACE, OCCASION</span>
		<div class="container2">
    		<button onclick="displayWeather(1);">Spring</button>
    		<button onclick="displayWeather(2);">Summer</button>
    		<button onclick="displayWeather(3);">Fall</button>
    		<button onclick="displayWeather(4);">Winter</button>
    		<button onclick="displayWeather(5);">None</button>
    	</div>
  </div>
   </p>
   </div>
	<br>
  <!-- 캔버스 영역 설정  -->
  <section id="dropbox">
    <canvas id="canvas" width="650" height="820"></canvas>
  </section>
   
   <!-- 상의 아이템 -->
  <section id="picturesbox1" style="display:none">
 
  	<!-- 여성 상의 -->
  	<br>
  	<label>◎ WOMEN ◎</label>
  	<br>
    <img id="wt001" src="http://70.12.115.167:8000/miniproject/resources/images/wt001.png" height="125px">
    <img id="wt002" src="http://70.12.115.167:8000/miniproject/resources/images/wt002.png" height="125px">
    <img id="wt003" src="http://70.12.115.167:8000/miniproject/resources/images/wt003.png" height="125px">
    <img id="wt004" src="http://70.12.115.167:8000/miniproject/resources/images/wt004.png" height="125px">
    <img id="wt005" src="http://70.12.115.167:8000/miniproject/resources/images/wt005.png" height="125px">
    <img id="wt006" src="http://70.12.115.167:8000/miniproject/resources/images/wt006.png" height="125px">
    <img id="wt007" src="http://70.12.115.167:8000/miniproject/resources/images/wt007.png" height="125px">
    <img id="wt008" src="http://70.12.115.167:8000/miniproject/resources/images/wt008.png" height="125px">
    <img id="wt009" src="http://70.12.115.167:8000/miniproject/resources/images/wt009.png" height="125px">
    <img id="wt010" src="http://70.12.115.167:8000/miniproject/resources/images/wt010.png" height="125px">
    <img id="wt011" src="http://70.12.115.167:8000/miniproject/resources/images/wt011.png" height="125px">
    <img id="wt012" src="http://70.12.115.167:8000/miniproject/resources/images/wt012.png" height="125px">
    <img id="wt013" src="http://70.12.115.167:8000/miniproject/resources/images/wt013.png" height="125px">
    <img id="wt014" src="http://70.12.115.167:8000/miniproject/resources/images/wt014.png" height="125px">
    <img id="wt015" src="http://70.12.115.167:8000/miniproject/resources/images/wt015.png" height="125px">
    <img id="wt016" src="http://70.12.115.167:8000/miniproject/resources/images/wt016.png" height="125px">
    <img id="wt017" src="http://70.12.115.167:8000/miniproject/resources/images/wt017.png" height="125px">
    <img id="wt018" src="http://70.12.115.167:8000/miniproject/resources/images/wt018.png" height="125px">
    <img id="wt019" src="http://70.12.115.167:8000/miniproject/resources/images/wt019.png" height="125px">
    <img id="wt020" src="http://70.12.115.167:8000/miniproject/resources/images/wt020.png" height="125px">
    <img id="wt021" src="http://70.12.115.167:8000/miniproject/resources/images/wt021.png" height="125px">
    <img id="wt022" src="http://70.12.115.167:8000/miniproject/resources/images/wt022.png" height="125px">
    <img id="wt023" src="http://70.12.115.167:8000/miniproject/resources/images/wt023.png" height="125px">
    <img id="wt024" src="http://70.12.115.167:8000/miniproject/resources/images/wt024.png" height="125px">
    <img id="wt025" src="http://70.12.115.167:8000/miniproject/resources/images/wt025.png" height="125px">
    <img id="wt026" src="http://70.12.115.167:8000/miniproject/resources/images/wt026.png" height="125px">
    <img id="wt027" src="http://70.12.115.167:8000/miniproject/resources/images/wt027.png" height="125px">
    <img id="wt028" src="http://70.12.115.167:8000/miniproject/resources/images/wt028.png" height="125px">
    <img id="wt029" src="http://70.12.115.167:8000/miniproject/resources/images/wt029.png" height="125px">
    <img id="wt030" src="http://70.12.115.167:8000/miniproject/resources/images/wt030.png" height="125px">
    <img id="wt031" src="http://70.12.115.167:8000/miniproject/resources/images/wt031.png" height="125px">
    
    <!-- 남성 상의 -->
    <br>
    <label>◎ MEN ◎</label>
  	<br>
    <img id="mt001" src="http://70.12.115.167:8000/miniproject/resources/images/mt001.png" height="125px">
    <img id="mt002" src="http://70.12.115.167:8000/miniproject/resources/images/mt002.png" height="125px">
    <img id="mt003" src="http://70.12.115.167:8000/miniproject/resources/images/mt003.png" height="125px">
    <img id="mt004" src="http://70.12.115.167:8000/miniproject/resources/images/mt004.png" height="125px">
    <img id="mt005" src="http://70.12.115.167:8000/miniproject/resources/images/mt005.png" height="125px">
    <img id="mt006" src="http://70.12.115.167:8000/miniproject/resources/images/mt006.png" height="125px">
    <img id="mt007" src="http://70.12.115.167:8000/miniproject/resources/images/mt007.png" height="125px">
    <img id="mt008" src="http://70.12.115.167:8000/miniproject/resources/images/mt008.png" height="125px">
    <img id="mt009" src="http://70.12.115.167:8000/miniproject/resources/images/mt009.png" height="125px">
    <img id="mt010" src="http://70.12.115.167:8000/miniproject/resources/images/mt010.png" height="125px">
    <img id="mt011" src="http://70.12.115.167:8000/miniproject/resources/images/mt011.png" height="125px">
    <img id="mt012" src="http://70.12.115.167:8000/miniproject/resources/images/mt012.png" height="125px">
    <img id="mt013" src="http://70.12.115.167:8000/miniproject/resources/images/mt013.png" height="125px">
    <img id="mt014" src="http://70.12.115.167:8000/miniproject/resources/images/mt014.png" height="125px">
    <img id="mt015" src="http://70.12.115.167:8000/miniproject/resources/images/mt015.png" height="125px">
    <img id="mt016" src="http://70.12.115.167:8000/miniproject/resources/images/mt016.png" height="125px">
    <img id="mt017" src="http://70.12.115.167:8000/miniproject/resources/images/mt017.png" height="125px">
    <img id="mt018" src="http://70.12.115.167:8000/miniproject/resources/images/mt018.png" height="125px">
    <img id="mt019" src="http://70.12.115.167:8000/miniproject/resources/images/mt019.png" height="125px">
    <img id="mt020" src="http://70.12.115.167:8000/miniproject/resources/images/mt020.png" height="125px">         	
    <img id="mt021" src="http://70.12.115.167:8000/miniproject/resources/images/mt021.png" height="125px">
    <img id="mt022" src="http://70.12.115.167:8000/miniproject/resources/images/mt022.png" height="125px">
    <img id="mt023" src="http://70.12.115.167:8000/miniproject/resources/images/mt023.png" height="125px">
    <img id="mt024" src="http://70.12.115.167:8000/miniproject/resources/images/mt024.png" height="125px">
    <img id="mt025" src="http://70.12.115.167:8000/miniproject/resources/images/mt025.png" height="125px">
    <img id="mt026" src="http://70.12.115.167:8000/miniproject/resources/images/mt026.png" height="125px">
    <img id="mt027" src="http://70.12.115.167:8000/miniproject/resources/images/mt027.png" height="125px">
    <img id="mt028" src="http://70.12.115.167:8000/miniproject/resources/images/mt028.png" height="125px">
    <img id="mt029" src="http://70.12.115.167:8000/miniproject/resources/images/mt029.png" height="125px">
    <img id="mt030" src="http://70.12.115.167:8000/miniproject/resources/images/mt030.png" height="125px">
    <img id="mt031" src="http://70.12.115.167:8000/miniproject/resources/images/mt031.png" height="125px">
    <img id="mt032" src="http://70.12.115.167:8000/miniproject/resources/images/mt032.png" height="125px">
    <img id="mt033" src="http://70.12.115.167:8000/miniproject/resources/images/mt033.png" height="125px">
    <img id="mt034" src="http://70.12.115.167:8000/miniproject/resources/images/mt034.png" height="125px">
    <img id="mt035" src="http://70.12.115.167:8000/miniproject/resources/images/mt035.png" height="125px">
    <img id="mt036" src="http://70.12.115.167:8000/miniproject/resources/images/mt036.png" height="125px">
    <img id="mt037" src="http://70.12.115.167:8000/miniproject/resources/images/mt037.png" height="125px">
  </section>
  
   <!-- 하의 아이템 --> 
  <section id="picturesbox2" style="display:none">
  
  <!-- 여성 하의 -->
   	<br> 
    <label>◎ WOMEN ◎</label>
  	<br>
    <img id="wp001" src="http://70.12.115.167:8000/miniproject/resources/images/wp001.png" height="125px">
    <img id="wp002" src="http://70.12.115.167:8000/miniproject/resources/images/wp002.png" height="125px">
    <img id="wp003" src="http://70.12.115.167:8000/miniproject/resources/images/wp003.png" height="125px">
    <img id="wp004" src="http://70.12.115.167:8000/miniproject/resources/images/wp004.png" height="125px">
    <img id="wp005" src="http://70.12.115.167:8000/miniproject/resources/images/wp005.png" height="125px">
    <img id="wp006" src="http://70.12.115.167:8000/miniproject/resources/images/wp006.png" height="125px">
    <img id="wp007" src="http://70.12.115.167:8000/miniproject/resources/images/wp007.png" height="125px">
    <img id="wp008" src="http://70.12.115.167:8000/miniproject/resources/images/wp008.png" height="125px">
    <img id="wp009" src="http://70.12.115.167:8000/miniproject/resources/images/wp009.png" height="125px">
    <img id="wp010" src="http://70.12.115.167:8000/miniproject/resources/images/wp010.png" height="125px">
    <img id="wp011" src="http://70.12.115.167:8000/miniproject/resources/images/wp011.png" height="125px">
    <img id="wp012" src="http://70.12.115.167:8000/miniproject/resources/images/wp012.png" height="125px">
    <img id="wp013" src="http://70.12.115.167:8000/miniproject/resources/images/wp013.png" height="125px">
    <img id="wp014" src="http://70.12.115.167:8000/miniproject/resources/images/wp014.png" height="125px">
    <img id="wp015" src="http://70.12.115.167:8000/miniproject/resources/images/wp015.png" height="125px">
    <img id="wp016" src="http://70.12.115.167:8000/miniproject/resources/images/wp016.png" height="125px">
    <img id="wp017" src="http://70.12.115.167:8000/miniproject/resources/images/wp017.png" height="125px">
    <img id="wp018" src="http://70.12.115.167:8000/miniproject/resources/images/wp018.png" height="125px">
    <img id="wp019" src="http://70.12.115.167:8000/miniproject/resources/images/wp019.png" height="125px">
    <img id="wp020" src="http://70.12.115.167:8000/miniproject/resources/images/wp020.png" height="125px">
    <img id="wp021" src="http://70.12.115.167:8000/miniproject/resources/images/wp021.png" height="125px">
    
  <!-- 남성 하의 -->
  	<br>
    <label>◎ MEN ◎</label>
  	<br>
    <img id="mp001" src="http://70.12.115.167:8000/miniproject/resources/images/mp001.png" height="125px">
    <img id="mp002" src="http://70.12.115.167:8000/miniproject/resources/images/mp002.png" height="125px">
    <img id="mp003" src="http://70.12.115.167:8000/miniproject/resources/images/mp003.png" height="125px">
    <img id="mp004" src="http://70.12.115.167:8000/miniproject/resources/images/mp004.png" height="125px">
    <img id="mp005" src="http://70.12.115.167:8000/miniproject/resources/images/mp005.png" height="125px">
    <img id="mp006" src="http://70.12.115.167:8000/miniproject/resources/images/mp006.png" height="125px">
    <img id="mp007" src="http://70.12.115.167:8000/miniproject/resources/images/mp007.png" height="125px">
    <img id="mp008" src="http://70.12.115.167:8000/miniproject/resources/images/mp008.png" height="125px">
    <img id="mp009" src="http://70.12.115.167:8000/miniproject/resources/images/mp009.png" height="125px">
 </section> 
 
   <!-- 신발 아이템-->
  <section id="picturesbox3" style="display:none">
    <!-- 여성 신발 -->
  	<br>
    <label>◎ WOMEN ◎</label>
  	<br>
    <img id="ws001" src="http://70.12.115.167:8000/miniproject/resources/images/ws001.png" height="125px">
    <img id="ws002" src="http://70.12.115.167:8000/miniproject/resources/images/ws002.png" height="125px">
    <img id="ws003" src="http://70.12.115.167:8000/miniproject/resources/images/ws003.png" height="125px">
    <img id="ws004" src="http://70.12.115.167:8000/miniproject/resources/images/ws004.png" height="125px">
    <img id="ws005" src="http://70.12.115.167:8000/miniproject/resources/images/ws005.png" height="125px">
    <img id="ws006" src="http://70.12.115.167:8000/miniproject/resources/images/ws006.png" height="125px">
    
    <!-- 남성 신발 -->
    <br>
    <label>◎ MEN ◎</label>
  	<br>
  	<img id="ms001" src="http://70.12.115.167:8000/miniproject/resources/images/ms001.png" width="94.69px" height="125px">
    <img id="ms002" src="http://70.12.115.167:8000/miniproject/resources/images/ms002.png" width="94.69px" height="125px">
    <img id="ms003" src="http://70.12.115.167:8000/miniproject/resources/images/ms003.png" width="94.69px" height="125px">
    <img id="ms004" src="http://70.12.115.167:8000/miniproject/resources/images/ms004.png" width="94.69px" height="125px">
    <img id="ms005" src="http://70.12.115.167:8000/miniproject/resources/images/ms005.png" width="94.69px" height="125px">
    <img id="ms006" src="http://70.12.115.167:8000/miniproject/resources/images/ms006.png" width="94.69px" height="125px">
 </section> 
 
   <!-- 기타 아이템 -->
   <section id="picturesbox4" style="display:none">
   <!-- 여성 기타 -->
    <br>
    <label>◎ WOMEN ◎</label>
  	<br>
    <img id="we002" src="http://70.12.115.167:8000/miniproject/resources/images/we002.png" height="125px">   
    <img id="we003" src="http://70.12.115.167:8000/miniproject/resources/images/we003.png" height="125px">
    <img id="we004" src="http://70.12.115.167:8000/miniproject/resources/images/we004.png" height="125px">
    <img id="we005" src="http://70.12.115.167:8000/miniproject/resources/images/we005.png" height="125px">
    <img id="we006" src="http://70.12.115.167:8000/miniproject/resources/images/we006.png" height="125px">
    <img id="we007" src="http://70.12.115.167:8000/miniproject/resources/images/we007.png" height="125px">
    <img id="we008" src="http://70.12.115.167:8000/miniproject/resources/images/we008.png" height="125px">
    
    <!-- 남성 기타 -->
    <br>
    <label>◎ MEN ◎</label>
  	<br>
    <img id="me001" src="http://70.12.115.167:8000/miniproject/resources/images/me001.png" height="125px">
    <img id="me004" src="http://70.12.115.167:8000/miniproject/resources/images/me004.png" height="125px">
    <img id="me006" src="http://70.12.115.167:8000/miniproject/resources/images/me006.png" height="125px">
    <img id="me007" src="http://70.12.115.167:8000/miniproject/resources/images/me007.png" height="125px">
    <img id="me008" src="http://70.12.115.167:8000/miniproject/resources/images/me008.png" height="125px">
    <img id="me009" src="http://70.12.115.167:8000/miniproject/resources/images/me009.png" height="125px">
    <img id="me011" src="http://70.12.115.167:8000/miniproject/resources/images/me011.png" height="125px">
    <img id="me012" src="http://70.12.115.167:8000/miniproject/resources/images/me012.png" height="125px">
    <img id="me013" src="http://70.12.115.167:8000/miniproject/resources/images/me013.png" height="125px">
    <img id="me014" src="http://70.12.115.167:8000/miniproject/resources/images/me014.png" height="125px">
    <img id="me015" src="http://70.12.115.167:8000/miniproject/resources/images/me015.png" height="125px">    	
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
  	<br>
  	<label>◎ WOMEN ◎</label>
  	<br>
	<img id="wt<%= wshirt %>" src="http://70.12.115.167:8000/miniproject/resources/images/wt<%= wshirt %>.png" height="125px">
	<img id="wp<%= wpants %>" src="http://70.12.115.167:8000/miniproject/resources/images/wp<%= wpants %>.png" height="125px">
	<img id="ws00<%= wshoes %>"src="http://70.12.115.167:8000/miniproject/resources/images/ws00<%= wshoes %>.png" height="125px">
	
	<% 
  	int mshirtnum = (int)(Math.random()*37+1); // 상의 37개
  	String mshirt = String.format("%03d",mshirtnum);
  	int mpantsnum = (int)(Math.random()*8+1); // 하의 8개
  	String mpants = String.format("%03d",mpantsnum);
  	int mshoes = (int)(Math.random()*6+1); // 신발 6개
  	%>
	
   	<!-- 남성 랜덤 -->
   	<br>
  	<label>◎ MEN ◎</label>
  	<br>
	<img id="mt<%= mshirt %>" src="http://70.12.115.167:8000/miniproject/resources/images/mt<%= mshirt %>.png" height="125px">
	<img id="mp<%= mpants %>" src="http://70.12.115.167:8000/miniproject/resources/images/mp<%= mpants %>.png" height="125px">
	<img id="ms00<%= mshoes %>"src="http://70.12.115.167:8000/miniproject/resources/images/ms00<%= mshoes %>.png" width="94.69px" height="125px">  
 </section> 
 
 <!-- 착용샷 변환용 -->
 <section id="picturesbox6" style="display:none">
 <!-- 여성 상의 --> 
    <img id="fwt001" src="http://70.12.115.167:8000/miniproject/resources/images/fwt001.png" height="400px">
    <img id="fwt002" src="http://70.12.115.167:8000/miniproject/resources/images/fwt002.png" height="400px">
    <img id="fwt003" src="http://70.12.115.167:8000/miniproject/resources/images/fwt003.png" height="400px">
    <img id="fwt004" src="http://70.12.115.167:8000/miniproject/resources/images/fwt004.png" height="400px">
    <img id="fwt005" src="http://70.12.115.167:8000/miniproject/resources/images/fwt005.png" height="400px">
    <img id="fwt006" src="http://70.12.115.167:8000/miniproject/resources/images/fwt006.png" height="400px">
    <img id="fwt007" src="http://70.12.115.167:8000/miniproject/resources/images/fwt007.png" height="400px">
    <img id="fwt008" src="http://70.12.115.167:8000/miniproject/resources/images/fwt008.png" height="400px">
    <img id="fwt009" src="http://70.12.115.167:8000/miniproject/resources/images/fwt009.png" height="400px">
    <img id="fwt010" src="http://70.12.115.167:8000/miniproject/resources/images/fwt010.png" height="400px">
    <img id="fwt011" src="http://70.12.115.167:8000/miniproject/resources/images/fwt011.png" height="400px">
    <img id="fwt012" src="http://70.12.115.167:8000/miniproject/resources/images/fwt012.png" height="400px">
    <img id="fwt013" src="http://70.12.115.167:8000/miniproject/resources/images/fwt013.png" height="400px">
    <img id="fwt014" src="http://70.12.115.167:8000/miniproject/resources/images/fwt014.png" height="400px">
    <img id="fwt015" src="http://70.12.115.167:8000/miniproject/resources/images/fwt015.png" height="400px">
    <img id="fwt016" src="http://70.12.115.167:8000/miniproject/resources/images/fwt016.png" height="400px">
    <img id="fwt017" src="http://70.12.115.167:8000/miniproject/resources/images/fwt017.png" height="400px">
    <img id="fwt018" src="http://70.12.115.167:8000/miniproject/resources/images/fwt018.png" height="400px">
    <img id="fwt019" src="http://70.12.115.167:8000/miniproject/resources/images/fwt019.png" height="400px">
    <img id="fwt020" src="http://70.12.115.167:8000/miniproject/resources/images/fwt020.png" height="400px">
    <img id="fwt021" src="http://70.12.115.167:8000/miniproject/resources/images/fwt021.png" height="400px">
    <img id="fwt022" src="http://70.12.115.167:8000/miniproject/resources/images/fwt022.png" height="400px">
    <img id="fwt023" src="http://70.12.115.167:8000/miniproject/resources/images/fwt023.png" height="400px">
    <img id="fwt024" src="http://70.12.115.167:8000/miniproject/resources/images/fwt024.png" height="400px">
    <img id="fwt025" src="http://70.12.115.167:8000/miniproject/resources/images/fwt025.png" height="400px">
    <img id="fwt026" src="http://70.12.115.167:8000/miniproject/resources/images/fwt026.png" height="400px">
    <img id="fwt027" src="http://70.12.115.167:8000/miniproject/resources/images/fwt027.png" height="400px">
    <img id="fwt028" src="http://70.12.115.167:8000/miniproject/resources/images/fwt028.png" height="400px">
    <img id="fwt029" src="http://70.12.115.167:8000/miniproject/resources/images/fwt029.png" height="400px">
    <img id="fwt030" src="http://70.12.115.167:8000/miniproject/resources/images/fwt030.png" height="400px">
    <img id="fwt031" src="http://70.12.115.167:8000/miniproject/resources/images/fwt031.png" height="400px">
    
 <!-- 남성 상의 -->
    <img id="fmt001" src="http://70.12.115.167:8000/miniproject/resources/images/fmt001.png" height="125px">
    <img id="fmt002" src="http://70.12.115.167:8000/miniproject/resources/images/fmt002.png" height="125px">
    <img id="fmt003" src="http://70.12.115.167:8000/miniproject/resources/images/fmt003.png" height="125px">
    <img id="fmt004" src="http://70.12.115.167:8000/miniproject/resources/images/fmt004.png" height="125px">
    <img id="fmt005" src="http://70.12.115.167:8000/miniproject/resources/images/fmt005.png" height="125px">
    <img id="fmt006" src="http://70.12.115.167:8000/miniproject/resources/images/fmt006.png" height="125px">
    <img id="fmt007" src="http://70.12.115.167:8000/miniproject/resources/images/fmt007.png" height="125px">
    <img id="fmt008" src="http://70.12.115.167:8000/miniproject/resources/images/fmt008.png" height="125px">
    <img id="fmt009" src="http://70.12.115.167:8000/miniproject/resources/images/fmt009.png" height="125px">
    <img id="fmt010" src="http://70.12.115.167:8000/miniproject/resources/images/fmt010.png" height="125px">
    <img id="fmt011" src="http://70.12.115.167:8000/miniproject/resources/images/fmt011.png" height="125px">
    <img id="fmt012" src="http://70.12.115.167:8000/miniproject/resources/images/fmt012.png" height="125px">
    <img id="fmt013" src="http://70.12.115.167:8000/miniproject/resources/images/fmt013.png" height="125px">
    <img id="fmt014" src="http://70.12.115.167:8000/miniproject/resources/images/fmt014.png" height="125px">
    <img id="fmt015" src="http://70.12.115.167:8000/miniproject/resources/images/fmt015.png" height="125px">
    <img id="fmt016" src="http://70.12.115.167:8000/miniproject/resources/images/fmt016.png" height="125px">
    <img id="fmt017" src="http://70.12.115.167:8000/miniproject/resources/images/fmt017.png" height="125px">
    <img id="fmt018" src="http://70.12.115.167:8000/miniproject/resources/images/fmt018.png" height="125px">
    <img id="fmt019" src="http://70.12.115.167:8000/miniproject/resources/images/fmt019.png" height="125px">
    <img id="fmt020" src="http://70.12.115.167:8000/miniproject/resources/images/fmt020.png" height="125px">         	
    <img id="fmt021" src="http://70.12.115.167:8000/miniproject/resources/images/fmt021.png" height="125px">
    <img id="fmt022" src="http://70.12.115.167:8000/miniproject/resources/images/fmt022.png" height="125px">
    <img id="fmt023" src="http://70.12.115.167:8000/miniproject/resources/images/fmt023.png" height="125px">
    <img id="fmt024" src="http://70.12.115.167:8000/miniproject/resources/images/fmt024.png" height="125px">
    <img id="fmt025" src="http://70.12.115.167:8000/miniproject/resources/images/fmt025.png" height="125px">
    <img id="fmt026" src="http://70.12.115.167:8000/miniproject/resources/images/fmt026.png" height="125px">
    <img id="fmt027" src="http://70.12.115.167:8000/miniproject/resources/images/fmt027.png" height="125px">
    <img id="fmt028" src="http://70.12.115.167:8000/miniproject/resources/images/fmt028.png" height="125px">
    <img id="fmt029" src="http://70.12.115.167:8000/miniproject/resources/images/fmt029.png" height="125px">
    <img id="fmt030" src="http://70.12.115.167:8000/miniproject/resources/images/fmt030.png" height="125px">
    <img id="fmt031" src="http://70.12.115.167:8000/miniproject/resources/images/fmt031.png" height="125px">
    <img id="fmt032" src="http://70.12.115.167:8000/miniproject/resources/images/fmt032.png" height="125px">
    <img id="fmt033" src="http://70.12.115.167:8000/miniproject/resources/images/fmt033.png" height="125px">
    <img id="fmt034" src="http://70.12.115.167:8000/miniproject/resources/images/fmt034.png" height="125px">
    <img id="fmt035" src="http://70.12.115.167:8000/miniproject/resources/images/fmt035.png" height="125px">
    <img id="fmt036" src="http://70.12.115.167:8000/miniproject/resources/images/fmt036.png" height="125px">
    <img id="fmt037" src="http://70.12.115.167:8000/miniproject/resources/images/fmt037.png" height="125px">
    
<!-- 여성 하의 -->
    <img id="fwp001" src="http://70.12.115.167:8000/miniproject/resources/images/fwp001.png" height="125px">
    <img id="fwp002" src="http://70.12.115.167:8000/miniproject/resources/images/fwp002.png" height="125px">
    <img id="fwp003" src="http://70.12.115.167:8000/miniproject/resources/images/fwp003.png" height="125px">
    <img id="fwp004" src="http://70.12.115.167:8000/miniproject/resources/images/fwp004.png" height="125px">
    <img id="fwp005" src="http://70.12.115.167:8000/miniproject/resources/images/fwp005.png" height="125px">
    <img id="fwp006" src="http://70.12.115.167:8000/miniproject/resources/images/fwp006.png" height="125px">
    <img id="fwp007" src="http://70.12.115.167:8000/miniproject/resources/images/fwp007.png" height="125px">
    <img id="fwp008" src="http://70.12.115.167:8000/miniproject/resources/images/fwp008.png" height="125px">
    <img id="fwp009" src="http://70.12.115.167:8000/miniproject/resources/images/fwp009.png" height="125px">
    <img id="fwp010" src="http://70.12.115.167:8000/miniproject/resources/images/fwp010.png" height="125px">
    <img id="fwp011" src="http://70.12.115.167:8000/miniproject/resources/images/fwp011.png" height="125px">
    <img id="fwp012" src="http://70.12.115.167:8000/miniproject/resources/images/fwp012.png" height="125px">
    <img id="fwp013" src="http://70.12.115.167:8000/miniproject/resources/images/fwp013.png" height="125px">
    <img id="fwp014" src="http://70.12.115.167:8000/miniproject/resources/images/fwp014.png" height="125px">
    <img id="fwp015" src="http://70.12.115.167:8000/miniproject/resources/images/fwp015.png" height="125px">
    <img id="fwp016" src="http://70.12.115.167:8000/miniproject/resources/images/fwp016.png" height="125px">
    <img id="fwp017" src="http://70.12.115.167:8000/miniproject/resources/images/fwp017.png" height="125px">
    <img id="fwp018" src="http://70.12.115.167:8000/miniproject/resources/images/fwp018.png" height="125px">
    <img id="fwp019" src="http://70.12.115.167:8000/miniproject/resources/images/fwp019.png" height="125px">
    <img id="fwp020" src="http://70.12.115.167:8000/miniproject/resources/images/fwp020.png" height="125px">
    <img id="fwp021" src="http://70.12.115.167:8000/miniproject/resources/images/fwp021.png" height="125px">
    
<!-- 남성 하의 -->    
    <img id="fmp001" src="http://70.12.115.167:8000/miniproject/resources/images/fmp001.png" height="125px">
    <img id="fmp002" src="http://70.12.115.167:8000/miniproject/resources/images/fmp002.png" height="125px">
    <img id="fmp003" src="http://70.12.115.167:8000/miniproject/resources/images/fmp003.png" height="125px">
    <img id="fmp004" src="http://70.12.115.167:8000/miniproject/resources/images/fmp004.png" height="125px">
    <img id="fmp005" src="http://70.12.115.167:8000/miniproject/resources/images/fmp005.png" height="125px">
    <img id="fmp006" src="http://70.12.115.167:8000/miniproject/resources/images/fmp006.png" height="125px">
    <img id="fmp007" src="http://70.12.115.167:8000/miniproject/resources/images/fmp007.png" height="125px">
    <img id="fmp008" src="http://70.12.115.167:8000/miniproject/resources/images/fmp008.png" height="125px">
    <img id="fmp009" src="http://70.12.115.167:8000/miniproject/resources/images/fmp009.png" height="125px">
    
<!-- 여성 신발 -->
    <img id="fws001" src="http://70.12.115.167:8000/miniproject/resources/images/fws001.png" height="125px">
    <img id="fws002" src="http://70.12.115.167:8000/miniproject/resources/images/fws002.png" height="125px">
    <img id="fws003" src="http://70.12.115.167:8000/miniproject/resources/images/fws003.png" height="125px">
    <img id="fws004" src="http://70.12.115.167:8000/miniproject/resources/images/fws004.png" height="125px">
    <img id="fws005" src="http://70.12.115.167:8000/miniproject/resources/images/fws005.png" height="125px">
    <img id="fws006" src="http://70.12.115.167:8000/miniproject/resources/images/fws006.png" height="125px">

<!-- 남성 신발 -->
    <img id="fms001" src="http://70.12.115.167:8000/miniproject/resources/images/fms001.png" height="125px">
    <img id="fms002" src="http://70.12.115.167:8000/miniproject/resources/images/fms002.png" height="125px">
    <img id="fms003" src="http://70.12.115.167:8000/miniproject/resources/images/fms003.png" height="125px">
    <img id="fms004" src="http://70.12.115.167:8000/miniproject/resources/images/fms004.png" height="125px">
    <img id="fms005" src="http://70.12.115.167:8000/miniproject/resources/images/fms005.png" height="125px">
    <img id="fms006" src="http://70.12.115.167:8000/miniproject/resources/images/fms006.png" height="125px">
        
<!-- 여성 기타 -->
    <img id="fwe002" src="http://70.12.115.167:8000/miniproject/resources/images/fwe002.png" height="200px">
    <img id="fwe003" src="http://70.12.115.167:8000/miniproject/resources/images/fwe003.png" height="200px">
    <img id="fwe004" src="http://70.12.115.167:8000/miniproject/resources/images/fwe004.png" height="200px">
    <img id="fwe005" src="http://70.12.115.167:8000/miniproject/resources/images/fwe005.png" height="200px">
    <img id="fwe006" src="http://70.12.115.167:8000/miniproject/resources/images/fwe006.png" height="200px">
    <img id="fwe007" src="http://70.12.115.167:8000/miniproject/resources/images/fwe007.png" height="200px">
    <img id="fwe008" src="http://70.12.115.167:8000/miniproject/resources/images/fwe008.png" height="200px">
    
<!-- 남성 기타 -->    
    <img id="fme001" src="http://70.12.115.167:8000/miniproject/resources/images/fme001.png" height="125px">
    <img id="fme004" src="http://70.12.115.167:8000/miniproject/resources/images/fme004.png" height="125px">
    <img id="fme006" src="http://70.12.115.167:8000/miniproject/resources/images/fme006.png" height="125px">
    <img id="fme007" src="http://70.12.115.167:8000/miniproject/resources/images/fme007.png" height="125px">
    <img id="fme008" src="http://70.12.115.167:8000/miniproject/resources/images/fme008.png" height="125px">
    <img id="fme009" src="http://70.12.115.167:8000/miniproject/resources/images/fme009.png" height="125px">
    <img id="fme011" src="http://70.12.115.167:8000/miniproject/resources/images/fme011.png" height="125px">
    <img id="fme012" src="http://70.12.115.167:8000/miniproject/resources/images/fme012.png" height="125px">
    <img id="fme013" src="http://70.12.115.167:8000/miniproject/resources/images/fme013.png" height="125px">  
    <img id="fme014" src="http://70.12.115.167:8000/miniproject/resources/images/fme014.png" height="125px">
    <img id="fme015" src="http://70.12.115.167:8000/miniproject/resources/images/fme015.png" height="125px">
 </section> 
 
 <section id=defaultCloset>
 </section>

	<% 
  	int rand = (int)(Math.random()*7+1); // 랜덤 백이미지 출력
  	%>

<section id = "weather">
<img id="backimg" src="http://70.12.115.167:8000/miniproject/resources/images/back<%= rand %>.png" style="display:blcok; border-radius:60px;" width="640px" height="510px">
<img id="spring" src="http://70.12.115.167:8000/miniproject/resources/images/spring.png" style="display:none; border-radius:60px;" width="640px" height="810px">
<img id="summer" src="http://70.12.115.167:8000/miniproject/resources/images/summer.png" style="display:none; border-radius:60px;" width="640px" height="810px">
<img id="fall" src="http://70.12.115.167:8000/miniproject/resources/images/fall.png" style="display:none; border-radius:60px;" width="640px" height="810px">
<img id="winter" src="http://70.12.115.167:8000/miniproject/resources/images/winter.png" style="display:none; border-radius:60px;" width="640px" height="810px">
</section>
</body>
</html>
