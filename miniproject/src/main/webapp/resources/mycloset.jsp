<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Style Manager</title>
  <link rel="stylesheet" href="dragdrop.css">
<style>
	h1{
		text-align : center;
  		text-shadow : 3px 3px 5px skyblue;
  	}
  	div{
  		text-align : center;
  		text-shadow : 3px 3px 5px skyblue;
  	}
  	.type{
  		padding : 10px;
  	}
  	.wt{
  		padding : 10px;
  	}
  	#wtr{
  		position : absolute;
		left : 860px;
  	}
	#dropbox {
		position : absolute;
		left : 730px;
		width : 500px;
		height : 800px;
	}
	#picturesbox {
		position : absolute;
		left : 5px;
		width : 700px;
		height : 800px;
	}
	#weather{
		padding : 5px;
		position : absolute;
		left : 730px;
		opacity : 0.75;
	}
	#closet{
		padding : 5px;
		opacity : 0.2;
	}
</style>
<script>
var canvas, drop;
function initiate(){

  var images=document.querySelectorAll('#picturesbox > img');
  for(var i=0; i<images.length; i++){
    images[i].addEventListener('dragstart', dragged, false);
    images[i].addEventListener('dragend', ending, false);
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
  e.dataTransfer.setData('aa', elem.getAttribute('id'));
  e.dataTransfer.setDragImage(e.target, 0, 0); 
}
function dropped(e){
  e.preventDefault();
  var id=e.dataTransfer.getData('aa');
  var elem=document.getElementById(id);

  var posx=e.pageX-drop.offsetLeft;
  var posy=e.pageY-drop.offsetTop;

  canvas.drawImage(elem,posx,posy);
 
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
/*
function randomcodi() {
	var rand = (int)(Math.random()*10);
	
}

function showlist() {
	
	
}
*/
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
	}
}

</script>
<body>
<h1>나만의 옷장</h1>
<div>

    <button onclick="save();">코디 저장하기</button>
    <button onclick="loading();">코디 읽어오기</button>
    <button onclick="del();">코디 지우기</button>
    <br><br>
</div>
    <button class="type" onclick="">상의</button>
    <button class="type" onclick="">하의</button>
    <button class="type" onclick="">신발</button>
    <button class="type" onclick="">기타</button>
    <button class="type" onclick="">오늘의 코디</button>
<span id= "wtr">
    <button class="wt" onclick="displayWeather(1);">봄</button>
    <button class="wt" onclick="displayWeather(2);">여름</button>
    <button class="wt" onclick="displayWeather(3);">가을</button>
    <button class="wt" onclick="displayWeather(4);">겨울</button><br>
</span>
  <section id="dropbox">
    <canvas id="canvas" width="500" height="800"></canvas>
  </section>
  <section id="picturesbox">
    <img id="image1" src="1.png" height="125px">
    <img id="image2" src="2.png" height="125px">
    <img id="image3" src="3.png" height="125px">
    <img id="image4" src="4.png" height="125px">
    <img id="image5" src="5.png" height="125px">
    <img id="image6" src="6.png" height="125px">
    <img id="image7" src="7.png" height="125px">
    <img id="image8" src="8.png" height="125px">
    <img id="image9" src="9.png" height="125px">
    <img id="image10" src="10.png" height="125px">
    <img id="image11" src="11.png" height="125px">
    <img id="image12" src="12.png" height="125px">
    <img id="image13" src="13.png" height="125px">
    <img id="image14" src="14.png" height="125px">
    <img id="image15" src="15.png" height="125px">
    <img id="image16" src="16.png" height="125px">
    <img id="image17" src="17.png" height="125px">
    <img id="image18" src="18.png" height="125px">
    <img id="image19" src="19.png" height="125px">
    <img id="image20" src="20.png" height="125px">
  </section>
<section id = "weather">
<img id="spring" src="spring.png" style="display:none" width="500px" height="800px">
<img id="summer" src="summer.png" style="display:none" width="500px" height="800px">
<img id="fall" src="fall.png" style="display:none" width="500px" height="800px">
<img id="winter" src="winter.png" style="display:none" width="500px" height="800px">
</section>
<section id = closet>
<img src="closet.png" width="700px" height="800px">
</section>

</body>
</html>
