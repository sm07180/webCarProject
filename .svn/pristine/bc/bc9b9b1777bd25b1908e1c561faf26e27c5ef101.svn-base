<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value="/"/>js/need_check2.js"></script>
<title>Insert title here</title>
<style>
	


table th, table td{
	border: 1px solid #5e5e5f;
	padding: 10px 20px;
	border-left:none;
	border-right:none;
	}


table th {
	background: rgba(227, 222, 222, 0.5);
}

table{
	margin: 0 auto;
	text-align: center;
	border-collapse: collapse;
	width: 70%;
	border-left:none;
	border-right:none;
	border: 1px solid #5e5e5f;
	border-top:2px solid #5e5e5f;
	border-bottom:2px solid #5e5e5f;
}
.content {
	height:500px;
	padding : 50px;
}

.button{
	color:black;
	border: 0.3px solid black;
	background: #e3dede;
	padding: 10px 20px;
	cursor: pointer;
	font-size: 12px;
}

.button:hover {
	color:white;
	background: #1e2022;
	padding: 10px 20px;
	cursor: pointer;
}

</style>
</head>
<body>
	<div class="container-fluid" style="margin: 0 auto;">
	<h2 style="text-align: center; margin-top:10px; margin-bottom:10px;"><img style="width: 400px;" src="<c:url value='/img/adminnotice.png' />" /></h2>
<form action="notifinsert" method="post" id="frm">
<table style="width:95%;" 
		class="table table-bordered" id="dataTable" width="95%" cellspacing="0">
	<tr>
		<th style="width: 130px;">제목</th>
		<td style="text-align: left" colspan="5">
			<input title="제목" type="text" name="notify_title" style="border:none; text-align: left; background: none; width:100%"/>
			
		</td>
	</tr>
	<tr>
		<!-- <th class="content">내용</th> -->
		<td class="content" style="text-align: left; padding: 10px;" colspan="4">
			<textarea style="width: 100%; height: 500px; resize: none; border: 1px solid #eeeeee;
				padding: 5px;" id="notify_content" name="notify_content">
			</textarea>
	</tr>
	
</table>
<p class="small text-center text-muted my-5">
<a class="button" onclick="if( necessary() ) { $('form').submit() }">저장</a>
<a class="button" onclick="location='notifydetail?notify_id=${vo.notify_id}'">취소</a>
</p>
</form>
</div>
</body>
</html>
