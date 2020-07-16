<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
   integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
   crossorigin=""/>
	<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
   integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
   crossorigin=""></script>
<title>Insert title here</title>
</head>
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
#demo{
	color: white;
}
#demo1{
	color: white;
	
}
#mapid{
 	margin-left: auto;
    margin-right: auto;
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
</style>
<body>
<h2>Exchange your item ! </h2>
<div id="write">
		<h2 id="divT"></h2>
		<form method="post" action="/miniproject/board/trade/insert">
			<select name="type" id="type">
				<option value="trade" id="trade">Clothing Swap</option>
				<option value="trade" id="trade">Coordination</option>
			</select>
			<span id="demo"><%= session.getAttribute("sm_id") %></span><br>
			<input type="text" name="title" style="width: 330px;" placeholder="title"><br><br>
			<textarea id="content" rows="10" cols="45" name="content" placeholder="write product information"></textarea>
			<br>
			<span id="demo">거래하고자 하는 위치를 찍어주세요 ! </span>
   			<button onclick="getLoc(); return false;"><i class="fas fa-map-marker-alt"></i></button>
   			<hr>
   			<span id="demo1">Location: </span><input id="location" name="location" style="width: 400px;">
            <div id="mapid" style="width: 600px; height: 400px;"></div>
			<input type="hidden" name="pgNum" value="${ requestScope.pgNum }">
			<input type="submit" value="submit" class="bt">
			<input type="reset" value="reset" class="bt">
			<button onclick="${ requestScope.referer }" class="bt" >cancel</button>
		</form>
</div>
<script>
var mymap;
function getLoc() {
	var address = prompt("Write your location");
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
				
				var myIcon = L.icon({
				    iconUrl: '/miniproject/resources/images/logo.png',
				    iconSize: [70, 70]
				});

				L.marker([lat, lng], {icon: myIcon}).addTo(mymap).bindTooltip("<b>우비 팝니다 !").openPopup();   
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