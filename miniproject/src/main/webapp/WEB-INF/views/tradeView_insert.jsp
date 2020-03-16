<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
   integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
   crossorigin=""/>
	<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
   integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
   crossorigin=""></script>
<title>Insert title here</title>
</head>
<body>
<div id="write">
		<h2 id="divT"></h2>
		<form method="post" action="/miniproject/board/trade/insert">
			<select name="type" id="type">
				<option value="trade" id="trade">거래게시판</option>
				<option value="trade" id="trade">코디게시판</option>
				<option value="official" id="official">공지게시판</option>
			</select>
			<input type="text" name="writer" style="width: 330px;" placeholder="이름을 입력해주세요"><br>
			<input type="text" name="title" style="width: 330px;" placeholder="제목을 입력해주세요"><br>
			<textarea id="content" rows="10" cols="45" name="content" placeholder="내용을 입력해주세요"></textarea>
			<br>
			<span id="demo">위치정보를 추출하려면 실행 버튼을 클릭하세요:</span>
   			<button onclick="getLoc(); return false;">실행</button>
   			<hr>
   			주소 : <input id="location" name="location">
   			<div id="mapid" style="width: 600px; height: 400px;"></div>
			<input type="hidden" name="pgNum" value="${ requestScope.pgNum }">
			<input type="submit" value="저장">
			<input type="reset" value="재작성">
			<button onclick="${ requestScope.referer }">취소</button>
		</form>
</div>
<script>
var mymap;
function getLoc() {
	var address = prompt("주소를입력하세요");
	var lat;
	var lng;
	var loc = document.getElementById("location");
	
	if (address) {		
		var xhr = new XMLHttpRequest();
		xhr.onload =  function() { 
			if(xhr.status == 200) {
				var data = JSON.parse(xhr.responseText);
				lat = data.results[0].geometry.location.lat;
				lng = data.results[0].geometry.location.lng;
				//alert("좌표로 : " + lat + ":" + lng);
				if(mymap)
					mymap.remove();
				mymap = L.map('mapid').setView([lat, lng], 16)
				L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
					maxZoom: 18,
					attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
						'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
						'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
					id: 'mapbox.streets'
				}).addTo(mymap); 

				L.marker([lat, lng]).addTo(mymap).bindPopup("<b>여기에 있어요!").openPopup();   
				loc.value = data.results[0].formatted_address;
			}
		};
		
		xhr.open("GET", "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c&address="+encodeURIComponent(address), true);
		xhr.send();
	}		
}
</script>
</body>
</html>