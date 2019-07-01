<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
	.hover:hover{
		cursor: pointer;
		text-decoration: underline;
	}
</style>
</head>


<div id="content-wrapper">
<h2 style="text-align: center; margin-top:10px; margin-bottom:10px;"><img style="width: 400px;" src="<c:url value='/img/adminadmin.png' />" /></h2>
		<div class="container-fluid">
			<div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            ${user_id}님의 작성글 목록</div>
          <div class="card-body">
            <div class="table-responsive">
            <a style="float:right;"class="write_btn" onclick="location='notifynew'">글쓰기</a>
			<table class="table table-bordered" width="100%"
				cellspacing="0" id="dataTable">
				<thead>
					<tr>
						<th style="width: 10%">번호</th>
						<th style="width: 10%">구분</th>
						<th style="width: 45%">제목</th>
						<th style="width: 25%">작성일</th>
						<th style="width: 10%">조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${writeList}" var="vo">
                		<tr>
						<td>${vo.write_id}</td>
						<td>${vo.gubun}</td>
						<td class="hover" onclick="location='writeDetail?write_id=${vo.write_id}&title_name=${vo.title_name}'">${vo.title}</td>
						<td>${vo.write_date}</td>
						<td>${vo.readcnt}</td>
					</tr>
	                  
                	</c:forEach>
				
					
				</tbody>
			</table>
 </div>
          </div>
          <div class="card-footer small text-muted"></div>
        </div>

        <p class="small text-center text-muted my-5">
          <em></em>
        </p>

      </div>
      <!-- /.container-fluid -->

      

    </div>