<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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

}
#delete-file{
display: none;
}
</style>
</head>
<body>
<h3><img src="img/logo/logoboard.png"></h3><br>
<div>
	<form action="board_insert.bo" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th style="width: 130px;">제목</th>
				<td style="text-align: left;"  colspan="5">
				<input style="width:500px; border:1px solid #cccccc; text-align: left; 
				padding:3px; background-color: #f4f8fb;" 
				class="need" title="재목" type="text" name="board_title" />
				</td>
			</tr>
			<tr>
				<th style="width: 130px;">작성자</th>
				<td style="text-align: left; margin-left: 20px;">${login_info.user_name }</td>
			</tr>
			<tr>
				<td class="content" style="text-align: left" colspan="7">
				<textarea name="board_content" title="내용"
				style="width:100%; height: 400px; text-align: left;
					background-color: #f4f8fb; border:1px solid #cccccc; resize: none;"></textarea>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td colspan="5"><img src="${vo.filepath }"
					style="width: 300px;">
					<input type="button" id="delete-file" value="파일 삭제" /> 
					<input type="file" name="attach_file" id="attach-file" />
				</td>
			</tr>
		</table><br>
		<a class="button" onclick="if( necessary() ) { $('form').submit() }">저장</a>
		<a class="button" onclick="location='list.bo'">취소</a>
</form>

<script type="text/javascript" src="js/need_check2.js"></script>
<script type="text/javascript" src="js/attach_file2.js"></script>
</div>
</body>
</html>