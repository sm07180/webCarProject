<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#car_info_card {
	margin: 0 auto;
	width: 60%;
	height: 350px;
	border-radius: 15px;
}

#car_nickname {
	float: left;
	margin-left: 15px;
	font-size: 15pt;
	font-weight: bold;
}

#car_image {
	float: right;
	margin-right: 15px;
	margin-top: -10px;
}

#car_mile {
	clear: both;
	text-align: left;
	margin-left: 5px;
}

#car_mile p {
	display: inline;
	margin-left: 10px;
}

#comp_mark {
	height: 120px;
	width: 120px;
}


#wrap{
	overflow: hidden;
}
/* 날씨 div */
#weather {
	width: 37%;
	height:200px;
	background:#c9d6de;
	border:1px solid #c9d6de;
	border-radius: 30px;
	margin-left: 20%;
	padding: 5px;
	float: left;
	background-size: cover;
	background-repeat: no-repeat;
}

#weather_icon {
	margin-top:10px;
	margin-left:50px;
	margin-bottom: 10px;
	float: left;
}

#now_weather {
	margin-top:40px;
	font-family: jalnan;
	font-size: 30px;
	margin-bottom: 30px;
	
}

/* 순위 */
#ranking {
	display:inline-block;
	width: 20%;
	height:200px;
	/* background:#c9d6de; */
	background-image: linear-gradient(to top, #cfd9df 0%, #e2ebf0 100%);
	border:1px solid #c9d6de;
	border-radius: 30px;
	padding: 5px;
	float: left;
	margin-left: 1%;
	vertical-align: middle;
}
.tep{
margin: 0 auto;
}

#text{
clear:both;
text-align: center;
background-color: #ffffff;
opacity: 0.5;
}
#rank{
width: 20px;
height: 20px;
}
</style>
</head>
<body>
	<h3><img src="img/logo/logocarman.png" style="width: 400px;"></h3><br>
		<c:if test="${!empty login_info.car_mimage}">
		<div id="car_info_card" style="background: url('${login_info.car_mimage}'),url('img/company/carimg.png'); background-size: cover;">
		</c:if>
		<c:if test="${empty login_info.car_mimage}">
		<div id="car_info_card" style="background: url('img/company/carimg.png'); background-size: cover;">
		</c:if>
			<div id="car_nickname">
				<h1 style="color:white; font-family: gaeul; margin-top: 10px;
				background: rgba(0,0,0,0.3) ">
				${vo.car_nickname }<h1>
			</div>
			<div id="car_image">
				<img id="comp_mark" src="img/company/car_${login_info.comp_id }.png" />
			</div>
			<div></div>
			<br>
			<br>
			<div id="car_mile">
				<p style="text-align: left;"></p>
				<p></p>
			</div>
		</div>
		<br>

	<div id="wrap">
		<div id="weather">
			<div id="weather_icon"></div>
			<div id="now_weather"></div>
		</div>
		<div id="ranking">
			<h1 class="tep" style="margin-top: 10px; font-family: aroma; color:#D81159;">${login_info.comp_id }</h1>
			<h2 class="tep" style="font-family: jalnan; font-weight: bold;">${login_info.car_name }</h2>
			<h4 class="tep">나의 최근 Km : ${login_info.car_mileage }</h4>
			<h4 class="tep">나의 연비 : ${result }</h4>
			<h4 class="tep" style="margin-bottom: 10px;">공인 연비 : ${vo.car_efficiency }</h4>
			<h1 class="tep" style="font-family: bom; color:#1e2022;"><img style="width: 30px;" id="rank" src="img/oilrank.png"> ${rank} 위</h1>
			<h2 class="tep" style="font-family: bom;">1Km 당&nbsp;&nbsp;&nbsp;${my_money} 원</h2>
		</div>
	</div>
	<p id="status" style="display: none;"></p>
	<a id="map-link" target="_blank"></a>
</body>
<script type="text/javascript">
var x;
var y;
$(document).ready(function() {
	mylocation();
	
});
	
