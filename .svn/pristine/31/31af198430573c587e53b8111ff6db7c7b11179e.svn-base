<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d6527f14573836af734688a2d407ee4&libraries=services,clusterer,drawing"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCsrerDHJrp9Wu09Ij7MUELxCTPiYfxfBI"></script>
<title>주유소</title>
<style type="text/css">

#map-set{
list-style: none;
display: flex;
margin: 0 auto;
}

#pointer{
background: url("img/pointer.png") no-repeat;
background-size: contain;
width: 35px;
height: 35px;
position:relative;
top:-488px;
left:10px;
}

#MapList {
	z-index: 5; 
	text-align: center;
	display: inline-block;
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

select::-ms-expand {
display: none;
}

nobr {
	font-size: 13px;
}

#item {
	line-height: 25px;
}

#comp_name{
	font-weight: bold;
	font-size: 20px;
}
</style>

<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script> -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>

</head>
<body>
<!-- 주유소검색 -->
	<h3><img src="img/logo/logogasstation.png" style="width: 400px;"></h3><br>
<div>
	<select id="prodcd" >
		<option value="B027">휘발유</option>
		<option value="D047">경유</option>
		<option value="B034">고급휘발유</option>
	</select>
	<select id="radius" >
		<option value="500">0.5km</option>
		<option value="1000" selected>1km</option>
		<option value="2000">2km</option>
	</select>
	<input type="button" class="btn-fill" value="주소찾기" id="jusobtn" onclick="go_post()">
	<input type="text" name="address" style="width: 250px"/>
	<input type="text" name="address" style="width: 100px" />
	<input type="button" style="width:50px;" class="btn-fill" onclick="maps()" value="검색" style="width: 100px; " />
</div>
<br>
<p id = "status" style="display: none;"></p>
<a id = "map-link" target="_blank"></a>
<div id="MapList">
<ul id="map-set">
	<li>
		<div id="popup" style="width: 500px; height: 500px; margin-right: 10px;"></div>
	</li>
	<li>
		<div id="display" style="width: 320px; height:500px; overflow:scroll;"></div>
	</li>
</ul>
<input type="button" id="pointer" onclick="mylocation()" style="z-index: 9999;" />
</div>

<script type="text/javascript">
var x;
var y;
var map;
$(function() {
	mylocation();
	/* $('#prodcd').change(function(){
		mylocation();
	});
	
	$('#radius').change(function(){
		mylocation();
	}); */
	
});

