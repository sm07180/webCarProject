<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.img {
	width: 50px; height: 50px;
}

#pack {
	width: 750px;
	margin: 0 auto;
	margin-left: 280px;
}

.repair_items {
	width:300px;
	height:80px;
	border-bottom: 1px solid #cccccc;
	float:left;
	margin:0 25px 0 25px;
}

.repair_img_item {
	width:70px; height:70px;
	display:inline-block;
	float:left;
	margin-top:10px;
}

.repair_info_item {
	width:220px; height:70px;
	display:block-block;
	float:left;
	text-align: left;
	cursor: pointer;
	margin-top:10px;
}

p {
	margin:6px;
	text-align: left;
}

.check_point {
	background-color: #79bd9a;
}

#it {
	/* background-color: #fffff5; */
	background-image:url("img/check.png");
	opacity:0.5;
	color:black;
	line-height: 50px;
	font-weight: bold;
	float:left;
	font-family: nam;
	font-size:12px;
	border-radius: 20px;
	border: none;
}

#check_pack{
	width:612px; height:200px;
	margin: 0 auto;
	/* border: 1px solid black; */
}

.button{
	color:black;
	border: 0.3px solid black;
	background: #e3dede;
	padding: 10px 20px;
	cursor: pointer;
}

.button:hover {
	color:white;
	background: #1e2022;
	padding: 10px 20px;
	cursor: pointer;
}

#etc_check {
 	display:none;
}

#input_etc {
	display: none;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$('#check_pack').css('display', 'none');
	
	$('.repair_items').click(function(){
		if($(this).hasClass('check_point')) {
			$(this).removeClass('check_point');
		}else {
			$(this).addClass('check_point');
		}
		
		//repair_id
		var val = $(this).children('input[name="hidden_id"]').val();
		
		//repair_name
		var div_val = $('#check_pack').text();
		
		var hidden_id = $(this).children('[name="hidden_id"]').val();
		
		$.ajax({
			url: 'repairCheck',
		    data: { repair_id : val },
		    dataType: 'json',
		    success: function( data ){
		    	var tag = "";
		        
		    	$(data).each( function(idx, item){
		    		if(div_val.search(item.repair_name) != -1) {
		    			$('div').remove('[class="'+hidden_id+'"]');
		    		}else{
		    			tag += '<div id="it" style="border:1px solid #cccccc; width:100px; height: 50px;"';
		        		tag += 'class='+item.repair_id+'>'+item.repair_name + '</div>';
		    		}
		        });
		    	
		        $('#check_pack').append(tag);
		        $('input[name="repair_id_store"]').append();
		        
		        if($('#check_pack').text() != '') {
		        	$('#check_pack').css('display', 'block');
		        }else {
		        	$('#check_pack').css('display', 'none');
		        }
		    },
		    error: function(req){
		    	alert(req.status);
		    }
		});
	});
});

function check_btn() {
	var result = $('#check_pack').text();
	
	if(result == "") {
		alert("정비목록을 체크 또는 입력하세요");
		return false;
	}else {
		location.href = 'repairInsertForm?result=' + result;
	}
	//alert(result);
}

function etc_input() {
	var chk = $('#etc_check').prop("checked");
	
	if(chk) {
		$('#input_etc').css('display', 'none');
	}else {
		$('#input_etc').css('display', 'inline-block');
	}
}
</script>
</head>
<body><!-- 정비기록 -->
<h3><img src="img/logo/logocheckrec.png" style="width: 400px;"></h3><br>
<input type="hidden" name="repair_id_store">
<div id="check_pack"></div><br>
	<input class="button" type="button" value="확인" onclick="return check_btn()"><br><br>
<div id="pack">
	<c:forEach items="${list}" var="vo">
		<div class="repair_items">
			<input name="hidden_id" type="hidden" value="${vo.repair_id}">
			<div class="repair_img_item">
				<img class="img" src="img/icon/${vo.repair_id}.png">
			</div>
			
			<div class="repair_info_item">
				<p style="font-weight: bold;">${vo.repair_name}</p>
			<c:if test="${vo.repair_term ne 0}">
				<p style="font-size: 0.8em; padding-top: 10px;">${vo.repair_mile} km | ${vo.repair_term}개월 마다 교체</p>
			</c:if>
			<c:if test="${vo.repair_term eq 0}">
				<p style="font-size: 0.8em; padding-top: 10px;">${vo.repair_mile} km 마다 교체</p>
			</c:if>
			</div>
		</div>
	</c:forEach>
</div>
</body>
</html>