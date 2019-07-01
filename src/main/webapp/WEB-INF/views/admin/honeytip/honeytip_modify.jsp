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
<div class="container-fluid" style="width:95%;">
<h2 style="text-align: center; margin-top:10px; margin-bottom:10px;"><img style="width: 400px;" src="<c:url value='/img/admintip.png' />" /></h2>
<form action="honeytipUpdate" method="post" id="frm">
<input type="hidden" name="tt_id" value="${vo.tt_id}">

<table class="table table-bordered" id="dataTable" width="95%" cellspacing="0">
		<tr>
			<th style="width: 140px;">제목</th>
			<td style="text-align: left" colspan="5">
			<input title="제목" type="text" name="tt_title" value="${vo.tt_title}"
				style="border: 1px solid #eeeeee; text-align: left; background: none; width:100%"/></td>
		</tr>
		<tr>
			<th>작성자</th>
				<td style="text-align: left">관리자</td>
			<th style="width: 100px;">작성일자</th>
				<td style="width: 100px;">${vo.tt_date}</td>
		</tr>
		<tr>
			<!-- <th class="content">내용</th> -->
			<td class="content" style="text-align: left; padding: 10px;" colspan="4">
			<textarea style="width: 100%; height: 500px; resize: none; border: 1px solid #eeeeee;
				padding: 5px;" rows="13" cols="80" id="tt_content" name="tt_content">
			${fn:replace(vo.tt_content,enter,'<br/>')}
			</textarea>
		</tr>
	
</table><br>
<p class="small text-center text-muted my-5">
<a class="button" onclick="submitContents()">저장</a>
<a class="button" onclick="history.go(-1)">취소</a>
</p>
</form>
</div>
<script type="text/javascript"
	src="/car/resources/smartEditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "tt_content",  //textarea ID
    sSkinURI: "/car/resources/smartEditor/SmartEditor2Skin.html",  //skin경로
    fCreator: "createSEditor2",
    htParams : { // 툴바 사용 여부 (true/false)
        bUseToolbar : true, // 입력창 크기 조절바 사용 여부 (true/false)
        bUseVerticalResizer : true, // 모드 탭(Editor|HTML|TEXT) 사용 여부 (true/false)
        bUseModeChanger : true // 전송버튼 클릭이벤트
    }
});

function submitContents() {
    // 에디터의 내용이 textarea에 적용
    oEditors.getById["tt_content"].exec("UPDATE_CONTENTS_FIELD", []);
    
    $("#frm").submit();
}
</script>

</body>
</html>