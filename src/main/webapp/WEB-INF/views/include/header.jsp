<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- <link rel="stylesheet" href="css/signup.css" /> -->
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="416385676580-2ohn06h8k0129b9tr94uf1tj8n8otob7.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
<style type="text/css">
* {
	text-align: center;
	padding: 0;
	margin: 0;
}


img {
	text-align: center;
}

a {
	text-decoration: none;
	font-size: 12px;
}


body {
	background: #f0f5f9;
	/* background: #DAE2F8;  /* fallback for old browsers *
/*background: -webkit-linear-gradient(to right, #D6A4A4, #DAE2F8);  /* Chrome 10-25, Safari 5.1-6 */
	/*background: linear-gradient(to right, #D6A4A4, #DAE2F8); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}

nav {
	position: fixed;
	top:0;
	left:0;
	width: 100%;
	z-index: 999999;
}

nav ul {
	/* list-style-type: none; */
	height:60px;
	line-height:60px;
	margin: 0px;
	padding:0;
	width:100%;
	z-index: 999999;
	background: rgba(223,232,240,0.7);
}

nav ul li {
	float: left;
	font-size: 20px;
	display: inline;
	/* margin-top: 20px; */
	line-height: 50px;
	vertical-align: middle;
	text-align: center;
	/* 	border : 2px solid #fff; */
	position: relative;
	color: #dddddd;
	height:60px;
	line-height:60px;
}

nav .top {
	color: black;
	width: 120px;
	font-size: 18px;
	font-weight: bold;
	text-decoration: none;
	font-family: jalnan;
	/* background: #dfe8f0; */
	
}

nav .top:hover {
	color: #df405a;
	background-color: rgba(201,214,222,0.7);
}

.header_menu {
	width: 100%;
	margin:0 auto;
}

.header_logo {
	text-align: center;
}

.top, .submenua {
	text-decoration: none;
	display: block;
	width: 120px;
	font-size: 15px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum;
}

}
.menu:hover .top {
	/* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
	color: red;
	background-color: #4d4d4d;
}

.header_menu ul {
	text-align: center;

}

.header_menu ul li {
	display: inline-block;
}

.submenua {
	color: #2d2d2d;
	/* background-color: white; */
	/* border: solid 1px black; */
	margin-top: 0px;
	font-family: nanum;
	font-size: 13px;
	width:120px;
	height: 60px;
}

.submenu, .submenu1, .submenu2, .submenu3, .submenu6 {
	position: absolute;
	height: 0px;
	overflow: hidden; /* 실 내용이 높이보다 커지면 해당 내용 감춤 */
	transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */
}

.menu:hover .submenu { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
	height: 300px;
	background-color: #f0f5f9;
}

.menu:hover .submenu1 { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
	height: 60px;
	background-color: #f0f5f9;
}

.menu:hover .submenu2 { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
	height: 120px;
	background-color: #f0f5f9;
}

.menu:hover .submenu3 { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
	height: 120px;
	background-color: #f0f5f9;
}

.menu:hover .submenu6 { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
	height: 360px;
	background-color: #f0f5f9;
}

.submenua:hover { /* 하위 메뉴의 a 태그의 마우스 오버 스타일 설정*/
	color: red; /* 글씨색을 빨간색으로 설정 */
	background-color: rgba(201,214,222,0.7); /* 배경을 RGB(DDDDDD)로 설정 */
}

.menu_1 {
	display: inline-block;
}

#logout {
	display: inline-block;
	height: 30px;
	line-height: 30px;
	border: 0.5px solid black;
	background-color: white;
	color:black;
}

#logout:hover {
	background: #dddddd;
	color: red;
}

</style>



<nav id="header">
	<div class="header_menu">
	
		<ul class="menu_1">
			<li style="margin-left: 10px; margin-right: 20px;"><a href="home"><img style="margin: 5px;" src="img/small.png"></a></li>
			<li class="menu"><a class="top" href="home">홈</a></li>
			<li class="menu"><a class="top" href="list.no">공지</a>
				<ul class="submenu1">
					<li><a href="list.no" class="submenua">공지사항</a></li>
				</ul></li>
				<c:if test="${!empty login_info}">
			<li class="menu"><a class="top" href="manage.my">내차</a>
				<ul class="submenu6">
					<li><a
						href="manage.my"
						class="submenua">내 차 관리</a></li>
					<li><a href="record.my"
						class="submenua">내 기록</a></li>
					<li><a href="oilcheck.my" class="submenua">주유기록</a></li>
					<li><a href="check.my" class="submenua">정비기록</a></li>
					<li><a href="repair.my" class="submenua">정비목록</a></li>
					<li><a href="chart.my" class="submenua">통계</a></li>
				</ul></li>
			<li class="menu"><a class="top" href="search.oi">주유소</a></li>
			<li class="menu"><a class="top" href="list.bo">게시판</a>
				<ul class="submenu2">
					<li><a href="list.bo" class="submenua">자유게사판</a></li>
					<li><a href="tiplist.bo" class="submenua">꿀팁</a></li>
				</ul></li>
				</c:if>
				
			<c:if test="${login_info.admin eq 'Y'}">
				<li class="menu"><a class="top" href="admin/rittalList">관리자</a>
				</li>
			</c:if>
			<div style="font-size:13px; float: right; margin-right: 20px;">
					<c:if test="${!empty login_info}">
							${login_info.user_name}님 안녕하세요^^ 
					<a style="width:60px;" id="logout" onclick="logout()" style="width: 50px;">로그아웃</a>
					<a style="width:60px;" id="logout" onclick="location='info_modify'">정보수정</a>
				</c:if>
			</div>
		</ul>
		
	</div>
	
</nav>


<br class="br"><br class="br"><br class="br"><br class="br"><br class="br">
<script src="https://apis.google.com/js/platform.js?onload=onLoadCallback" async defer></script>

<script type='text/javascript'>
	function logout() {
		location.href = 'logout';
	}
	
	
	
	$(function(){

		if("${visitorSession}" == ""){
			$.ajax({
				contentType: 'text', //보내는 데이터 형식
				type: "post", //json으로 보낼때 필수
				url: 'visitor/insertCnt.do',
				success: function(data){
					
		    	},
				error: function( req ){
					console.log(req)
				}
			 });
		}
		
	})
	
</script>






