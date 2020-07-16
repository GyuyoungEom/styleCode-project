<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.BoardVO,java.util.List,vo.ReplyVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<title>Insert title here</title>
</head>
<style>
body {
	background-color: black;
	background-size: 100%;
}
*{
	text-align: center;
	color: white;
	
}
h3{
	color: white;
	font-size: 50px;
	font-weight: bold;
}
button,input{
	color: black;
}


i {
    opacity: 0;
    font-size: 10px;
    color: #1F1E1E;
    will-change: transform;
    -webkit-transform: scale(.1);
            transform: scale(.1);
    -webkit-transition: all .3s ease;
    transition: all .3s ease;
}

.btn_wrap {
    position: relative;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: center;
        -ms-flex-pack: center;
            justify-content: center;
    -webkit-box-align: center;
        -ms-flex-align: center;
            align-items: center;
    overflow: hidden;
    cursor: pointer;
    width: 85px;
    height: 35px;
    background-color: black;
    border-radius: 40px;
    padding: 0 18px;
    will-change: transform;
    -webkit-transition: all .2s ease-in-out;
    transition: all .2s ease-in-out;
    margin-left: auto;
    margin-right: auto;
}

.btn_wrap:hover {
    /* transition-delay: .4s; */
    -webkit-transform: scale(1.1);
            transform: scale(1.1)
}

#boxing {
    position: absolute;
    z-index: 99;
    width: 90px;
    height: 40px;
    border-radius: 40px;
    font-size: 10px;
    text-align: center;
    line-height: 40px;
    letter-spacing: 2px;
    color: #EEEEED;
    background-color: #1F1E1E;
    padding: 0 18px;
    -webkit-transition: all 1.2s ease;
    transition: all 1.2s ease;
    
}

.container {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: distribute;
        justify-content: space-around;
    -webkit-box-align: center;
        -ms-flex-align: center;
            align-items: center;
    width: 100px;
    height: 48px;
    border-radius: 40px;
    text-align: center;
}

.container i:nth-of-type(1) {
            -webkit-transition-delay: 1.1s;
                    transition-delay: 1.1s;
}

.container i:nth-of-type(2) {
            -webkit-transition-delay: .9s;
                    transition-delay: .9s;
}

.container i:nth-of-type(3) {
            -webkit-transition-delay: .7s;
                    transition-delay: .7s;
}

.container i:nth-of-type(4) {
            -webkit-transition-delay: .4s;
                    transition-delay: .4s;
}

.btn_wrap:hover span {
    -webkit-transition-delay: .25s;
            transition-delay: .25s;
    -webkit-transform: translateX(-280px);
            transform: translateX(-280px)
}

.btn_wrap:hover i {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1);
}

#addButton{

    border: 1px solid black;
    border-top-left-radius: 40px;
    border-bottom-left-radius: 40px;
    border-top-right-radius: 40px;
    border-bottom-right-radius: 40px;
    background-color: #1F1E1E;
	padding: 5px;
    margin-left: auto;
    margin-right: auto;
    width: 120px;
    height: 40px;
   
}

#re_update{
	border: 2px solid white;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
    background-color: #1F1E1E;
	padding: 5px;
    margin-left: auto;
    margin-right: auto;
    width: 55px;
    height: 30px;
    color: white; 
}
#re_delete{
	border: 2px solid white;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
    background-color: #1F1E1E;
	padding: 5px;
    margin-left: auto;
    margin-right: auto;
    width: 55px;
    height: 30px;
    color: white; 

}
 #btn-like{
   	border: 2px solid white;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
    background-color: #1F1E1E;
	padding: 5px;
    margin-left: auto;
    margin-right: auto;
    width: 55px;
    height: 30px;
    color: white; 
 
 
 }
 
