<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<div class="container-fluid">
	<h2 style="text-align: center; margin-top:10px; margin-bottom:10px;"><img style="width: 400px;" src="<c:url value='/img/adminnotice.png' />" /></h2>
<table class="table table-bordered" id="dataTable" width="95%" cellspacing="0">
		<tr>
			<th style="width: 140px;">제목</th>
			<td style="text-align: left" colspan="5">${vo.notify_title}</td>
		</tr>
		<tr>
			<th style="width: 140px;">작성자</th>
			<td style="text-align: left; ">관리자</td>
			<th style="width: 100px;">작성일자</th>
			<td style="width: 100px;">${vo.notify_date}</td>
		</tr>
		<tr>
			<!-- <th class="content">내용</th> -->
			<td class="content" style="text-align: left" colspan="4">${fn:replace(vo.notify_content,enter,'<br/>')}</td>
		</tr>
</table>
<p class="small text-center text-muted my-5">
<a class="button" onclick="location='notifyList'">목록으로</a>
<a class="button" onclick="location='notifyModify?notify_id=${vo.notify_id}'">수정</a>
<a class="button" onclick="if(confirm('정말 삭제하시겠습니까?')){location='notifyDelete?notify_id=${vo.notify_id}'}">삭제</a>
</p>
</div>
</body>
</html>