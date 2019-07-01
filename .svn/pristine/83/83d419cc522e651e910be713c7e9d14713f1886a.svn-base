<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">

</script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>

table{
	margin: 0 auto;
	text-align: center;
	border: 1px solid #52616a;
	border-collapse: collapse;
	width: 70%;
	border-left:none;
	border-right:none;
	border-top:2px solid #52616a;
	border-bottom:2px solid #52616a;
}

table th, table td{
	border: 1px solid #52616a;
	padding: 10px 20px;
	border-left:none;
	border-right:none;
	}


table th {
	background: rgba(201,214,222,0.3);
}


.button{
	color:black;
	border: 0.3px solid black;
	background: #c9d6de;
	padding: 10px 20px;
}

.button:hover {
	color:white;
	background: #1e2022;
	padding: 10px 20px;
}

.content{
	padding : 50px;
}
	/* #user_div, #date_div{
		display: inline;
		float: right;
	}
	
	#user_div{
		margin-right:70px;
	}
	#date_div{margin-right:180px;}
	#title_div{
		text-align: center;
	}
	#content_div{
		text-align: center;	
		margin-top:50px;
	}
	 #divider2{
	 	width:900px;
	 	margin:0 auto;
		clear:both;
		border:1px solid #52616a;
	} 
	#button{
		text-align: right;
		margin-right: 180px;
	}
	a{
		cursor: pointer;
	} */
	
</style>
</head>
<body>
<h3><img src="img/logo/logotip.png"></h3><br>
<table>
		<tr>
			<th style="width: 140px;">제목</th>
			<td style="text-align: left" colspan="5">${vo.tt_title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.user_name }</td>
			<th>작성일자</th>
			<td>${vo.tt_date }</td>
			<th>조회수</th>
			<td>${vo.readcnt }</td>
		</tr>
		<tr>
			<td class="content" style="text-align: left" colspan="10">
			${fn:replace(vo.tt_content,enter,'<br/>')}</td>
		</tr>
</table>
<br>
<form action="tiplist.bo" method="post">
	<input type="hidden" name="curPage" value="${page.curPage}"/>
</form>
<a class=button onclick="$('form').submit()">목록으로</a>

<!-- 댓글   -->
<div id="comment_regist" style="text-align:left; margin:0 auto; width:50%;">
<div id="comment_list" style="text-align:left; margin:0 auto; padding:10px; width:100%;">
</div><br>
<!-- <div style="text-align:left;"><p style="text-align: left; margin-bottom:10px;">댓글을 작성해주세요!</p></div> -->
<div style="text-align:right;">
      <a class="button" style="width:20px;" onclick="go_comment_regist()">댓글등록</a></div>
   <br>
   <textarea id="comment" placeholder="댓글을 입력해주세요." style="resize:none; padding:1%; width:99%; 
   height:80px; text-align: left; font-family: nanum;"></textarea>
   
</div>
<script type="text/javascript">
function go_comment_regist(){
	   if(${empty login_info}) {
	      alert("댓글 등록하기위한 로그인 필요;");
	      return;
	   }
	   if($('#comment').val().trim() == '') {
	      alert("등록할 댓글 입력!");
	      $('#comment').val('');
	      $('#comment').focus();
	      return;
	   }
	   
	   $.ajax({
	      type: 'post',
	      url : 'tip/reply/insert',
	      data : {tt_id: ${vo.tt_id}, tt_reply_content: $('#comment').val()},
	      success : function(data){
	         if(data) {
	            $('#comment').val('');
	            alert('댓글이 등록되었습니다!');
	            comment_list();
	         }else{
	            alert("댓글 등록 실패!");
	         }
	      },
	      error: function(req){
	         alert(req.status);
	      }
	   });
	}

	$(function(){
	   comment_list();
	});

	function comment_list() {
	   $.ajax({
	      url: 'tip/reply_list/${vo.tt_id}',
	      success: function(data){
	         //console.log(data);
	         $('#comment_list').html(data);
	      },
	      error: function(req){
	         alert(req.status);
	      }
	   });
	}
</script>
</body>
</html>