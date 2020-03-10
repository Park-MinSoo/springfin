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
	#dropbox {
		position : absolute;
		left : 940px;
		width : 300px;
		height : 700px;
	}
	#picturesbox {
		position : absolute;
		left : 20px;
		width : 900px;
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
	
</script>
<body>
<h1>나만의 옷장</h1>
<div>
    <button onclick="">오늘의 코디</button>
    <button onclick="save();">코디 저장하기</button>
    <button onclick="loading();">코디 읽어오기</button>
    <button onclick="del();">코디 지우기</button>
    <br><br>
    <button onclick="">상의</button>
    <button onclick="">하의</button>
    <button onclick="">신발</button>
    <button onclick="">기타</button><br>
</div>

  <section id="dropbox">
    <canvas id="canvas" width="550" height="700"></canvas>
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
