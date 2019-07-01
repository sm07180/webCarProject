<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
* {
	margin: 0 auto;
}

.oil_div {
	border-bottom: 1px solid;
	border-color: #cccccc;
	width: 40%;
	height: 50px;
	line-height: 50px;
	margin-top: 10px;
}

#mark {
	width: 20px;
	height: 20px;
	display: block;
	float: left;
	margin-top: 15px;
	margin-right: 10px;
}

select {
	padding-left: 8px;
	font-size: 12px;
	width: 90px;
	height: 23px;
	/*   	border: 1px solid #999; */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
	background: url("img/arrow.png") no-repeat 95% 50%; /* 화살표 모양의 이미지 */
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
    $("#date1").datepicker({
    	//showOn: "both",
		changeYear:true

    });
});


( function( factory ) {
	if ( typeof define === "function" && define.amd ) {

		// AMD. Register as an anonymous module.
		define( [ "../widgets/datepicker" ], factory );
	} else {

		// Browser globals
		factory( jQuery.datepicker );
	}
}( function( datepicker ) {

datepicker.regional.ko = {
	closeText: "닫기",
	prevText: "이전달",
	nextText: "다음달",
	currentText: "오늘",
	monthNames: [ "1월","2월","3월","4월","5월","6월",
	"7월","8월","9월","10월","11월","12월" ],
	monthNamesShort: [ "1월","2월","3월","4월","5월","6월",
	"7월","8월","9월","10월","11월","12월" ],
	dayNames: [ "일요일","월요일","화요일","수요일","목요일","금요일","토요일" ],
	dayNamesShort: [ "일","월","화","수","목","금","토" ],
	dayNamesMin: [ "일","월","화","수","목","금","토" ],
	weekHeader: "주",
	dateFormat: "yy년 m월 d일",
	firstDay: 0,
	isRTL: false,
	showMonthAfterYear: true,
	yearSuffix: "년" };
datepicker.setDefaults( datepicker.regional.ko );

return datepicker.regional.ko;

} ) );
</script>
</head>
<body>
	<h3><img src="img/logo/logogasrec.png" style="width: 400px;"></h3><br>
	<form action="oilrecord.oi" method="post">
		<div class="oil_div">
			<img id="mark" src="img/mylocation.png">
			<h3 style="float:left; display: block;">주유소 이름</h3>
			<input type="text" name="date" id="date1" size="12" placeholder="날짜" style="float: right; margin-top: 15px"/>
		</div>
		<div class="oil_div" id="locoil">
			<h2 id="name_text" style="float: left;"></h2>
			<select id="comp_name" style="width: 200px; float: right;">
			</select>
		</div>
		<div class="oil_div">
			<select id="mymileage" style="float: left;">
				<option value="">자가입력</option>
				<option value="${login_info.car_mileage}">최근기록</option>
			</select> <input name="mymileage" type="number"
				style="width: 250px; height: 30px; float: right;">
		</div>
		<div class="oil_div">
			<h3 style="float: left;">주유금액</h3>
			<input name="oil_price" onkeyup="price_div('oil_price')" type="number"
				style="width: 250px; height: 30px; float: right;">
		</div>
		<div class="oil_div">
			<select name="oil_cost" id="prodcd" style="float: left;">
			</select> <input id="cost" type="number"
				style="width: 250px; height: 30px; float: right;">
		</div>
		<div class="oil_div">
			<h3 style="float: left;">주유량 L</h3>
			<input name="oil_l" type="number"
				style="width: 250px; height: 30px; float: right;">
		</div>
		<div class="oil_div"></div>
		<p id="status" style="display: none;"></p>
		<a id="map-link" target="_blank"></a>
		<input type="hidden" name="user_id" value="${login_info.user_id}" />
		<input type="hidden" name="comp_name"/> 
		<br><br>
		<input type="button" class=btn-fill onclick="oilcheck()" value="등록하기" />
		<input type="button" class=btn-fill value="취소" />
	</form>
