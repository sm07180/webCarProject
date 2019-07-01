<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

	#comment{
		background: #FBFFB9;
 		display:inline-block;
		box-shadow:10px 10px #c9d6de;
		width:320px; 
		margin: 0 auto;
		font-size: 13px;
		padding: 15px;
		text-align:left;
		border: 1px solid black;
		left: 38%;
		top:250px;
	}

</style>
</head>
<body>
	<h3><img src="img/logo/logocheckrec.png" style="width: 400px;"></h3><br>
<img style="width:60px; height:60px;" src="img/icon/${detailList.repair_id}.png">
<h2>${detailList.repair_name}</h2>
<br>
	<div id="comment">
	${fn:replace(detailList.repair_comment,enter,'<br/>')}</div><br><br><br><br>

<c:if test="${detailList.diff_mileage ge 0}">
	<progress value="${detailList.repair_mile - detailList.diff_mileage}" max="${detailList.repair_mile}" style="width:500px;"></progress><br/>
	${detailList.diff_mileage} km 남음 | ${detailList.repair_mile} km 마다 교체
</c:if>
<c:if test="${detailList.diff_mileage lt 0}">
	<progress value="${detailList.repair_mile}" max="${detailList.repair_mile}" style="width:500px;"></progress><br/>
	${(detailList.diff_mileage) * -1} km 지남 | ${detailList.repair_mile} km 마다 교체
</c:if>
<br/><br/>
<c:if test="${detailList.repair_term ne 0}">
	<progress value="${detailList.repair_term*30 - detailList.left_date}" max="${detailList.repair_term * 30}" style="width:500px;"></progress><br/>
	교체 예정일 : ${detailList.goal_date} | ${detailList.left_date}일 남음 |  ${detailList.repair_term} 개월 마다 교체
</c:if>
<br/><br/>

<input type="button" class="btn-fill" value="정비 기록하기" onclick="location='repairInsertForm?result=${detailList.repair_name}'">
</body>
</html>