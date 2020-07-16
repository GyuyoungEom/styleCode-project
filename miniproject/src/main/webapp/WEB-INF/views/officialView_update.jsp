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
button{
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
#writeReply{

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

#btn-replyupdate{
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
#btn-default{
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
		List<BoardVO> list = (List<BoardVO>) request.getAttribute("list");
		BoardVO listOne = (BoardVO) request.getAttribute("listOne");
	%>
	<div id="read">
		<h3>Posts</h3>
		<form method="post" action="/miniproject/board/codi/update" id="update">
			<input type="hidden" name="id" value="${ listOne.id }">
			<input type="hidden" name="pgNum" value="${ requestScope.pgNum }">
			<i class="fas fa-user"></i>Writer :  <span id="writer" name="writer"><%=listOne.getWriter()%></span>
			<br>
			<i class="fas fa-align-center"></i>Title : <span contenteditable="true" id="title" name="title"><%=listOne.getTitle()%></span>
			<br>
			<i class="fas fa-user-edit"></i>Text <br> 
			<div contenteditable="true" id="content" name="content"><%=listOne.getContent()%></div>
			<br>
			<br>
			<br>
			<br>
			<div class="btn_wrap" >
				<span id="boxing" >Update Posts</span>
				<div class="container">
					<button onclick="${ requestScope.referer }" id="btn-referer"><i class="fas fa-check" style="color: black; "></i></button>
					<button id="btn-update"><i class="fas fa-edit" style="color: black; "></i></button>
					<button onclick="location.href='/miniproject/board/codi/delete?id=<%=listOne.getId()%>&pgNum=${ requestScope.pgNum }'; return false;"
				id="btn-delete"><i class="far fa-trash-alt" style="color: black; "></i></button>
				</div>
			</div>
			
			<button id="writeReply" onclick="display(0); return false;"><span id="comm">write comments</span></button>
		</form>
	</div>
	<%
			List<ReplyVO> replies = (List<ReplyVO>) request.getAttribute("re_list");
			if(replies!=null){
				for(ReplyVO vo : replies){

		%>
			<table id="reply_list">
				<tr>
					<td><%=vo.getRe_writer() %></td>
					<td><%=vo.getRe_writedate() %></td>
				</tr>
				<tr>
					<%=vo.getRe_text() %>
				</tr>
			</table>
		<%
		
				}
			}
		%>

		<div id="replyform" style="display : none;">
			<form action="/miniproject/replyinsert" id="form" method="post">
				
				<div class="form-group">
					<label for="re_writer">Writer</label> 
					<input id="re_writer" name="re_writer" class="form-control">
				</div>
				<div class="form-group">
					<label for="re_text">Comment</label> 
					<input id="re_text" name="re_text" class="form-control">
				</div>
				<div class="form-group">
					<input type="hidden" name="re_select" value="${ listOne.id }">
					<button id="btn-replyupdate" type="submit">submit</button>
					<button id="btn-default" type="reset">reset</button>
				</div>
			</form>
		</div>
		
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
function display(type){
	if(type==0)
		document.getElementById("replyform").style.display = 'block';
}

</script>
</body>
</html>