</body>
<script type="text/javascript">
	var x;
	var y;
	var radius = 1000;
	var prodcd = "B027";
	$(document).ready(function() {
		mylocation();
	}).on('change', '#comp_name', function() {
		var name = $('#comp_name option:selected').text();
		$('[name=comp_name]').val(name);
		$('#name_text').html(name);
		compcode_search();
	}).on('change', '#prodcd', function() {
		var price = $('#prodcd option:selected').val();
		//alert(price);
		$('#cost').val(price);
	}).on('change', '#mymileage', function() {
		var mileage = $('#mymileage option:selected').val();
		//alert(mileage);
		$('[name=mymileage]').val(mileage);
	});

	function mylocation() {
		const status = document.querySelector('#status');
		const mapLink = document.querySelector('#map-link');
		mapLink.href = '';
		mapLink.textContent = '';
		//현재 내위치 받아오기
		function success(position) {
			const latitude = position.coords.latitude;
			const longitude = position.coords.longitude;
			//status.textContent = '';
			//mapLink.href = `https://www.openstreetmap.org/#map=18/${latitude}/${longitude}`;
			//mapLink.textContent = `Latitude: ${latitude} °, Longitude: ${longitude} °`;
			x = latitude;
			y = longitude;
			Oil();
		}

		function error() {
			status.textContent = 'Unable to retrieve your location';
		}

		if (!navigator.geolocation) {
			//status.textContent = 'Geolocation is not supported by your browser';
			alert('browser에서 지원되지 않습니다…');
		} else {
			//status.textContent = 'Locating…';
			//alert('Locating…');
			navigator.geolocation.getCurrentPosition(success, error);
		}
		//document.querySelector('#find-me').addEventListener('click', geoFindMe);

	}

	//주유기록에서 오일 받아오기
	function Oil() {
		var oil = new Object();
		oil.prodcd = prodcd;
		oil.x = x;
		oil.y = y;
		oil.radius = radius;
		$.ajax({
			data : JSON.stringify(oil),
			contentType : 'application/json', //보내는 데이터 형식
			type : "post", //json으로 보낼때 필수
			url : 'oillist.oi',
			success : function(data) {
				//console.log(data);
				var tag = "";

				$(data).each(
						function(idx, item) {
							tag += '<option value="'+item.comp_code+'">'
									+ item.comp_name + '</option>';
						});

				$('#comp_name').html(tag);
			},
			error : function(req) {
				alert(req.status);
			}
		});
	}

	function compcode_search() {
		var oil = new Object();

		oil.compy_code = $('#comp_name option:selected').val();
		$.ajax({
			data : JSON.stringify(oil),
			contentType : 'application/json', //보내는 데이터 형식
			type : "post", //json으로 보낼때 필수
			url : 'compcode_search.oi',
			success : function(data) {
				console.log(data);
				var tag = "";

				$(data).each(
						function(idx, item) {
							var code = item.oil_code;
							if (code == "B027") {
								tag += '<option value="'+item.oil_price+'">'
										+ '휘발유' + '</option>';
							} else if (code == "D047") {
								tag += '<option value="'+item.oil_price+'">'
										+ '경유' + '</option>';
							} else if (code == "B034") {
								tag += '<option value="'+item.oil_price+'">'
										+ '고급휘발유' + '</option>';
							}
						});

				$('#prodcd').html(tag);
				var price = $('#prodcd option:selected').val();
				$('#cost').val(price);
			},
			error : function(req) {
				alert(req.status);
			}
		});
	}

	function oilcheck() {

		if ($('[name=mymileage]').val() == '') {
			alert('주행거리를 입력하세요');
			$('[name=mymileage]').focus();
			return;
		}

		if ($('[name=oil_price]').val() == '') {
			if($('[name=oil_l]').val() == ''){
			alert('주유소 선택 후 주유금액을 입력하세요');
			$('[name=oil_price]').focus();
				return;
			}else{
				alert('주유금액을 입력하세요');
				$('[name=oil_price]').focus();
				return;				
			}
		}

		if ($('#cost').val() == '') {
			
			alert('유종을 선택해 주세요');
			
			$('#cost').focus();
			return;
		}

		if ($('[name=oil_l]').val() == '') {
			alert('주유량을 확인해주세요');
			$('[name=oil_l]').focus();
			return;
		}

		$('form').submit();

	}

	function price_div(tag) {
		var price = Number($('[name=' + tag + ']').val());
		var cost = Number($('[name=oil_cost]').val());
		//alert(cost);
		//alert(price);
		var oil_L;
		if (cost != '') {
			oil_L = parseInt(price / cost);
		}

		$('[name=oil_l]').val(oil_L);
	}
</script>

</html>