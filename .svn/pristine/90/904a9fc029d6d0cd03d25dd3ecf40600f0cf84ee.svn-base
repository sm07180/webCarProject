<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<head>
<script type="text/javascript">
   $(document).on("pageload", function(){
      window.location.reload(true);
   });
</script>
<style>
table {
   margin: 0 auto;
}

table.type09 {
   width: 70%;
   border-collapse: collapse;
   text-align: center;
   line-height: 1.5;
}

table.type09 thead th {
   padding: 10px;
   font-weight: bold;
   vertical-align: top;
   color: #369;
   border-bottom: 2px solid #036;
}

table.type09 tbody th {
   width: 1300px;
   padding: 10px;
   font-weight: bold;
   vertical-align: top;
   border-bottom: 1px solid #ccc;
   background: #f3f6f7;
}

table.type09 td {
   width: 250px;
   padding: 10px;
   vertical-align: top;
   border-bottom: 1px solid #ccc;
}

a {
   cursor: pointer;
   font-size: 13px;
   display: inline-block;
}

.search {
   width: 20px;
   height: 20px;
}

#button {
   float: right;
}

.write_btn {
   margin-left: 800px;
   color: black;
   border: 0.3px solid black;
   background: #c9d6de;
   padding: 10px 20px;
}

.write_btn:hover {
   color: white;
   background: #1e2022;
   padding: 10px 20px;
}

</style>

<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" >
<title>자유게시판</title>
</head>
<body>
<h3><img src="img/logo/logoboard.png"></h3><br>
<form action="list.bo" method="get">
<p id="list-top">
   <span style="display:flex; margin-left: 33%; ">
    <select name="search" style="height:24px; width:80px; margin-right:5px;">
         <option value="all" ${page.search eq 'all' ? 'selected' : '' }> 전체 </option>
         <option value="board_title" ${page.search eq 'board_title' ? 'selected' : '' }> 제목</option>
         <option value="user_id" ${page.search eq 'user_id' ? 'selected' : '' }> 작성자 </option>
         <option value="board_content" ${page.search eq 'board_content' ? 'selected' : '' }>내용</option>
      </select>
      <input name="keyword" type="text" value="${page.keyword }"
      style="margin-top:0; margin-right:5px; vertical-align:middle; height:20px; width:350px;" />
      <a onclick="$('form').submit()"><img class="search" src="img/search.png"></a>
   </span>
   <!-- 로그인 했을 시에만  -->
   <br>
   <c:if test="${!empty login_info}">
   <a class="write_btn" onclick="location='insert.bo'">글쓰기</a>
   </c:if>
</p>
<input type="hidden" name="curPage" />
</form>


<br>
<br>
<table style="width:70%;"class="type09">
    <thead>
    <tr>
        <th scope="col" style="width:30px;">번호</th>
        <th scope="col" style="width:1000px;">제목</th>
        <th scope="col" style="width:50px;">작성자</th>
        <th scope="col" style="width:100px;">작성일</th>
        <th scope="col" style="width:50px;">조회수</th>
        <th scope="col" style="width:50px;">좋아요</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list }" var="vo">
    <tr>
        <td>${vo.no }</td>
        <td>
        <a onclick="location='detail.bo?read=1&board_id=${vo.board_id}'">${vo.board_title }</a>
        </td>
        <td>${vo.user_name }</td>
        <td>${vo.board_date }</td>
        <td>${vo.readcnt }</td>
        <td>${vo.sympathy }</td>
    </tr>
  
    </c:forEach>
    </tbody>
</table><br>
<div style="text-align:center;"><jsp:include page="/WEB-INF/views/include/page.jsp"/></div>

</body>
</html>