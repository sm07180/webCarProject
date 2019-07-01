<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style type="text/css">



#user_id, #user_pw {
	width: 280px;
	height: 30px;
	text-align: left;
	border: none;
	padding: 5px;
}

#user_id {
	margin-bottom: 10px;
}

#user_pw {

}


#kakao {
	margin-top: 10px;
}

#login_btn, #join_btn {
	display:inline-block;
	width:140px;
	height:60px;
	line-height:60px;
	background-color: #c9d6de;
	border: 1px solid #1e2022;
	font-size: 13px;
}

img { vertical-align: middle;  } 

#kakao {
 	border: 1px solid #1e2022; 
}

</style>
</head>
<body>
	<img src="img/loginlogo1.png"><br>
	<p style="color: grey; margin-top: 10px;">환영합니다! 로그인 후 더 다양한 기능을 이용해보세요^^</p><br>
	<div id="login">
		<span><input type="text" placeholder="아이디" id="user_id"  /><br>
			<input onkeypress="if(event.keyCode==13){go_login()}" 
			type="password" placeholder="비밀번호" id="user_pw" /><br>
		</span> 
		<br>
		<a id="login_btn" onclick="go_login()">
		<img style="width:15px;" src="img/login.png" /> 로그인</a>
		<a id="join_btn"onclick="location='signup.do'">
		<img style="width:15px;" src="img/join.png" />회원가입</a><br>
		<input style="width: 285px; height: 50px; margin-left: 3px;" type="image" id="kakao" src="img/kakao3.png" onclick="ktlogin()" />
		<br>
		<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark" style="text-align: center; display: inline-block; height: 50px; width: 285px; margin-top: 3px; color: black;"></div>
	</div>
	
	<script type='text/javascript'>

		function go_login() {
			$.ajax({
				type : 'post',
				url : 'login',
				data : {
					user_id : $('#user_id').val(),
					user_pw : $('#user_pw').val(),
				},
				success : function(data) {
					if (data) {
						location.href = "home";
					} else {
						alert("아이디나 비밀번호가 일치하지 않습니다!");
						$('#user_id').val('');
						$('#user_pw').val('');
						$('#user_id').focus();
					}
				},
				error : function(req) {
					alert(req.status);
				}
			});
		}
	</script>
	
	
    <script>
    function ktlogin() {
		Kakao.init('2c7c27aa4123b54933137a9f8ea776f0');
		Kakao.Auth.loginForm({
			success : function(authObj) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(res) {
						 $.ajax({
								type : 'post',
								url : 'ktlogin',
								data : {
									user_id : res.id,
									user_pw : 'asgsfdqas',
									user_name : res.properties.nickname,
									phone : '010-1111-1111'
								},
								success : function(data) {
									location.href = "home";
								},
								error : function(req) {
									alert(req.status);
								}
							});
					},
					fail : function(err) {
						alert(JSON.stringify(err));
					}
				});
			},

			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
	}
      function onSignIn(googleUser) {
        var profile = googleUser.getBasicProfile(); 
        
        var auth2 = gapi.auth2.getAuthInstance();

        $.ajax({
			type : 'post',
			url : 'ktlogin',
			data : {
				user_id : profile.getId(),
				user_pw : 'asgsfdqas',
				user_name : profile.getName(),
				phone : '010-1111-1111'
			},
			success : function(data) {
				location.href = "home";
			},
			error : function(req) {
				alert(req.status);
			}
		});
        
        var auth2 = gapi.auth2.getAuthInstance();
		auth2.disconnect();
        
      }
    </script>

</body>


</html>