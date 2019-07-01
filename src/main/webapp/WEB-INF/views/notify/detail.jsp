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
	padding : 50px;
}
</style>
</head>
<body>

<h3><img src="img/logo/logonotice.png"></h3><br><br>
<table>
		<tr>
			<th style="width: 140px;">제목</th>
			<td style="text-align: left" colspan="5">${vo.notify_title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td style="text-align: left">관리자</td>
			<th style="width: 100px;">작성일자</th>
			<td style="width: 100px;">${vo.notify_date}</td>
			<th style="width: 100px;">조회수</th>
			<td style="width: 100px;">${vo.readcnt}</td>
		</tr>
		<tr>
			<!-- <th class="content">내용</th> -->
			<td class="content" style="text-align: left" colspan="10">${fn:replace(vo.notify_content,enter,'<br/>')}</td>
		</tr>
	
</table><br>
<form action="list.no" method="post">
	<input type="hidden" name="curPage" value="${page.curPage}"/>
</form>
<a class=button onclick="$('form').submit()">목록으로</a>
</body>
</html>