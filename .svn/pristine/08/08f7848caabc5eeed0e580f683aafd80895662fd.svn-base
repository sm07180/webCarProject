<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.hover:hover{
		cursor: pointer;
		text-decoration: underline;
	}
</style>
</head>
<body>

<br><br>
	<div id="content-wrapper">
	<h2 style="text-align: center; margin-top:10px; margin-bottom:10px;"><img style="width: 400px;" src="<c:url value='/img/adminadmin.png' />" /></h2>
		<div class="container-fluid">
			<h3>${result.USER_ID} 님의 활동내역</h3>
			<table class="table table-bordered" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>유저아이디</th>
						<th>게시글수</th>
						<th>답글수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${result.USER_ID}</td>
						<td class="hover" onclick="location='cntInfo?user_id=${result.USER_ID}'">${result.TOTALCNT}</td>
						<td>${result.REPLYCNT}</td>
					</tr>
				</tbody>
			</table>
			<h3>${result.USER_ID} 님의 회원정보</h3>
			<table class="table table-bordered" width="100%"
				cellspacing="0" style="text-align: center;">
				
					<tr>
						<th width="30%">유저아이디</th>
						<td>${result.USER_ID}</td>
					</tr>
					<tr>
						<th width="30%">회원가입 날짜</th>
						<td>${result.JOINDATE}</td>
					</tr>
					<tr>
						<th width="30%">전화번호</th>
						<td>${result.PHONE}</td>
					</tr>
					<tr>
						<th width="30%">차회사</th>
						<td>${result.COMP_ID}</td>
					</tr>
					<tr>
						<th width="30%">차종</th>
						<td>${result.CAR_NAME}</td>
					</tr>
					<tr>
						<th width="30%">차닉네임</th>
						<td>${result.CAR_NICKNAME}</td>
					</tr>
					<tr>
						<th width="30%">마일리지</th>
						<td>${result.CAR_MILEAGE}</td>
					</tr>
					<tr>
						<th width="30%">관리자</th>
						<td>${result.ADMIN}</td>
					</tr>
					
					
					<tr>
						<td colspan="2"><a class="hover" onclick="if(confirm('삭제하시겠습니까?')){location='userDelete?user_id=${result.USER_ID}'}">탈퇴</a></td>
					</tr>
			</table>
		</div>
	</div>
</body>
</html>