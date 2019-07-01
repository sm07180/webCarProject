<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">

</script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
<h3><img src="img/logo/logoboard.png"></h3><br>
<table>
      <tr>
         <th style="width: 140px;">제목</th>
         <td style="text-align: left" colspan="7">${vo.board_title }</td>
      </tr>
      <tr>
         <th>작성자</th>
         <td>${vo.user_name }</td>
         <th>작성일자</th>
         <td>${vo.board_date }</td>
         <th>조회수</th>
         <td>${vo.readcnt }</td>
         <th>좋아요</th>
      <c:if test="${!empty vo.sympathy}"><td><img style="width: 20px;"src="img/sympath/sy.png" onclick="location='sympathy?board_id=${vo.board_id}&sympathy=${vo.sympathy}'"/></td></c:if>
      <c:if test="${empty vo.sympathy}"><td><img style="width: 20px;" src="img/sympath/sn.png" onclick="location='sympathy?board_id=${vo.board_id}&sympathy=${vo.sympathy}'"/></td></c:if>
         
         
      </tr>
      <tr>
         <td class="content" style="text-align: left" colspan="7">
         ${fn:replace(vo.board_content,enter,'<br/>')}</td>
      </tr>
      <tr>
         <th>첨부파일</th>
         <td colspan="10" id="asd" >
         <input type="hidden" id="filename" value="${vo.filename }">
         <img src="${vo.filepath} " id="img" style="width: 300px; display: none;">
         
         </td>
      </tr>
</table>
<br>
<form action="list.bo" method="post">
   <input type="hidden" name="curPage" value="${page.curPage}"/>
</form>
<a class=button onclick="go_list()">목록으로</a>
<c:if test="${login_info.user_id eq vo.user_id }">
<a class=button onclick="location='modify.bo?board_id=${vo.board_id}'">수정</a>
<a class=button onclick="if(confirm('삭제하시겠습니까?')){location='delete.bo?board_id=${vo.board_id}'}">삭제</a>
</c:if><br><br>

<input type="hidden" id="board_id" value="${vo.board_id }">

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
$(function() {
   var name = $('#filename').val();
   var board_id = $('#board_id').val();
   name.indexOf(".");
   name = name.substring(name.indexOf(".")+1);
   var filepath = String($('#filepath').val());
   
   var tag = "";
   if(name=='jpg'||name=='png'||name=='gif'||name=='jpeg'){
      $('#img').css('display','');
   }else{
	   if(name != ""){
		   tag +='<label style="cursor: pointer;"><a onclick=go_download()>'+$('#filename').val()+'<img src="img/load.png" style="width: 18px; vertical-align: center; line-height:20px; margin-bottom:3px; margin-left: 10px;">'+'</a></label>';
	   }
   }
   $('#filename').after(tag);
});

function go_download() {
   var board_id = $('#board_id').val();
   location.href = 'download?board_id='+board_id;

}


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
      url : 'board/reply/insert',
      data : {board_id: ${vo.board_id}, reply_content: $('#comment').val()},
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
      url: 'board/reply_list/${vo.board_id}',
      success: function(data){
         //console.log(data);
         $('#comment_list').html(data);
      },
      error: function(req){
         alert(req.status);
      }
   });
}

function go_list() {
	history.back();
}
</script>
</body>
</html>