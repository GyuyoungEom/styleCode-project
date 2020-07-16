<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardVO,java.util.List,service.PagingService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link href="https://fonts.googleapis.com/css?family=Anton|Bungee+Inline|Electrolize|Gochi+Hand|Lalezar|Orbitron|Permanent+Marker|Righteous|Sacramento&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Bebas+Neue|Permanent+Marker&display=swap" rel="stylesheet">


<style>
	body{
		background-color : black;
		background-size : 100%;
	}

	h2,th{
	 	font-family: 'Orbitron';
		color: white;
	}
 	h2{
		font-size: 70px;
		font-weight: bold;
	}
	*{
		text-align : center;
	}
	th{
		font-size: 20px;
	}
	
	table{
		margin-left : auto;
		margin-right : auto;
		margin-bottom : 30px;
	}
	
	td {
		border-bottom: 2px dotted white;
		font-family: 'Lalezar';
		font-size: 25px;
		color: white;
		
	}

	tr:hover {

	font-weight: bold;
	}

	td:nth-child(1) {
	width: 50px;
	}

	td:nth-child(2) {
	width: 200px;
	}

	td:nth-child(3) {
	width: 150px;
	}

	td:nth-child(4) {
	width: 200px;
	}

	form {
	text-align: center;
	}

	#divT {
	color: white;
	text-align: center;
	}

	h2 {
	text-align: center;
	}
	
	
	
	#btn1 {
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
	    left: 220px;
	    bottom: 20px;

}
#btn2{
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
    width: 50px;
    height: 30px;
    text-align: center;

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
	left: 410px;
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
	background-color: magenta;
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
	color: black;
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
    background: black;
    box-shadow: 0 2px 10px rgba(0, 0, 0, .4);
}
.container header nav{
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.container header nav .logo .logo-name{
    font-size: 3em;
    color: white;
    text-transform: uppercase;
    font-family:'Permanent Marker' ;
    font-weight: bold;
    
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
    position: relative;
    left: 900px;
    top: 10px;
   
}
.container header nav .login ul li{
    padding: 16px 22px;
    border-radius: 50px;
    background: black;

    width: 10px;
    height: 10px;            
}

.container header nav .login ul li:active{
    box-shadow: inset 3px 3px 10px 1px rgba(0, 0, 0, .2),
                inset -3px -3px 10px 1px rgba(255, 255, 255, 1);
}



</style>
</head>
<body>
 	<div class="container">
		<header>
			<nav>
			     <a class="logo" href="/miniproject/menu" style="text-decoration: none;">
				 <span class="logo-name">STYLE COORDER</span></a>
			       <div class="login">
                    	<ul>
                        	<li onclick="loginToggle()"><i class="far fa-user" style="color: black; " width="10"></i></li>
							<li onclick="signupToggle()"><i class="fas fa-user-plus" style="color: black;" width="10"></i></li>
                    	</ul>
                	</div>
			</nav>
		</header>
	</div>
	
	
	
	<h2>Coordination</h2>
	<br>
	<%
		List<BoardVO> list = (List<BoardVO>) request.getAttribute("list");
		BoardVO listOne = (BoardVO) request.getAttribute("listOne");
		int pageStart = (int) request.getAttribute("pageStart");
		int pageEnd = (int) request.getAttribute("pageEnd");
		boolean preData = (boolean) request.getAttribute("preData");
		boolean nextData = (boolean) request.getAttribute("nextData");
		//System.out.println("제발" + preData);
		//System.out.println("제발" + nextData);

		if (list != null) {
			//System.out.println("list가 왔는가");

	%>
		<button onclick="location.href='/miniproject/board/codi/write?pgNum=${requestScope.pgNum}';" id="btn1" data-transition=“fade” ><i class="fas fa-pencil-alt"></i>Write</button>
	
	<div class="Codi">
		<table>
			<tr>
				<th><i class="fas fa-list-ol"></i>Nums</th>
				<th><i class="fas fa-align-center"></i>Title</th>
				<th><i class="fas fa-user"></i>Writer</th>
				<th><i class="far fa-calendar-alt"></i>Date</th>
				<th><i class="far fa-eye"></i>Views</th>
				<th><i class="far fa-heart"></i>Like</th>
			</tr>
			<%
				for (BoardVO vo : list) {
			%>
			<tr>
				<td><%=vo.getId()%></td>
				<td><a href="/miniproject/board/codi/read?id=<%=vo.getId()%>&pgNum=${requestScope.pgNum}"><%=vo.getTitle()%></a></td>
				<td><a href="/miniproject/board/codi/writer?writer=<%=vo.getWriter()%>&pgNum=${requestScope.pgNum}"><%=vo.getWriter()%></a></td>
				<td><%=vo.getWritedate()%></td>
				<td><%=vo.getCnt()%></td>
				<td><%=vo.getTup()%></td>
			</tr>

			<%
				}
		}
			%>
		</table>
	</div>

	<a href="/miniproject/board/codi?pgNum=${pageStart}">&laquo;</a>
	
	<c:if test = "<%= preData %>">
		<a href="/miniproject/board/codi?pgNum=${requestScope.pgNum-1}">이전</a>
	</c:if>
	
	<c:forEach var="i" begin="${pageStart}" end="${pageEnd}">
		<a style="${i == requestScope.pgNum? 'color:red;' : 'color : black;'}"
	       href = "/miniproject/board/codi?pgNum=${i}">${i} &nbsp;</a>
	</c:forEach>
	
	<c:if test="<%= nextData %>">
		<a href="/miniproject/board/codi?pgNum=${requestScope.pgNum+1}">다음</a>
	</c:if>

	<a href="/miniproject/board/codi?pgNum=${pageEnd}">&raquo;</a>

	<br/>
	<br/>
	
	
	<hr>
	<form method="get" action="/miniproject/board/codi/search" id="search">	
		<select name="searchType">
			<option value="title" >Title</option>
			<option value="writer">Writer</option>
		</select>
		<input type="search" class="search-input" name="keyword" placeholder="Search">
		<input type="hidden" name="pgNum" value="${	requestScope.pgNum }">
		<button onclick="document.getElementById('search').submit();" id="btn2"><i class="fas fa-search"></i></button>
	</form>
	<%
		if (listOne != null) {
			//System.out.println("리스트 원값 출력 확인 : "+listOne);
	%>
	
	<%
		}
		
		if (request.getAttribute("msg") != null) {
	%>
	<script>
		alert('${ msg }');
	</script>

	<%
		}
	%>

</body>
</html>