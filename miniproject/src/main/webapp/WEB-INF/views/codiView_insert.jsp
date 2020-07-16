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
<h2> Styling Q&A</h2>
<div id="write">
		<h2 id="divT"></h2>
		<form method="post" action="/miniproject/board/codi/insert">
			<select name="type" id="type">
				<option value="codi" id="codi">Coordination</option>
				<option value="trade" id="trade">Clothing Swap</option>
			</select>
			<span><%= session.getAttribute("sm_id") %></span><br>
			
			<input type="text" name="title" style="width: 330px;" placeholder="title"><br><br>
			<textarea id="content" rows="10" cols="45" name="content" placeholder="write product information"></textarea>
			<br>
			
			<input type="hidden" name="pgNum" value="${ requestScope.pgNum }">
			<input type="submit" value="submit" class="bt">
			<input type="reset" value="reset" class="bt">
			<button onclick="${ requestScope.referer }" class="bt" >cancel</button>
		</form>
</div>
</body>
</html>