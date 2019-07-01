<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
	.hover:hover{
		cursor: pointer;
		text-decoration: underline;
	}
	.write_btn {
   color: black;
   border: 0.3px solid black;
   background: #c9d6de;
   padding: 3px 10px;
   margin-left: 5px;
}

.write_btn:hover {
   color: white;
   background: #1e2022;
   padding: 3px 10px;
   text-decoration: underline;
}
</style>

<div id="content-wrapper">
	<h2 style="text-align: center; margin-top:10px; margin-bottom:10px;"><img style="width: 400px;" src="<c:url value='/img/adminnotice.png' />" /></h2>
      <div class="container-fluid">
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            공지사항 리스트입니다.</div>
          <div class="card-body">
            <div class="table-responsive">
            <a style="float:right;"class="write_btn hover" onclick="location='notifynew'">글쓰기</a>
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              
                <thead>
                  <tr>
                    <th style="width: 10%;">번호</th>
                    <th style="width: 65%;">제목</th>
                    <th style="width: 15%;">작성일</th>
                    <th style="width: 10%;">조회수</th>
                  </tr>
                </thead>
                <tbody>
	                <c:forEach items="${resultList }" var="model" varStatus="c">
                		<tr>
	                    <td>${model.no }</td>
	                    <td class="hover" onclick="location='notifydetail?notify_id=${model.notify_id}'">${model.notify_title }</td>
	                    <td>${model.notify_date}</td>
	                    <td>${model.readcnt}</td>
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