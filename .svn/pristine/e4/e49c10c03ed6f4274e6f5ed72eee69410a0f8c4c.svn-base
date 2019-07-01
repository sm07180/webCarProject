<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/need_check2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
table{
	margin: 0 auto;
	text-align: center;
	border: 1px solid #52616a;
	border-collapse: collapse;
	width: 70%;
	border-left:none;
	border-right:none;
	border-top:2px solid #52616a;
	border-bottom:2px solid #52616a;
}

table th, table td{
	border: 1px solid #52616a;
	padding: 10px 20px;
	border-left:none;
	border-right:none;
	}


table th {
	background: rgba(201,214,222,0.3);
}


.button{
	color:black;
	border: 0.3px solid black;
	background: #c9d6de;
	padding: 10px 20px;
}

.button:hover {
	color:white;
	background: #1e2022;
	padding: 10px 20px;
}

.content{
	padding : 10px;
}
</style>
</head>
<body>
<div>
	<h3><img src="img/logo/logoboard.png"></h3><br>
	<form action="board_update.bo" method="post" enctype="multipart/form-data">
	<input type="hidden" name="board_id" value="${vo.board_id }" />
		<table>
			<tr>
				<th style="width: 130px;">제목</th>
				<td style="text-align: left;"  colspan="5">
				<input style="width:500px; border:none; text-align: left; 
				padding:3px; background-color: #f4f8fb;" value="${vo.board_title }" class="need" title="재목" type="text" name="board_title" />
				</td>
			</tr>
			<tr>
				<th style="width: 130px;">작성자</th>
				<td>${vo.user_name }</td>
			</tr>
			<tr>
				<td class="content" style="text-align: left" colspan="7">
				<textarea name="board_content" class="need" title="내용"
				style="width:100%; height: 400px; text-align: left;
					background-color: #f4f8fb; border:none; resize: none;"> ${vo.board_content }</textarea>
				
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td colspan="5">
				
<%-- <img src="img/delete.png" class="file-img" id="delete-file" />
<label id="file-name">${vo.filename }</label>
<label>
<img class="file-img" src="img/select.png">
	<input type="file" name="file" id="attach-file" />
</label>				
				 --%>
				
<img src="${vo.filepath }" id="file-img" style="width: 300px;">
<input type="button" id="delete-file" value="파일 삭제" />
<label id="file-name">${vo.filename }</label>
<input type="file" name="file" id="attach-file" />
</td>
			</tr>
		</table><br>
		<a class="button" 
	onclick="if( necessary() ) { $('form').submit() }">저장</a>
	
<a class="button" onclick="back_go()">취소</a>
<input type="hidden" name="attach"/>
</form>

<script type="text/javascript" src="js/attach_file2.js"></script>
<script type="text/javascript">
$(function(){
	//첨부파일명이 있으면 파일삭제 이미지 보이게
	if( '${!empty vo.filename}' == 'true' ){
		$('#delete-file').css('display', 'inline-block');
		$('#file-name').css('padding-right', '15px');
	}
	$('#delete-file').on('click', function(){
		alert("파일삭제");
		//원래첨부된 파일을 삭제하는 경우
		$('[name=attach]').val('n'); 
	});
});

function back_go() {
	history.go(-2);
}
</script>
</body>
</html>