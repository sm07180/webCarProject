<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
	.hover:hover{
		cursor: pointer;
		text-decoration: underline;
	}
</style>

<div id="content-wrapper">
	<h2 style="text-align: center; margin-top:10px; margin-bottom:10px;"><img style="width: 400px;" src="<c:url value='/img/adminadmin.png' />" /></h2>
	<div class="container-fluid">
			
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            회원목록</div>
          <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead style="width: 600px">
                  <tr>
                    <th style="width: 200px">아이디</th>
                    <th>유저닉네임</th>
                    <th style="width: 100px">관리권한부여</th>
                  </tr>
                </thead>
                <tbody>
	                <c:forEach items="${memberlist }" var="vo">
                		<tr>
	                    <td>${vo.user_id }</td>
	                    <td class="hover" onclick="location='rittalDetail?user_id=${vo.user_id}'">${vo.user_name }</td>
	                    <td class="hover" onclick="if(confirm('관리권한 주시겠습니까?')){location='rittalAdmin?user_id=${vo.user_id}&admin=${vo.admin}'}">${vo.admin}</td>
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