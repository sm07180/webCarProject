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

<div class="container-fluid">
<c:if test="${!empty boarddetail}">
<h2 style="text-align: center; margin-top:10px; margin-bottom:10px;"><img style="width: 400px;" src="<c:url value='/img/adminboard.png' />" /></h2>
</c:if>
<c:if test="${!empty ttdetail}">
<h2 style="text-align: center; margin-top:10px; margin-bottom:10px;"><img style="width: 400px;" src="<c:url value='/img/admintip.png' />" /></h2>
</c:if>

<c:if test="${!empty vo}">
<h2 style="text-align: center; margin-top:10px; margin-bottom:10px;"><img style="width: 400px;" src="<c:url value='/img/admintip.png' />" /></h2>
</c:if>

<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

<c:if test="${!empty vo}">
		<tr>
			<th style="width: 140px;">제목</th>
			<td style="text-align: left" colspan="5">${vo.tt_title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td style="text-align: left">관리자</td>
			<th style="width: 100px;">작성일자</th>
			<td style="width: 100px;">${vo.tt_date}</td>
		</tr>
		<tr>
			<!-- <th class="content">내용</th> -->
			<td class="content" style="text-align: left" colspan="4">${fn:replace(vo.tt_content,enter,'<br/>')}</td>
		</tr>
</c:if>
<c:if test="${!empty boarddetail}">
		<tr>
			<th style="width: 140px;">제목</th>
			<td style="text-align: left" colspan="5">${boarddetail.title}</td>
		</tr>
		<tr>
			<th style="width: 140px;">작성자</th>
			<td style="text-align: left;">관리자</td>
			<th style="width: 100px;">작성일자</th>
			<td style="width: 100px;">${boarddetail.write_date}</td>
		</tr>
		<tr>
			<!-- <th class="content">내용</th> -->
			<td class="content" style="text-align: left" colspan="4">${fn:replace(boarddetail.content,enter,'<br/>')}</td>
		</tr>
</c:if>
<c:if test="${!empty ttdetail}">
		<tr>
			<th style="width: 140px;">제목</th>
			<td style="text-align: left" colspan="5">${ttdetail.title}</td>
		</tr>
		<tr>
			<th style="width: 140px;">작성자</th>
			<td style="text-align: left;">관리자</td>
			<th style="width: 100px;">작성일자</th>
			<td style="width: 100px;">${ttdetail.write_date}</td>
		</tr>
		<tr>
			<!-- <th class="content">내용</th> -->
			<td class="content" style="text-align: left" colspan="4">${fn:replace(ttdetail.content,enter,'<br/>')}</td>
		</tr>
</c:if>
</table>

<p class="small text-center text-muted my-5">
<a class=button onclick="history.go(-1)">목록으로</a>

<!-- 관리자가 회원이쓴글을 눌렀을땐 안보여야됨 -->
<c:if test="${empty ttdetail and empty boarddetail }">
	<a class=button onclick="location='honeytipModify?tt_id=${vo.tt_id}'">수정</a>
</c:if>
<%-- <a class=button onclick="if(confirm('정말 삭제하시겠습니까?')){location='honeytipDelete?title_name=${vo.title_name}${boarddetail.title_name}${ttdetail.title_name}&tt_id=${vo.tt_id}${boarddetail.write_id}${ttdetail.write_id}'}">삭제</a> --%>
<a class=button onclick="write_delete('${vo.title_name}${boarddetail.title_name}${ttdetail.title_name}','${vo.tt_id}${boarddetail.write_id}${ttdetail.write_id}')">삭제</a>
<script type="text/javascript">
	function write_delete(title_name,write_id){
		
		if(confirm('이 글을 삭제 하시겠습니까?')) {
			$.ajax({
				type:'post',
				url: 'honeytipDelete',
				data : {tt_id:write_id,title_name:title_name },
				success: function(data) {
					alert('글이 삭제되었습니다.');
					location.href="honeytipList";
					
				},
				error: function(req) {
					alert(req.status);
				}
			});
		}
		
	}
</script>

</p>
</div>
</body>
</html>