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
.navbar-default {
	background-color: #56bff7;
	margin-bottom: 0;
}
.navbar-collapse {
	padding: 0;
}
.navbar-default .navbar-nav > li > a {
	font-size: 15px;
	color: white;
}
.navbar-default .navbar-nav > li > a:hover,
.navbar-default .navbar-nav > li > a:focus {
	background-color: #e7e7e7;
}

.navbar-nav > li > a {
    padding-top:8px !important; 
    padding-bottom:0 !important;
    height: 35px;
}
.navbar {
	min-height:35px !important;
}

.navbar-nav{
	    margin: 0;
}
.navbar-toggle {
	border: 2px solid #e7e7e7;
	padding: 0px 10px;
	margin-top: 2px;
	margin-bottom: 2px;
    height: 30px;
}
.pageClass {
	width: 50%;
	padding-top: 8px;
	margin-top: 0px;
	margin-left: 5px;
	float: left;
	border: 0;
	color: white;
}
.navbar-default .pageClass:hover,
.navbar-default .pageClass:focus {
	background-color: #56bff7;
}
.navbar-default .navbar-toggle .icon-bar {
	background-color: #cccccc;
}

.navbar-header {
	min-height:35px !important;
}

 @media (min-width: 768px){
	.navbar-nav{
	    margin: 0;
	    display: table;
	    table-layout: fixed;
	    float: none;
	    width: 100%;
	}
	.navbar-nav > li {
	    width: 16.6%;
	  } 
}
.navbar-nav > li {
    text-align: center;
  } 
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
<script type="text/javascript" src="maplocation.js"></script>
<script type="text/javascript" src="search.js"></script>
<script type="text/javascript" src="searchDetail.js"></script>
<script type="text/javascript" src="weather.js"></script>
<script type="text/javascript" src="weatherResult.js"></script>
<script type="text/javascript" src="template.js"></script>


<title>main.jsp</title>

</head>

<body data-ng-controller="mainController">

	<div class="container">
		<div align="center" style="background-image:url('mainImage/윗배경.png'); background-size:cover; background-repeat:no-repeat;">
		<a href="#home"><img src="mainImage/제목.png" style="width:100%; height:auto;max-width: 720px; max-height: 120px;"></a>
<!--         	<div class="pull-right"> -->
<!--         		<a style="margin-right: 10px;" href="#search" ng-model="radioModel" btn-radio="'키워드검색'" uncheckable><span class="glyphicon glyphicon-search"></span></a> -->
<!-- 				<a href="#login" class="btn btn-default" data-ng-if="loginResult.loginStatus==null || loginResult.loginStatus==false">로그인</a> -->
<!-- 				<a data-ng-click="logout()" class="btn btn-default" data-ng-if="loginResult.loginStatus==true">로그아웃</a> -->
<!-- 			</div> -->
		</div>
		
<!-- 		<div class="navbar-mobile btn-group btn-group-justified" class="dropdown"> -->
<!-- 			<a href="#event" class="btn btn-info" ng-model="radioModel" btn-radio="'행사'" uncheckable>행사</a> -->
<!-- 			<a href="#local" class="btn btn-info" ng-model="radioModel" btn-radio="'지역별검색'" uncheckable>지역별검색</a> -->
<!-- 			<a href="#map" class="btn btn-info" ng-model="radioModel" btn-radio="'지도검색'" uncheckable>지도검색</a> -->
<!-- 			<a href="#maplocation" class="btn btn-info" ng-model="radioModel" btn-radio="'주변검색'" uncheckable>주변검색</a> -->
<!-- 			<a href="#weather" class="btn btn-info" ng-model="radioModel" btn-radio="'날씨'" uncheckable>날씨</a> -->
<!-- 		</div> -->
		
		 <nav class="navbar navbar-default">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" ng-model="toggle">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <div class="navbar-toggle pageClass">{{nowPage}}</div>
		    </div>
		    <div class="collapse navbar-collapse" id="myNavbar">
		      <ul class="nav navbar-nav">
		        <li><a href="#event">행사</a></li>
		        <li><a href="#local">지역별검색</a></li>
		        <li><a href="#map">지도검색</a></li>
		        <li><a href="#maplocation">주변검색</a></li>
		        <li><a href="#search">키워드검색</a></li>
		        <li><a href="#weather">날씨</a></li>
		      </ul>
		    </div>
		</nav>
	</div>

	<div class="page {{ pageClass }}" data-ng-view
									  data-ng-swipe-left="swipeLeft()"
									  data-ng-swipe-right="swipeRight()"
									  >
	<!-- default page = home -->
	</div>
		
</body>
</html>