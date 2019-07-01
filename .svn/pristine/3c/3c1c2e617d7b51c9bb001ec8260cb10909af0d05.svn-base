<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="css/signup.css" /> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
<script src="js/join_check.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">

function validate(tag){
	var data=$('[name='+tag+']').val();
	if(tag=='user_id'){
		data=join.id_status(data);
	}else if(tag=='user_pw'){
		data=join.pw_status(data);
	}else if(tag=='user_pw_ck'){
		data=join.pw_ck_status(data);
	}
	$('#' + tag + '_status').text(data.desc);
	$('#' + tag + '_status').removeClass( 'valid invalid' );
	$('#' + tag + '_status').addClass( data.code=='valid' ? 'valid':'invalid' );
	return data;
}
function usable(){
	var result = validate('user_id');
	/* console.log(result); */
	if(result.code != 'valid'){
		alert(result.desc);
		return;
	}
	
	$.ajax({
		type: 'post',
		url: 'id_check',
		data: {user_id: $('[name=user_id]').val()},
		success: function(data){
			 /* console.log(data);  */
			data=join.id_usable(data);
			$('#id_check').val(data.code);
			console.log(data.code); 
			$('#user_id_status').text(data.desc);
			console.log(data.desc);
			$('#user_id_status').removeClass('valid invalid');
			$('#user_id_status').addClass( 
				data.code=='usable' ? 'valid' : 'invalid' );		
		},
		error: function(req){
			alert(req.status);
		}
	});
}
</script>
<style type="text/css">
.type05{
 margin: auto;
}

table.type05 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 20px 10px;
}
table.type05 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #efefef;
}
table.type05 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}


#img{
	width: 100px;
	height: 100px;
	border: 0;
}

form {
	margin: 0 auto;
	width: 700px;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}


</style>

</head>
<body>
<div id="title2"><h3>회원정보수정</h3></div><br>
<div style="margin:0 auto;"id="divider"></div>
<div id="content">
	<form action="go_update.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="user_id" value="${login_info.user_id}"></input>
<table class="type05" style="margin: auto; margin-top:10px;">
    <tr>
        <th scope="row">아이디</th>
        <td>${login_info.user_id}</td>
    </tr>
    <tr>
    	<th scope="row">현재 비밀번호</th>
    	<td>
			<input class="pw_input" type="password" id="now_user_pw1" style="width: 220px;"/>
			<input id="now_user_pw2" type="hidden" value="${login_info.user_pw}" />
		</td>
    </tr>
    <tr>
        <th scope="row">새 비밀번호</th>
        <td><input style="text-align:left; width: 220px;" class="pw_input" type="password" name="user_pw" onkeyup="validate('user_pw')" />
        	<div id="user_pw_status" class="valid">비밀번호를 입력하세요.(영문 대/소문자 숫자를 모두 포함)</div>
        </td>
        
    </tr>
    <tr>
        <th scope="row">새 비밀번호 확인</th>
        <td><input style="text-align:left; width: 220px;"  class="pwck_input" type="password" name="user_pw_ck" onkeyup="validate('user_pw_ck')" />
        	<div id="user_pw_ck_status" class="valid">비밀번호를 다시 입력하세요</div>  
        </td>
    </tr>
    <tr>
        <th scope="row">이름</th>
        <td><input style="text-align:left; width: 220px;" class="name_input" type="text" name="user_name" value="${login_info.user_name}" /></td>
    </tr>
    <tr>
        <th scope="row">전화번호</th>
        <td><input style="width: 63px;" type="number" name="phone" maxlength="3" class="phone_input" oninput="maxLengthCheck(this)" value="${fn:substring(login_info.phone,0,3) }"/>-
		<input style="width: 63px;" type="number" name="phone" maxlength="4" class="phone_input" oninput="maxLengthCheck(this)" value="${fn:substring(login_info.phone,4,8) }"/>-
		<input style="width: 63px;" type="number" name="phone" maxlength="4" class="phone_input" oninput="maxLengthCheck(this)" value="${fn:substring(login_info.phone,9,13) }"/>
		</td>
    </tr>
    <tr>
        <th scope="row">차 종류</th>
        <td>
	
		<select id="comp_id" name="comp_id" style="height: 24px; width: 110px; margin-right: 5px; margin:0 auto;">
			<c:forEach items="${carlist}" var="vo">
				<option value="${vo.comp_id}"${vo.comp_id eq 'kia' ? 'selected' : '' }>${vo.comp_id}</option>			
			</c:forEach>
		</select>
		<select id="car_name" name="car_name" style="height: 24px; width: 110px; /* margin-left: 10px;  */margin:0 auto;">
			
		</select>
	
		</td>
    </tr>
    <tr>
        <th scope="row">car mileage</th>
        <td><input style="text-align:left; width: 220px;" id="car_mileage" class="mileage_input" type="number" name="car_mileage" value="${login_info.car_mileage }" /></td>
    </tr>
    <tr>
        <th scope="row">차 닉네임</th>
        <td><input style="text-align:left; width: 220px;" id="car_nickname" class="nickname_input" type="text" name="car_nickname" value="${login_info.car_nickname }" /></td>
    </tr>
    <tr>
    	<th scope="row">이미지 선택</th>
    	<td>
    		<c:if test="${!empty login_info.car_mimage }">
    			<img id="img" src='${login_info.car_mimage}'/>
    		</c:if>
    		
			<label id="imgtd">
				<input style="margin-left:150px; margin-top:20px;" id="attach-file" class="img_input" type="file" name="attach_file" />
			</label>
    	</td>
    </tr>
