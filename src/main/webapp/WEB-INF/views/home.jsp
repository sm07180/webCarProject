<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- 오늘 방문자 : ${todayCount.todayCount} , 전체 방문자 : ${totalCount.totalCount} --%>

<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/join.css" />

<html>
<head>
<title>Home</title>

<style type="text/css">
#login_join {
	margin:0 auto;
	width: 300px;
	height: 200px;
	background: white;
}

#login, #join {
	width: 200px;
	height: 40px;
	background: #52616a;
	display: inline-block;
	margin-top: 30px;
	line-height: 40px;
	cursor: pointer;
}

#join {
	margin-bottom: 10px;
}

div a {
	width: 200px;
	color: white;
	font-family: nanum;
	font-size: 14px;
	display: inline-block;
}

p {
	font-family: nanum;
	font-size: 11px;
}

#main_photo {
	position: relative;
}

#image {
	width: 100%;
}

#text {
	position: absolute;
	width: 100%; /* optional, though better have one */
	top:20%;
}



#img_btn{
	position: absolute;
	width: 100%;
	top:85%;
	
}

#ffff{

vertical-align: bottom;
}

#text1{
	font-family: movie;
}}
</style>
</head>
<body>
<div id="main_photo">
	<img id="image" style="z-index: 1;" src="img/mainphoto.png" />
	<div id="text">
		<p style="color: white; font-weight: bold; font-size: 50px;
				background-color: black;">
		우붕이와 함께<br>편리한 내 차 관리</p>
		<c:if test="${empty login_info}"><br><br>
	<div id=login_join style="margin-top: 20px;">
			<div id=login>
				<a href='login.do'>로그인</a>
			</div>
			<div id=join>
				<a onclick="location='signup.do'">회원가입</a>
			</div>
		<br>
		<p>로그인 후 이용해주세요!</p>
		
	</div><br><br>
	</c:if>
	</div>
		
	
	<div id="img_btn" onclick="scroll()">
		<img id="section" style="width:40px; "src="img/down.png">
	</div>
</div>
<div id="seheeyap" style=" width: 100%; position: relative; vertical-align: bottom;">
	
	<div style="background:url('img/home/main1-3.jpg'); background-size:cover; vertical-align:bottom; width: 100%; height: 1000px; background-color: white; position: relative; ">
		<h2 id="text1" style="position: relative; top: 300px; left: -310px; font-family: gaeul;">언제 어디서나,쉽고 간편하게</h2>
		<h1 style="font-size:3em; font-weight:bold; position: relative; top: 310px; left: -310px; font-family: gaeul;">우붕이<차계부의 모든것></h1>
		
		<h2 style="position: relative; top: 400px; left: -310px; font-family: gaeul">누려보세요, 더 새로워진</h2>
		<h2 style="position: relative; top: 410px; left: -310px; font-family: gaeul">다양한 기능과 편의성!</h2>
	</div>
	
	<div style="background:url('img/home/main3.jpg'); background-size:cover; vertical-align:bottom; width: 100%; height: 1000px; background-color: white; position: relative; ">
		<h1 style="font-family: gaeul; position: relative; top: 350px; left: -310px;font-size:3em;">가장 저렴한</h1>
		<br>
		<h1 style="font-family: gaeul; position: relative; top: 350px; left: -310px;font-size:3em;">주유소는 ?</h1>
		<br>
		<h1 style="font-family:dh; position: relative; top: 350px; left: -310px;font-size:3em;"><img src="img/maincheck.png" style="width: 58px;">우붕이</h1>
	</div>
	
	
</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	$("#img_btn").click(function() {
	    $('html, body').animate({
	        scrollTop: $("#seheeyap").offset().top
	    }, 1200);
	});  
});
$('.br').remove();
</script>
</html>
