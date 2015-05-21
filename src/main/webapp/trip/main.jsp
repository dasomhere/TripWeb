<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>
<!DOCTYPE html>
<html data-ng-app="tourApp">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1.0">

<c:url var="jquery" value="/node_modules/jquery/dist"/>
<c:url var="bootstrap" value="/node_modules/bootstrap/dist"/>
<c:url var="angular" value="/node_modules/angular"/>
<c:url var="angularSanitize" value="/node_modules/angular-sanitize"/>
<c:url var="angularAnimate" value="/node_modules/angular-animate"/>
<c:url var="angularRoute" value="/node_modules/angular-route"/>
<c:url var="angularBootstrap" value="/node_modules/angular-bootstrap/dist"/>
<c:url var="ngmap" value="/node_modules/ngmap/build/scripts"/>

<c:url var="font" value="/css/font.css"/>

<link rel="stylesheet" href="${bootstrap}/css/bootstrap.min.css"/>

<script type="text/javascript" src="${jquery}/jquery.min.js"></script>
<script type="text/javascript" src="${bootstrap}/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${angular}/angular.min.js"></script>
<script type="text/javascript" src="${angularSanitize}/angular-sanitize.min.js"></script>
<script type="text/javascript" src="${angularAnimate}/angular-animate.min.js"></script>
<script type="text/javascript" src="${angularRoute}/angular-route.min.js"></script>
<script type="text/javascript" src="${angularBootstrap}/ui-bootstrap.min.js"></script>
<script type="text/javascript" src="${angularBootstrap}/ui-bootstrap-tpls.min.js"></script>

<script type="text/javascript" src="${ngmap}/ng-map.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?region=KR"></script>

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
<script type="text/javascript" src="join.js"></script>
<script type="text/javascript" src="load.js"></script>
<script type="text/javascript" src="local.js"></script>
<script type="text/javascript" src="login.js"></script>
<script type="text/javascript" src="map.js"></script>
<script type="text/javascript" src="search.js"></script>
<script type="text/javascript" src="searchDetail.js"></script>
<script type="text/javascript" src="weather.js"></script>
<script type="text/javascript" src="weatherResult.js"></script>
<script type="text/javascript" src="template.js"></script>


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
			<a href="#event" class="btn btn-info" ng-model="radioModel" btn-radio="'행사'" uncheckable>행사</a>
			<a href="#local" class="btn btn-info" ng-model="radioModel" btn-radio="'관광지'" uncheckable>관광지</a>
			<a href="#load" class="btn btn-info" ng-model="radioModel" btn-radio="'추천 코스'" uncheckable>추천 코스</a>
			<a href="#map" class="btn btn-info" ng-model="radioModel" btn-radio="'지도검색'" uncheckable>지도검색</a>
			<a href="#weather" class="btn btn-info" ng-model="radioModel" btn-radio="'날씨'" uncheckable>날씨</a>
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