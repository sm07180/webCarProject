<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.0/c3.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.9.2/d3.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.0/c3.min.css">

<style type="text/css">
#kind {
   margin: 0 auto;
   padding: 0;
}

#kind li {
   display: inline-block;
   text-align: left;
}

#kind li:not(:last-child) {
   margin-right: 50px;
}

#kind * {
   vertical-align: top;
}

.c3-axis {
   font-size: 1.5em;
	font-family: gaeul;
}

.c3-axis-x .tick {
   font-weight: bold;
   
}

tspan {
	font-size: 12px;
}

.c3-axis-y-label{

	font-size: 20px;
}


.c3-chart {
   font-size: 1.5em;
   font-weight: bold;
   font-family: nam;
}


</style>

<script type="text/javascript">


$(document).on('change', 'input[name=gubun]', function(){
   make_chart();
})

$(function(){
   make_chart();
});


var colors = [ '#45d9fd', '#fd999a', '#fbd14b', '#6a60a9', '#cff09e', '#D09E88'];


function make_chart() {
   $('#chart').html('');
   var gubun = $('input[name=gubun]:checked').val();
   
   if(gubun == 'oil_repair_cost'){
      pie_type();
   }else{
      if(gubun == 'oil') gubun = '주유량';
      if(gubun == 'oil_cost') gubun = '주유 금액';
      if(gubun == 'repair_cost') gubun = '정비 금액';
      if(gubun == 'oil_repair_cost') gubun = '주유/정비';
      
      basic_type(gubun);
   }
}

function basic_type(gubun) {
   $.ajax({
      url: 'chart/' + $('input[name=gubun]:checked').val(),
      success: function(data){
         console.log(data);
         var info = [];
         info.name = [gubun];
         if(gubun == '주유량'){
            info.value = ['리터(L)'];
         }else if(gubun == '주유 금액'){
            info.value = ['원(￦)'];
         }else if(gubun == '정비 금액'){
            info.value = ['원(￦)'];
         }
         
         $(data).each(function(idx, item){
            info.name.push(item.month);
            info.value.push(item.value);
         });
         info = [info.name, info.value];
         basic_chart(info, gubun);
      },
      error: function(req) {
         alert(req.status);
      }
   });
}

function basic_chart(info, gubun) {
   $('#chart_box').css('display', 'none');
   $('#chart').css('display', 'block');

   var chart = c3.generate({
      bindto: '#chart',
      data: {
         columns: info,
         x: gubun,
         type: 'bar',
         labels: true,
      },
      axis: {
         x: {type: 'category'},
         y: {label: {text: info[1][0], position: 'outer-top'}}
      },
      bar: {width:30},
      grid: {y: {show:true}},
      legend: {hide: true},
      size: {height:400, width: 1000}
   });
}

function pie_type() {
   $.ajax({
      url: 'chart/' + $('input[name=gubun]:checked').val(),
      success: function(data){
         console.log(data);
         var info = [];
         info.name = ['주유 금액'];
         info.value = ['정비 금액'];
         
         $(data).each(function(idx, item){
            info.name.push(item.val1);
            info.value.push(item.val2);
         });
         info = [info.name, info.value];
         pie_chart(info);
      },
      error: function(req) {
         alert(req.status);
      }
   });
}

function pie_chart(info) {
   $('#chart').css('display', 'none');
   $('#chart_box').css('display', 'block');
   
   var chart = c3.generate({
      bindto: '#chart_box',
      size: {width:1000, height:400},
      data: {
         columns:info,
         type: 'donut'
      }
   });
}
</script>

</head>
<body>
<!-- 통계 -->
	<h3><img src="img/logo/logostatistics.png" style="width: 400px;"></h3><br>
<ul id="kind">
   <li><label ><input type="radio" name="gubun" id="oil" value="oil" checked/>주유량</label></li>
   <li><label class="bar"><input type="radio" name="gubun" id="oil_cost" value="oil_cost"/>주유 금액</label></li>
   <li><label class="bar"><input type="radio" name="gubun" id="repair_cost" value="repair_cost"/>정비 금액</label></li>
   <li><label class="bar"><input type="radio" name="gubun" id="oil_repair_cost" value="oil_repair_cost"/>주유/정비</label></li>
</ul>
<div id="chart" style="padding-top: 20px; padding-left: 20px;"></div>
<div id="chart_box" style="padding-top: 20px; padding-left: 20px;"></div>
</body>
</html>