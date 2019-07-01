<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#items {
	width: 400px;
	margin: 0 auto;
}

.img {
	width:50px; height: 50px;
}


table tr td {
	text-align: left;
}

</style>
</head>
<body>
<!-- 정비목록 -->
	<h3><img src="img/logo/logocheckli.png" style="width: 400px;"></h3><br>

<table id="items">
	<c:forEach items="${list}" var="vo">
		<tr>
			<td rowspan="3">
				<img class="img" src="img/icon/${vo.repair_id}.png">
			</td>
			<td style="font-weight: bold;">${vo.repair_name}</td>
			<td rowspan="3">
				<a onclick="location='repairDetail.my?repair_id=${vo.repair_id}'">
					<img style="width:30px; height:30px;" src="img/info.png">
				</a>
			</td>
		</tr>
		<tr>
			<td>
				<c:if test="${vo.left_mileage le 0}">
					<progress value="${vo.repair_mile}" max="${vo.repair_mile}" style="width:300px;"></progress>
				</c:if>
				<c:if test="${vo.left_mileage gt 0}">
					<progress value="${vo.repair_mile - vo.left_mileage}" max="${vo.repair_mile}" style="width:300px;"></progress>
				</c:if>
			</td>
		</tr>
		<tr style="margin-bottom: 100px;">
			<c:if test="${vo.repair_term ne 0}">
				<td style="font-size: 0.8em">${vo.repair_mile} km | ${vo.repair_term}개월 마다 교체</td>
			</c:if>
			<c:if test="${vo.repair_term eq 0}">
				<td style="font-size: 0.8em">${vo.repair_mile} km 마다 교체</td>
			</c:if>
		</tr>
		<tr>
			<td colspan="3" style="height:30px;"></td>
		</tr>
	</c:forEach>
</table>
</body>
</html>