//현재 좌표 받아오기				
function mylocation() {
		const status = document.querySelector('#status');
		const mapLink = document.querySelector('#map-link');
			  mapLink.href = '';
			  mapLink.textContent = '';
	 //현재 내위치 받아오기
	  function success(position) {
		const latitude  = position.coords.latitude;
		const longitude = position.coords.longitude;
				x= latitude;
				y = longitude;
				weather();		
		}

		function error() {
			status.textContent = 'Unable to retrieve your location';
		}

		if (!navigator.geolocation) {
			alert('browser에서 지원되지 않습니다…');
		} else {
			//alert('Locating…');
			navigator.geolocation.getCurrentPosition(success, error);
		}

}

function weather(){
	var weather = new Object(); 
	weather.x = x;
	weather.y = y;
	 $.ajax({
		  data: JSON.stringify(weather),
	      contentType: 'application/json', //보내는 데이터 형식
	      type: "post", //json으로 보낼때 필수
	      url: 'weather.my',
	      success: function(data){
	    	  console.log(data);
  	
        var rain = data[0]; 
        var sky = data[1];
        var temperature = data[2];
        
        
    	var icon = "";
  		var weather = "";
  		var text = "";
  		weather += temperature +"˚C<br/>";
        
        if(rain =="0"){
            if(sky =="1"){
            	$('#weather').css('background', 'url("img/weather/sky2.gif")').css('background-size', 'cover');
//                 Glide.with(getContext()).asGif().load(R.drawable.sky2).into(today_wether);
                icon += '<img src="img/weather/model_sky1.png" style="width: 120px; height: 120px;"/>';
                weather += "맑음";
               text +="<div id='text'>더울 수 있지만 세차하기 좋아요.</div>";
            }else if(sky=="2"){
            	$('#weather').css('background', 'url("img/weather/sky2.gif")').css('background-size', 'cover');
//                 Glide.with(getContext()).asGif().load(R.drawable.sky2).into(today_wether);
                icon += '<img src="img/weather/model_sky2.png" style="width: 120px; height: 120px;"/>';
                weather += "구름조금";
               text +="<div id='text'>세차하기 좋은 날씨입니다.</div>";
            }else if(sky=="3"){
            	$('#weather').css('background', 'url("img/weather/sky3.gif")').css('background-size', 'cover');
//                 Glide.with(getContext()).asGif().load(R.drawable.sky3).into(today_wether);
                icon += '<img src="img/weather/model_sky3.png" style="width: 120px; height: 120px;"/>';
                weather += "구름많음";
               text +="<div id='text'>시원한 바람과 세차 어떠세요?</div>";
            }else{
            	$('#weather').css('background', 'url("img/weather/sky3.gif")').css('background-size', 'cover');
//                 Glide.with(getContext()).asGif().load(R.drawable.sky3).into(today_wether);
                icon += '<img src="img/weather/model_sky4.png" style="width: 120px; height: 120px;"/>';
                weather += "흐림";
               text +="<div id='text'>우중충한 마음을 세차와 함께 깨끗하게</div>";
            }
        }else{
            if(rain=="1"){
            	$('#weather').css('background', 'url("img/weather/pty1.gif")').css('background-size', 'cover');
//                 Glide.with(getContext()).asGif().load(R.drawable.pty1).into(today_wether);
                icon += '<img src="img/weather/model_sky5.png" style="width: 120px; height: 120px;"/>';
                weather += "비";
               text +="<div id='text'>오늘은 자연세차의 시간입니다.</div>";
            }else if(rain=="2"){
            	$('#weather').css('background', 'url("img/weather/pty1.gif")').css('background-size', 'cover');
//                 Glide.with(getContext()).asGif().load(R.drawable.pty1).into(today_wether);
                icon += '<img src="img/weather/model_pty2.png" style="width: 120px; height: 120px;"/>';
                weather += "비/눈";
               text +="<div id='text'>오늘 세차를 하시려구요?</div>";
            }else if(rain=="3"){
            	$('#weather').css('background', 'url("img/weather/pty3.gif")').css('background-size', 'cover');
//                 Glide.with(getContext()).asGif().load(R.drawable.pty3).into(today_wether);
                icon += '<img src="img/weather/model_pty3.png" style="width: 120px; height: 120px;"/>';
                weather += "눈";
               text +="<div id='text'>차를 사랑하지 않으시군요...</div>";
            }
        }
        
        
        
        
  		 
	
		$('#weather_icon').html(icon);
		$('#now_weather').html(weather);
		$('#now_weather').after(text);
		
	    },
	      error: function( req ){
	          alert(req.status);
	          //mylocation();
		}
	 });
}	
</script>
</html>