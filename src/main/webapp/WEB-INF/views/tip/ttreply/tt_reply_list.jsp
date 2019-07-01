<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>

#reply {
	height: 30px;
	margin-top: 10px;
	margin-left: 5px;

}

#reply_text {
	text-align: left;
}

#reply_id {
	text-align: left;
	font-size: 14px;
	font-family: gaeul;
}
hr{
	opacity: 0.5;
}
</style>

<c:forEach items="${list}" var="vo" varStatus="status">
${status.index eq 0 ? '<hr>' : ''}
<%-- <div>${vo.name} [ <fmt:formatDate value="${vo.writedate}" pattern="yyyy-MM-dd hh:mm:ss"/> ] --%>
	<div id="reply"><p id="reply_text"><p id="reply_id">${vo.car_nickname} [ ${vo.tt_reply_date} ]<c:if test="${vo.user_id eq login_info.user_id or login_info.admin eq 'Y'}">
		<span style="float: right; margin-right: 5px;">
			<a style="font-family: nanum;" id="btn-modify-save${vo.tt_reply_id}" onclick="go_modify_save(${vo.tt_reply_id})">수정</a>
			<a style="font-family: nanum;" id="btn-delete-cancel${vo.tt_reply_id}"
								onclick="go_delete_cancel(${vo.tt_reply_id})">삭제</a>
		</span>
	</c:if></p>
	
	</p>
</div>
<div style="text-align: left; font-size: 14px; margin-bottom: 10px; margin-left: 7px;" 
	id="original${vo.tt_reply_id}">${fn: replace(fn: replace(vo.tt_reply_content, lf, '<br/>'), enter, '<br/>')}</div>
<div id="modify${vo.tt_reply_id}" style="display:none;"></div>
<hr>
</c:forEach>

<script type="text/javascript">
function go_delete_cancel(tt_reply_id) {
	//취소버튼 클릭시
	if($('#btn-delete-cancel' + tt_reply_id).text() == '취소') {
		display_mode(tt_reply_id, 'd');
	}else {
		if(confirm('리얼 딜리트?')) {
			$.ajax({
				url: 'tip/reply/delete/' + tt_reply_id,
				success: function() {
					comment_list();
				},
				error: function(req) {
					alert(req.status);
				}
			});
		}
	}
}

function go_modify_save(tt_reply_id) {
	//수정버튼 클릭시
	if($('#btn-modify-save' + tt_reply_id).text() == '수정'){
		//원래 댓글의 내용이 변경할 수 있는 태그에 보여져야 한다.
		var tag = "<textarea id='modify-input"+ tt_reply_id +"' style='margin-top:5px; width:99%; height:40px;'>"
							+ $('#original' + tt_reply_id).html().replace(/<br>/g, '\n') + "</textarea>";
		$('#modify' + tt_reply_id).html(tag);
		display_mode(tt_reply_id, 'm');
	}else{
		var comment = new Object();
		comment.tt_reply_id = tt_reply_id;
		comment.tt_reply_content = $('#modify-input' + tt_reply_id).val();
		
		$.ajax({
			type: 'post',
			url: 'tip/reply/update',
			data: JSON.stringify(comment), //객체를 json 데이터로 만든다
			//보내는 json 데이터에 한글이 있는 경우의 처리
			contentType: 'application/json; charset=utf-8', 
			success: function(data){
				alert("댓글변경" + data);
				comment_list();
			},
			error: function(req){
				alert(req.status);
			}
		});
	}
}

function display_mode(tt_reply_id, mode){
	$('#modify' + tt_reply_id).css('display', mode=='m' ? 'block' : 'none');
	$('#original' + tt_reply_id).css('display', mode=='m' ? 'none' : 'block');
	//수정 -> 저장, 삭제 -> 취소
	$('#btn-modify-save' + tt_reply_id).text(mode=='m' ? '저장' : '수정');
	$('#btn-delete-cancel' + tt_reply_id).text(mode=='m' ? '취소' : '삭제');
}
</script>