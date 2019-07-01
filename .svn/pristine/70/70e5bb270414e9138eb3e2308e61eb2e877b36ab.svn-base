<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table {
	margin:0 auto;
}
table.type09 {
	width:70%;
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
a{
cursor: pointer;
font-size: 13px;
display: inline-block;

}

#button{
	float:right;
}

.write_btn{
	margin-left:800px;
	color:black;
	border: 0.3px solid black;
	background: #c9d6de;
	padding: 10px 20px;
}

.write_btn:hover {
	color:white;
	background: #1e2022;
	padding: 10px 20px;
}



</style>
</head>
<body>
<h3><img src="img/logo/logonotice.png"></h3>
<form action="list.no" method="post">

<input type="hidden" name="curPage" >
</form>
<table class="type09">
<thead>
	<tr>
		<th scope="col" style="width:60px;">번호</th>
        <th scope="col" style="width:1200px;">제목</th>
        <th scope="col" style="width:100px;">작성일자</th>
        <th scope="col" style="width:50px;">작성자</th>
        <th scope="col" style="width:50px;">조회수</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${page.list}" var="vo">
		<tr><td>${vo.no}</td>
		<td align="left">
		<a onclick="location='detail.no?read=1&notify_id=${vo.notify_id}'">${vo.notify_title}</a></td>
		<td>${vo.notify_date}</td>
		<td>관리자</td>
		<td>${vo.readcnt}</td>
	</tr>
	</c:forEach> 
	</tbody>
</table><br>
<jsp:include page="/WEB-INF/views/include/page.jsp"/>
</body>
</html>