</table>
	
	<br>
	<br>
	 <!-- <input type="submit" value="test"/> --> 
	<div id="button_section">
	<a class="btn-fill" onclick="go_update()">회원정보수정</a> 
	<a class="btn-fill" onclick="if(confirm('삭제하시겠습니까?')){location='delete.do?user_id=${login_info.user_id}'}">회원탈퇴</a>
	<a class="btn-fill" style="width: 50px;" onclick="history.go(-1)">취소</a></div>
	

<input type="hidden" id="id_check" value="n" />
	</form>
</div>
<script type="text/javascript">

$(function() {
	car_name();

});

var sel_file;

$(document).on('change','#comp_id',function(){
	$('.name_option').remove();
	car_name();
	
});

$(function () {
	$('#attach-file').on('change',handleImgFileSelect);

});

function handleImgFileSelect(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	$('#img').remove();
	
	filesArr.forEach(function(f){
		
		if(!f.type.match("image.*")){
			alert("이미지파일만 업로드가능합니다.");
			$('#attach-file').val('');
			$('#file-name').html('');
			$('#img').val('');
			return;
		}else{
			
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e){
				var tag = '<img id="img" />';
				$('#imgtd').before(tag);
				$('#img').attr("src",e.target.result);
			}
			reader.readAsDataURL(sel_file);
		}
		
		
	});
}

function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }    
  }
  
function car_name(){
	$('#input6').css('display','inline');
	$.ajax({
		url:'carName?comp_id='+$('#comp_id').val()+'',
		type : 'post',
		success:function(data){
			var tag = '';
			$(data).each(function (idx,data){
				tag+='<option class="name_option" value="'+data.car_name+'">'+data.car_name+'</option>';
			});
			$('#car_name').html(tag);
		},
		error: function(req){
			alert(req.status)
		}
	});
}

function go_update(){
	// 비밀번호 
	if( ! item_check( 'user_pw' ) ) return;
	// 비밀번호 확인
	if( ! item_check( 'user_pw_ck' ) )return;
	
	if($('#now_user_pw1').val()!=$('#now_user_pw2').val()){
		alert('현재비밀번호를 정확하게 입력해주세요');
	}else{
		$('form').submit();
	}
}

function item_check(item){
	var data=validate(item);
	if(data.code != 'valid'){
		alert(data.desc);
		$('name='+item+']').focus();
		return false;
	}else{
		return true;
	}
}
</script>
</body>
</html>