</style>
<body>
	<%
		List<ReplyVO> re_list = (List<ReplyVO>) request.getAttribute("re_list");
		BoardVO listOne = (BoardVO) request.getAttribute("listOne");
	%>
	<div id="read">
		<h3>Posts</h3>
		<form method="post" action="/miniproject/board/codi/update" id="update" name="update">
			<input type="hidden" name="id" value="${ listOne.id }">
			<input type="hidden" name="pgNum" value="${ requestScope.pgNum }">
			<i class="fas fa-user"></i>Writer : <span id="writer" name="writer"><%=listOne.getWriter()%></span>
			<br>
			<br>
			<c:if test='<%= session.getAttribute("sm_id").equals(listOne.getWriter()) %>'>
				
				<i class="fas fa-align-center"></i>Title : <input id="title" name="title"><%=listOne.getTitle()%>
				 <br><i class="fas fa-user-edit"></i>Text :
				<input id="content" name="content"><%=listOne.getContent()%>
				
			</c:if>
			<c:if test='<%= !session.getAttribute("sm_id").equals(listOne.getWriter()) %>'>
				<i class="fas fa-align-center"></i>Title : 
				<input id="title" name="title"<%=listOne.getTitle()%> readonly>
				 <br>
				<i class="fas fa-user-edit"></i>Text :
				<input id="content" name="content"<%=listOne.getContent()%> readonly>
 			</c:if>
 			<br>
			<i class="fas fa-heart"></i>Like :<input id="tup" name="tup" value="${ listOne.tup }" readonly>
			<button onclick="like(); return false;" id="btn-like" > ♡</button>
			<br>
			
			
			<div class="btn_wrap" >
				<span id="boxing" >Update Posts</span>
				<div class="container">
					<button onclick="${ requestScope.referer }" id="btn-referer"><i class="fas fa-check" style="color: black; "></i></button>
					<c:if test='<%= session.getAttribute("sm_id").equals(listOne.getWriter()) %>'>
					
					<button id="update" onclick="updateSubmit(); return false;"><i class="fas fa-edit" style="color: black; "></i></button>
					<button
					onclick="location.href='/miniproject/board/codi/delete?id=<%=listOne.getId()%>&pgNum=${ requestScope.pgNum }'; return false;"
					id="btn-delete"><i class="far fa-trash-alt" style="color: black; "></i></button>
				</c:if>
				</div>
			</div>
			
		</form>
	</div>
	
	<div id="replyform">
		<form method="post" name="replyform" id="replyform">
		
			<input type="hidden" name="re_select" id="re_select" value="${ listOne.id }">
			<div class="form-group">
				<label for="re_writer"><span>Writer</span></label>
				<input type="text" id="re_writer" name="re_writer" readonly value = "<%= session.getAttribute("sm_id") %>" class="form-control" style="color: black;">
			</div>
			
			<div class="form-group">
				<label for="re_text"><span>Comment</span></label>
				<input type="text" id="re_text" name="re_text" class="form-control" style="color: black;" >
			
			 <div class="form-group">
				<button id="addButton" onclick="add(); return false;"><i class="far fa-comments"></i>write comments</button>
			</div>
			<ul id="replyList">
			
				<%	if(re_list!=null){
						for(ReplyVO rvo:re_list){
				%>
					<li>
						<input type="hidden" name="re_id" value="<%=rvo.getRe_id() %>" id="re_id">
						
						<% System.out.println(rvo.getRe_id()); %>
						<%= rvo.getRe_writer() %>
						<br>
						<c:if test='<%= session.getAttribute("sm_id").equals(rvo.getRe_writer()) %>'>
							
							<input type="text" name="newtext" class="newtext" value="<%=rvo.getRe_text()%>">
							<div class="form-group">
								<button id="re_update" onclick="up(this); return false;">submit</button>
								<button id="re_delete" onclick="down(<%=rvo.getRe_id() %>); return false;">reset</button>
							</div>
						</c:if>
						<c:if test='<%= !session.getAttribute("sm_id").equals(rvo.getRe_writer()) %>'>
							<input value="<%= rvo.getRe_text() %>" readonly>
						</c:if>
					</li>
				<%}}%>			
			</ul>
		</form>
		</div>
		
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
function up(p){
	//alert(p);
	var dom = p.parentElement;
	//alert(dom);
	var input = dom.getElementsByTagName("input");
	//alert(input[1].value);
	$.ajax({
		type :"post",// 전송 방식 
		url :"/miniproject/reply/update",  //컨트롤러 사용할 때. 내가 보낼 데이터의 주소. 
		data : {"re_id" : input[0].value,
				"re_text" : input[1].value},
				
		dataType : "json",	
		success : function(data){	
			if(data=="1"){
				alert("댓글이 수정됨");
			}else{
				alert("수정 실패");
			}
		},
		error : function(){
			alert("ajax 실행 실패");
		}
	});
}
function down(id){
	console.log(id);
	$.ajax({
		type :"get",// 전송 방식 
		url :"/miniproject/reply/delete",  //컨트롤러 사용할 때. 내가 보낼 데이터의 주소. 
		data : {"re_id" : id},
				
		dataType : "json",	
		success : function(data){	
			if(data=="1"){
				alert("댓글이 삭제됨");
			}else{
				alert("삭제 실패");
			}
		},
		error : function(){
			alert("ajax 실행 실패");
		}
	});
}
function like(){
	$.ajax({
		type :"post",
		url :"/miniproject/tup",  
		data : {"tup" : update.tup.value,
				"id" : update.id.value },
		dataType : "json",	// text, xml, html, script, json, jsonp 가능 

		success : function(data){	
			if(data=="1"){
				alert("추천했습니다.");
			}else{
				alert(data);
			}
		},
		error : function(){
			alert("ajax 실행 실패");
		}
	});
}

function add(){
	$.ajax({
		type :"post",// 전송 방식 
		url :"/miniproject/reply/insert",  //컨트롤러 사용할 때. 내가 보낼 데이터의 주소. 
		data : {"re_writer" : replyform.re_writer.value,
				"re_text" : replyform.re_text.value,
				"re_select" : replyform.re_select.value},
	
		dataType : "json",	// text, xml, html, script, json, jsonp 가능 
		success : function(data){	
			if(data=="1"){
				alert("댓글이 추가됨");
			}else{
				alert("댓글 실패");
			}
		},
		error : function(){
			alert("ajax 실행 실패");
		}
	});

}

</script>
</body>
</html>