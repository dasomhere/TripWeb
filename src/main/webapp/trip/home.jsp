<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>


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

<section style="background-color: #e3fcfe; height: 100%">

	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<img alt="titleboackground" src="mainImage/제목.jpg"/>
			</div>
		</div>

		<table>
			<tr valign="bottom">
				<td><img alt="leftdownImage" src="mainImage/왼쪽위.jpg"/></td>
				<td rowspan="2"><img alt="middlemap" src="mainImage/중앙.jpg"/></td>
				<td><img alt="rightupImage" src="mainImage/오른쪽위.jpg"/></td>
			</tr>
			
			<tr valign="top">
				<td><img alt="leftupImage" src="mainImage/왼쪽아래.jpg"/></td>
				<td><img alt="rightdownImage" src="mainImage/오른쪽아래.jpg"/></td>
			</tr>
			
		</table>
		
		<br><br>
		
		<div class="row"  >
			<div style="position: relative; right: -15px; top: -40px;" >
				<img alt="titleboackground" src="mainImage/아래.jpg"/>
			</div>
		</div>
		
		<div class="row" style="width: 90%; position: relative; right: -10px; top: -200px;" align="center" >
			<div class="col-xs-2">
				<a href="#event" ><img alt="icon_event" src="Icon/행사&축제.png"/></a>
			</div>
			
			<div class="col-xs-2">
				<a href="#local"><img alt="icon_tour" src="Icon/지역별.png"/></a>
			</div>
			
			<div class="col-xs-2">
				<a href="#map"><img alt="icon_bestcourse" src="Icon/지도검색.png"/></a>
			</div>
			
			<div class="col-xs-2">
				<a href="#maplocation"><img alt="icon_searchmap" src="Icon/주변검색.png"/></a>
			</div>
			
			<div class="col-xs-2">
				<a style="margin-right: 10px;" href="#search"><img alt="icon_searchkeyword" src="Icon/키워드.png"/></a>
			</div>
			
			<div class="col-xs-2">
				<a href="#weather"><img alt="icon_weather" src="Icon/날씨.png"/></a>
			</div>
		</div>
	</div>
</section>

