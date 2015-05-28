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
	background-color: #56bff7
}
.navbar-collapse {
	padding: 0;
}
.navbar-default .navbar-nav > li > a {
	font-size: 16px;
	color: white;
}
.navbar-default .navbar-nav > li > a:hover,
.navbar-default .navbar-nav > li > a:focus {
	background-color: white;
}

 @media (min-width: 768px){
	.navbar-nav{
	    margin: 0;
	    display: table;
	    table-layout: fixed;
	    float:none;
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
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
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