$(document).on('change', '#prodcd', function(){
	mylocation();
}).on('change', '#radius', function(){
	mylocation();
});

				
function mylocation() {
	console.log()
		const status = document.querySelector('#status');
		const mapLink = document.querySelector('#map-link');
			  mapLink.href = '';
			  mapLink.textContent = '';
	 //현재 내위치 받아오기
	  function success(position) {
		const latitude  = position.coords.latitude;
		const longitude = position.coords.longitude;
			//status.textContent = '';
			//mapLink.href = `https://www.openstreetmap.org/#map=18/${latitude}/${longitude}`;
			//mapLink.textContent = `Latitude: ${latitude} °, Longitude: ${longitude} °`;
				x= latitude;
				y = longitude;
				maps();
						
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
				
				
	
	//현재 위치로 확대하기
	function maps() {
		//alert(x);
		//alert(y);
		var myLatLng = {lat: x , lng: y};
	     map = new google.maps.Map(document.getElementById('popup'), {
	          center: myLatLng,
	          zoom: 15
	        });
	  		 if(x!=null&&y!=null){
		 Oil();
			 }
	}
	
	
	function Oil(){
		var oil = new Object(); 
			oil.prodcd = $('#prodcd').val();
			oil.x = x;
			oil.y = y;
			oil.radius = $('#radius').val();
		 $.ajax({
			  data: JSON.stringify(oil),
		      contentType: 'application/json', //보내는 데이터 형식
		      type: "post", //json으로 보낼때 필수
		      url: 'oillist.oi',
		      success: function(data){
		    	  console.log(data);
	  		var tag = "";
	  		/* var oil_code = $('#prodcd').val();
			if(oil_code==){
				
			}else if(oil_code==){
				
			} */
// 	  		MarkerOptions makerOptions = new MarkerOptions();
	  		 
			$(data).each( function(idx, item){
				var oilcomp = item.oil_code;
				var mark_x = Number(item.gis_x);
				var mark_y = Number(item.gis_y);
				var name = item.comp_name;
				mark(mark_x,mark_y,name);
				//mark(mark_x,mark_y,name);
				//console.log(oilcomp);
				tag += '<div id="item" style="background: none; height: 50px; margin-top:10px; margin-bottom: 5px;">';
		       if(oilcomp == "SKE"){
		        	tag += '<img src="img/200sk.png" style="width: 50px; height: 50px; margin-right:10px; float: left; ">'; 
		        }else if(oilcomp == "GSC"){
		        	tag += '<img src="img/200gs.png" style="width: 50px; height: 50px; margin-right:10px; float: left;">';
		        }else if(oilcomp == "HDO"){
		        	tag += '<img src="img/200hd.png" style="width: 50px; height: 50px; margin-right:10px; float: left;">';
		        }else if(oilcomp == "SOL"){
		        	tag += '<img src="img/200soil.png" style="width: 50px; height: 50px; margin-right:10px; float: left;">';
		        }else {
		        	tag += '<img src="img/200ad.png" style="width: 50px; height: 50px; margin-right:10px; float: left;">';
		        }
				//tag += '<img src="img/ske.png" style="width: 50px; height: 50px; margin-right:10px; float: left;">';
				tag += '<div id="comp_name" style="width: 300px; margin-bottom:3px; white-space:nowrap;"><nobr>'+item.comp_name+'<nobr></div>';
				tag += '<div id="oil_price">'+item.oil_price+'원'+'&nbsp&nbsp&nbsp&nbsp'+$('#prodcd option:selected').text()+'</div></div>';
			
				
			});		
					
			tag += '</select>';
			$('#display').html(tag);	
		    },
		      error: function( req ){
		          alert(req.status);
			}
		 });
}

	//마커 만들기
	function mark(mark_x,mark_y,name) {
		var myIcon = new google.maps.MarkerImage("img/mark2.png", null, null, null, new google.maps.Size(20,20));

		var myLatLng = {lat: mark_x , lng: mark_y};
		var marker = new google.maps.Marker({
	         map: map,
	         position: myLatLng,
	         icon: myIcon,
	         title: name
	       });

		
		
}
	
	//다음 api 주소 받아오기
	function go_post() {
		$('[name=post]').val("");
		new daum.Postcode({
			oncomplete : function(data) {
				//console.log(data);
				var address, post;
				//사용자의 선택 : userSelectedType(J/R)
				 

				//지번주소	: 주소 jibunAddress
				if (data.userSelectedType == 'J') {
					address = data.jibunAddress;
					post = data.postcode;

				} else {
					//도로명 주소	: 주소 roadAddress		        
					post = data.zonecode;
					//zonecode : 도로명 우편번호
					address = data.roadAddress;
					var extra = '';
					//bname : 법정동명
					if (data.bname != '') {extra = data.bname;}
					//buildingNamge : 건물이름
					if (data.buildingNamge != '') {extra += (extra == '' ? '' : ',')+ data.buildingName;}
					if (extra != '') {address += '(' + extra + ')';}
				}
				$('[name=post]').val(post);
				$('[name=address]').eq(0).val(address);
				
				var geocoder = new daum.maps.services.Geocoder();
				geocoder.addressSearch(address, function(result, status) {
		             console.log(result);
		             //console.log(status);
		             // 정상적으로 검색이 완료됐으면 
		             if (status === daum.maps.services.Status.OK) {
		                x = Number(result[0].y);
		                y = Number(result[0].x);
//		                alert(y);
		                $('[name=post]').val(x);
		          }else{
		             alert("위경도 에러")
		          }
		          });	
				
				
				//geo(address);
				
				
		
				//geocoder.addressSearch(post, callback);
				
				
				
			}//oncomplete()
		}).open();

	}	
	

	

</script>



</body>
</html>