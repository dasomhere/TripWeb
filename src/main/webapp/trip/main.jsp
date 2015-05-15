<%@page import="java.io.InputStream"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html data-ng-app="myApp">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1.0">

<%@include file="/WEB-INF/taglib.jspf" %>

<c:url var="jquery" value="/node_modules/jquery/dist"/>
<c:url var="bootstrap" value="/node_modules/bootstrap/dist"/>
<c:url var="angular" value="/node_modules/angular"/>
<c:url var="angularSanitize" value="/node_modules/angular-sanitize"/>
<c:url var="angularAnimate" value="/node_modules/angular-animate"/>
<c:url var="angularRoute" value="/node_modules/angular-route"/>

<c:url var="font" value="/css/font.css"/>

<link rel="stylesheet" href="${bootstrap}/css/bootstrap.min.css"/>

<script type="text/javascript" src="${jquery}/jquery.min.js"></script>
<script type="text/javascript" src="${bootstrap}/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${angular}/angular.min.js"></script>

<script type="text/javascript" src="${angularSanitize}/angular-sanitize.min.js"></script>
<script type="text/javascript" src="${angularAnimate}/angular-animate.min.js"></script>
<script type="text/javascript" src="${angularRoute}/angular-route.min.js"></script>

<link rel="stylesheet" type="text/css" href="${font}">

<style type="text/css">
  .navbar-brand-centered {
        position: absolute;
        left: 50%;
        display: block;
        width: 160px;
        text-align: center;
        background-color: #eee;
    }
    .navbar>.container .navbar-brand-centered, 
    .navbar>.container-fluid .navbar-brand-centered {
        margin-left: -80px;
    }

</style>

<link rel="stylesheet" href="style.css"/>
<script type="text/javascript" src="main.js"></script>
<script type="text/javascript" src="event.js"></script>
<script type="text/javascript" src="eventDetail.js"></script>
<script type="text/javascript" src="join.js"></script>
<script type="text/javascript" src="load.js"></script>
<script type="text/javascript" src="loadDetail.js"></script>
<script type="text/javascript" src="local.js"></script>
<script type="text/javascript" src="localDetail.js"></script>
<script type="text/javascript" src="login.js"></script>
<script type="text/javascript" src="search.js"></script>
<script type="text/javascript" src="searchDetail.js"></script>
<script type="text/javascript" src="weather.js"></script>
<script type="text/javascript" src="weatherResult.js"></script>

<title>main.jsp</title>

</head>
	
<body data-ng-controller="mainController">
	<div class="container">
		<div align="center"><a href="#event">TourWeb</a>
        	<div class="pull-right">
        		<a style="margin-right: 10px;" href="#search"><span class="glyphicon glyphicon-search"></span></a>
				<a href="#login" class="btn btn-default" data-ng-if="loginResult.loginStatus==null || loginResult.loginStatus==false">로그인</a>
				<a data-ng-click="logout()" class="btn btn-default" data-ng-if="loginResult.loginStatus==true">로그아웃</a>
			</div>
		</div>
		
		<div class="navbar-mobile btn-group btn-group-justified" class="dropdown">
			<a href="#event" class="btn btn-default">행사</a>
			<a href="#local" class="btn btn-default">관광지</a>
			<a href="#load" class="btn btn-default">추천 코스</a>
			<a href="#weather" class="btn btn-default">날씨</a>
		</div>
		
	</div>
	<div class="page {{ pageClass }}" data-ng-view
									  data-ng-swipe-left="swipeLeft()"
									  data-ng-swipe-right="swipeRight()"
									  >
	<!-- default page = home -->
	</div>
		
</body>
</html>