<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우리의 붕붕이 <tiles:getAsString name="car_title" ignore="true"/></title>
<link rel="icon" type="image/x-icon" href=".../img/space_dog.png">

</head>
<body id="page-top">
<tiles:insertAttribute name="header" />
<div id="wrapper">
<tiles:insertAttribute name="leftmenu" />
<tiles:insertAttribute name="content" />
<tiles:insertAttribute name="footer" />
</div>
</body>
</html>
