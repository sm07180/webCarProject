<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table {
	margin: 0 auto;
	width: 70%;
}

table.type09 {
	width: 70%;
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
}

table.type09 thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 2px solid #036;
}

table.type09 tbody th {
	width: 1300px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

table.type09 td {
	width: 250px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

a {
	cursor: pointer;
	font-size: 13px;
	display: inline-block;
}

.search {
	width: 20px;
	height: 20px;
}

#button {
	float: right;
}

.write_btn {
	margin-left: 800px;
	color: black;
	border: 0.3px solid black;
	background: #c9d6de;
	padding: 10px 20px;
}

.write_btn:hover {
	color: white;
	background: #1e2022;
	padding: 10px 20px;
}
</style>
</head>
<body>
<h3><img src="img/logo/logotip.png"></h3><br>
<form action="tiplist.bo" method="post">
<p id="list-top">
	<span style="float:left display:flex;">
		<select name="search" style="height:24px; width:80px; margin-right:5px;">
			<option value="all" ${page.search eq 'all' ? 'selected' : '' }> 전체 </option>
			<option value="tt_title" ${page.search eq 'tt_title' ? 'selected' : '' }> 제목</option>
			<option value="user_id" ${page.search eq 'user_id' ? 'selected' : '' }> 작성자 </option>
			<option value="tt_content" ${page.search eq 'tt_content' ? 'selected' : '' }>내용</option>
		</select>
		<input name="keyword" type="text" value="${page.keyword }"
		style="margin-right:5px; vertical-align:middle; height:18px; width:350px;" />
		<a onclick="$('form').submit()"><img class="search" src="img/search.png"></a>
	</span>
	<!-- 로그인 했을 시에만  -->
	<br>
	<%-- <c:if test="${!empty login_info}">
	<div style="margin-right:90px;" id="button"><a onclick="location='insert.bo'">글 작성</a></div>
	</c:if> --%>
</p>
<input type="hidden" name="curPage" />
</form>


<br>
<br>
<table style="width:70%;"class="type09">
    <thead>
    <tr>
        <th scope="col" style="width:60px;">번호</th>
        <th scope="col" style="width:1200px;">제목</th>
        <th scope="col" style="width:100px;">작성자</th>
        <th scope="col" style="width:100px;">작성일</th>
        <th scope="col" style="width:100px;">조회수</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list }" var="vo">
    <tr>
        <td>${vo.no }</td>
        <td>
        <a onclick="location='tipDetail.bo?read=1&tt_id=${vo.tt_id}'">${vo.tt_title }</a>
        </td>
        <td>${vo.user_name }</td>
        <td>${vo.tt_date }</td>
        <td>${vo.readcnt }</td>
    </tr>
  
    </c:forEach>
    </tbody>
</table><br>
<div style="text-align:center;"><jsp:include page="/WEB-INF/views/include/page.jsp"/></div>
</body>
</html>