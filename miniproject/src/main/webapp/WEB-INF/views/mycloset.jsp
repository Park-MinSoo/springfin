<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Style Manager</title>
  <link rel="stylesheet" href="dragdrop.css">
<style>
	h1{
  		text-shadow : 3px 3px 5px skyblue;
  	}
  
	#dropbox {
		width : 550px;
		height : 700px;
	}
	#picturesbox {
		width : 650px;
		height : 700px;
	}
	img{
	  height : 125px;
	 
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

  canvas.drawImage(elem,posx,posy,200,200);
 
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

function backgroundColor(me){
canvas.fillStyle = me.value;  
canvas.fillRect(0,0,drop.width,drop.height);
}

function edgeColor(me){
    canvas.strokeStyle = me.value;
    canvas.lineWidth = 10;
    canvas.strokeRect(0,0,drop.width,drop.height);  
	}

var text55='';

function printText1(me){
 	cr5=document.getElementById('txtcr');
 	tx5=document.getElementById('txtxtx');
 	canvas.fillStyle =cr5.value;
 	text55 = tx5.value;
	}

function printText2(e){
    var posx=e.pageX-drop.offsetLeft;
    var posy=e.pageY-drop.offsetTop;
    canvas.font="bold 40px 나눔손글씨 펜";
	canvas.fillText(text55,posx,posy);
	}
	
</script>
<body>
<h1>나만의 옷장</h1>
    <button onclick="save();">저장하기</button>
    <button onclick="loading();">읽어오기</button>
    <button onclick="del();">지우기</button><br><br>

   <label>배경 칼라 설정 : </label><input type="color" name= "gbgcolor" onchange="backgroundColor(this)">
   
   <label>테두리 칼라 설정 : </label><input type="color" name= "gegcolor" onchange="edgeColor(this)"><br><br>
   
  <label>메세지 칼라 설정 : </label><input id = "txtcr" type="color" name= "gmgcolor">
   
   <label>입력 메세지 : </label><input id = "txtxtx" type="text" name= "gmsg" onchange="printText1(this)"><br>
    
  <section id="dropbox">
    <canvas id="canvas" width="550" height="700" onclick="printText2(event)"></canvas>
  </section>
  <section id="picturesbox">
    <img id="image1" src="1.png">
    <img id="image2" src="2.png">
    <img id="image3" src="3.png">
    <img id="image4" src="4.png">
    <img id="image5" src="5.png">
    <img id="image6" src="6.png">
    <img id="image7" src="7.png">
    <img id="image8" src="8.png">
    <img id="image9" src="9.png">
    <img id="image10" src="10.png">
    <img id="image11" src="11.png">
    <img id="image12" src="12.png">
    <img id="image13" src="13.png">
    <img id="image14" src="14.png">
    <img id="image15" src="15.png">
    <img id="image16" src="16.png">
    <img id="image17" src="17.png">
    <img id="image18" src="18.png">
    <img id="image19" src="19.png">
    <img id="image20" src="20.png">
  </section>
</body>
</html>
