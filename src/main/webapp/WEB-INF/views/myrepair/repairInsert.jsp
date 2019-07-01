<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/repair_memo_check.js"></script>
<style type="text/css">
table{
	background-color: #f7faf7;
}

table tr td{
	text-align: left;
	height:50px;
}

p {
	padding-left: 10px;
}

#date1{
	width:120px;
	height: 20px;
	border: none;
}

#mileage{
	width:120px;
	height: 20px;
	border: none;
}

.valid {
	color: #006622;
}

.invalid {
	color: red;
}

.valid, .invalid {
	font-size: 9pt;
}
#memo_status{
	margin-top:5px;
}

#btn_1, #btn_2{
	display:inline-block;
	width:80px;
	height:40px;
	line-height:40px;
	background-color: #c9d6de;
	border: 1px solid #1e2022;
	font-size: 13px;
	cursor: pointer;
}

#btn_1:hover, #btn_2:hover {
	background-color: #52616a;
	border: 1px solid #1e2022;
	color: white;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

</style>
<script type="text/javascript">
function check(){
	var ck = true;
	
	if($('[name=record_date]').val()==''){
		alert("날짜를 입력해 주세요.");
		$('[name=record_date]').focus();
		return false;
	}
	
	if($('[name=car_mileage]').val()==''){
		alert("누적 주행 거리를 입력해 주세요.");
		$('[name=car_mileage]').focus();
		return false;
	}
	
	if($('[name=repair_cost]').val()==''){
		alert("지출금액을 입력해 주세요.");
		$('[name=repair_cost]').focus();
		return false;
	}
	if($('[name=memo]').val()==''){
		alert("메로를 입력해 주세요.");
		$('[name=memo]').focus();
		return false;
	}
	
	
	if($('#memo_check').val()=='n'){
		alert('50자 이내로 입력해 주세요.')
		return false;
	}
	
	$.ajax({
	      url: 'recent_mileage',
	      async:false,
	      success: function( data ){
	          if(parseInt(data) > parseInt($('#mileage').val())) {
	        	  alert('최근 입력한 누적주행거리보다 작은값이 입력되었습니다.');
	        	  ck = false;
	          }
	      },
	      error: function(){
	         alert(req.status);
	      }
	});
	
	if(!ck) {
		return false;
	}
}

function validate(tag){
	var data=$('[name=memo]').val();
	if(tag=='memo'){
		data=memo.memo_status(data);
		console.log(data);
	}
	$('#memo_status').text(data.desc);
	$('#memo_status').removeClass('valid invalid');
	$('#memo_status').addClass(data.code=='valid' ? 'valid':'invalid');
	
	$('#memo_check').val(data.code=='valid' ? 'y':'n' );
	
	return data;

}

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

	<h3><img src="img/logo/logocheckrec.png" style="width: 400px;"></h3><br>
<form action="repairInsert" method="post">
	<input autocomplete="off" placeholder="날짜" type="text" name="record_date" id="date1"
		size="12" style="margin-bottom: 10px; border: 1px solid #cccccc; width: 180px;" readonly/>
	<input autocomplete="off" placeholder="누적주행거리" name="car_mileage" id="mileage" type="text"
		name="car_mileage" style="margin-bottom: 10px; border: 1px solid #cccccc; width: 180px;">
		<br/><br/>
	<div style="display: inline-block;  margin: 0 auto; text-align: center;">
	<c:forEach items="${list}" var="vo">
		<input name="repair_id" type="hidden" value="${vo.repair_id}"/>
		
		
		
		<table style="position:relative; margin:0 auto; margin-left:12px; width: 23%; border:1px solid #cccccc;   padding: 7px; margin-bottom:12px; float: left; " >
			<tr>
				<td><img src="img/icon/${vo.repair_id}.png" style="width:30px; height:30px;"></td>
				<td colspan="2" style="font-weight: bold; border-bottom: 1px solid #cccccc;"><p>${vo.repair_name}</p></td>
			</tr>
			
			<tr>
				<td></td>
				<td style="border:0; border-bottom: 1px solid #cccccc;"><input name="repair_cost" type="number" placeholder="지출금액" style="text-align:left; height:20px; width: 180px; background-color: white; border:0;"/></td>
				<td style="border:0; border-bottom: 1px solid #cccccc;"><p style="color: #cccccc">￦</p></td>
			</tr>
			
			<tr>
				<td></td>
				<td colspan="2">
					<textarea name="memo" onkeyup="validate('memo')" style="text-align:left; width: 180px; resize:none; height: 100px; border:none; resborder:none; background-color: white;" ></textarea>
					<div id="memo_status" class="valid" style="font-size:13px; padding-bottom: 5px; ">메모를 입력해주세요.</div>
				</td>
			</tr>
		</table>
		
		
	</c:forEach>
	</div>
	<br>
	<input type="hidden" id="memo_check" value="n"/>
	<input onclick="return check()" type="submit" value="입력" id="btn_1" >
	<input type="button" value="항목 변경" onclick="location='check.my'" id="btn_2">
</form>
	
</body>
</html>