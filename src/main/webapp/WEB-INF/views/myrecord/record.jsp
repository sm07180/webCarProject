<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
	      url: 'year_month',
	      success: function( data ){
	         var tag = '<select id="year_month" style="width: 100px;">'
	               + '<option value="" selected>날짜 선택</option>';
	         
	         $(data).each(function(idx, item){
	             tag += '<option value="' + item.year_month + '">'
	             + item.year_month + '</option>';
	          });
	         
	         $('#date_box').html(tag);
	      },
	      error: function(){
	         alert(req.status);
	      }
	});
	
	my_record();
}).on('change', '#year_month', function(){
	my_record();
});

function my_record() {
	$.ajax({
		  type:'post',
	      url: 'my_record',
	      data: {record_date:$('#year_month').val()},
	      success: function( data ){
	          var tag = "";
	         
	          $(data).each(function(idx, item){
	        	  if(item.oil_cost != '0'){
	        		  tag += '<div id="color" style="width:400px; border-radius: 10px; /* background:#c9d6de; */ height:100px; border:1px solid #cccccc; margin-top:20px;">';
	        		  tag += '<label><img onclick="go_delete(' + item.record_id + ')" style="width:20px; height:20px; cursor:pointer; float:right;" src="img/x1.png"/>';
	        		  tag += '<div style="float:left;"><img src="img/icon/oil2.png" style="width:50px; height:50px;"/></div>';
	        		  tag += '<div style="font-weight:bold; text-align:left; margin-left:50px; font-size:1.1em; margin-top:7px;">' + item.station;
	        		  tag += '<div style=" float:right;">'+item.record_date+'</div>'+ '</div>';
	        		  tag += '<div style="clear: both; text-align:left; color:black; margin:5px 0 0 50px;">' + item.car_mileage + ' km | ￦ ' + item.oil_cost * item.oil + '</div>'
		              tag += '</div>';
	        	  }
	        	  
	        	  if(item.repair_cost != '0'){
	        		  
	        		  tag += '<div id="color" style="width:400px; border-radius: 10px; /* background:#c9d6de; */ height:150px; border:1px solid #cccccc; margin-top:20px;">';
	        		  tag += '<label><img onclick="go_delete(' + item.record_id + ')" style="width:20px; height:20px; cursor:pointer; float:right;" src="img/x1.png"/>';
	        		  tag += '<div style="float:left;"><img src="img/icon/' + item.repair_id + '.png" style="width:50px; height:50px;"></div>';
	        		  tag += '<div style="font-weight:bold; text-align:left; margin-left:50px; font-size:1.1em; margin-top:7px;">' + item.repair_name+'<div style=" float:right;">'+item.record_date +'</div>'+ '</div>';
	        		  tag += '<div style="clear: both; text-align:left; color:black; margin:5px 0 0 50px;">' + item.car_mileage + ' km | ￦ ' + item.repair_cost + '</div>';
		              if(item.memo != null) {
		            	  tag += '<div style="text-align: left; padding-left:5px; font-family:bom;">' + '메모' + '</div>';
		            	  tag += '<div style="text-align:left; font-size:13px; border-top:1px solid black;">' + item.memo + '</div>';
		              }
		              tag += '</div>';
	        	  }
	          });
	         
	          $('#record_box').html(tag);
	      },
	      error: function(){
	         alert(req.status);
	      }
	});
}

function go_delete(record_id) {
	if(confirm("정말 삭제?")) {
		location="record_delete?record_id=" + record_id;
	}
}

</script>

<style>
body div {
	margin: 0 auto;
	padding: 5px;
}

#date_box {
	margin: 0 auto;
	width:200px;
}

#year_month {
	height: 25px;
	padding-bottom: 3px;
	
}

select {
	padding-left:8px;
	font-size:12px;
	width: 90px;
	height: 23px;
/*   	border: 1px solid #999; */
  	-webkit-appearance: none;  /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
    background: url("img/arrow.png") no-repeat 95% 50%;  /* 화살표 모양의 이미지 */
}

#color {
	background-color: #c4ddde;
}

#btn_delete {
	display: none;
}


</style>
</head>
<body>
	<h3><img src="img/logo/logocarrec.png" style="width: 400px;"></h3><br>
<div id="date_box"></div>
<div id="record_box" > <!-- style="margin: 20px auto; width:220px;" --></div>
</body>
</html>