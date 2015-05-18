<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>

<head>
	<style type="text/css">
 		section { 
  			background-image: url({{weatherImageChange()}}); 
 			background-size: cover; 
 			height: 600px; 
 		}
 		
 		#weatherbox {
 			background-color: rgba(255, 255, 255, 0.4);
 			border-radius: 10px;
 			padding: 10px;
 		}
	</style>

</head>

<section class="container">

<h3>{{city}}</h3>

<div id="weatherbox">
	<h5>현재 날씨</h5>
	<div class="row">
			<div class="col-xs-6" align="right"><img src="http://l.yimg.com/a/i/us/we/52/{{weather.item.condition.code}}.gif" style="width: 110px; height: 110px"/></div>
			<div class="col-xs-6">
				온도 : {{(weather.item.condition.temp-32)/1.8 | number:1}}<br><br>
				습도 : {{weather.atmosphere.humidity}}%<br><br>
				현재 : {{convertConditionCode(weather.item.condition.code)}}<br><br>
				바람 : {{weather.wind.speed}}m/h
			</div>
	</div>
	
	<h5>주간 날씨</h5>
	<div class="row">
		<div class="col-xs-3"><img src="http://l.yimg.com/a/i/us/we/52/{{weather.item.forecast[0].code}}.gif" style="width: 60px; height: 60px;"/></div>
		<div class="col-xs-3">오늘({{convertDay(weather.item.forecast[0].day)}})</div>
		<div class="col-xs-6">
			<div class="row">
				<div class="col-xs-6"><font color="blue">▼ {{(weather.item.forecast[0].low-32)/1.8 | number:1}}℃</font></div>
				<div class="col-xs-6"><font color="red">▲ {{(weather.item.forecast[0].high-32)/1.8 | number:1}}℃</font></div>
		 		<div class="col-xs-12">{{convertConditionCode(weather.item.forecast[0].code)}}</div>
		 	</div>
	 	</div>
	</div>
	
	<c:forEach var="i" begin="1" end="4">
		<div class="row">
			<div class="col-xs-3"><img src="http://l.yimg.com/a/i/us/we/52/{{weather.item.forecast[${i}].code}}.gif" style="width: 60px; height: 60px;"/></div>
			<div class="col-xs-3">{{convertDay(weather.item.forecast[${i}].day)}}요일</div>
			<div class="col-xs-6">
				<div class="row">
					<div class="col-xs-6"><font color="blue">▼ {{(weather.item.forecast[${i}].low-32)/1.8 | number:1}}℃</font></div>
				 	<div class="col-xs-6"><font color="red">▲ {{(weather.item.forecast[${i}].high-32)/1.8 | number:1}}℃</font></div>
					<div class="col-xs-12">{{convertConditionCode(weather.item.forecast[${i}].code)}}</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

</section>