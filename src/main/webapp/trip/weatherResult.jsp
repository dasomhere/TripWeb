<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>
<section class="container">

<h1>{{cityName}}</h1>

<table style="width: 100%;">
	<tr>
		<td rowspan="4" align="center"><img src="http://l.yimg.com/a/i/us/we/52/{{weather.item.condition.code}}.gif" style="width: 130px; height: 130px"></td>
		<td>온도 : {{(weather.item.condition.temp-32)/1.8 | number:1}}℃</td>
	</tr>
	<tr>
		<td>습도 : {{weather.atmosphere.humidity}}%</td>
	</tr>
	<tr>
		<td>현재 : {{convertConditionCode(weather.item.condition.code)}}</td>
	</tr>
	<tr>
		<td>바람 : {{weather.wind.speed}}m/h</td>
	</tr>
	
	<tr><td colspan="2" style="padding-top: 10px">
	<table style="width: 100%;">
		<tr>
			<td align="center"><img src="http://l.yimg.com/a/i/us/we/52/{{weather.item.forecast[0].code}}.gif"  style="width: 80px; height: 80px"></td>
			<td>오늘({{convertDay(weather.item.forecast[0].day)}})</td>
<!-- 			<td>오늘({{weather.item.forecast[0].day}})</td> -->
			<td><font color="blue">▼최저기온 : {{(weather.item.forecast[0].low-32)/1.8 | number:1}}℃</font>&nbsp;&nbsp;&nbsp;<font color="red">▲최고기온 : {{(weather.item.forecast[0].high-32)/1.8 | number:1}}</font><br>
			{{convertConditionCode(weather.item.forecast[0].code)}}</td>
		</tr>
		<c:forEach var="i" begin="1" end="4">
			<tr>
				<td align="center"><img src="http://l.yimg.com/a/i/us/we/52/{{weather.item.forecast[${i}].code}}.gif"  style="width: 80px; height: 80px"></td>
				<td>{{convertDay(weather.item.forecast[${i}].day)}}요일</td>
				<td><font color="blue">▼최저기온 : {{(weather.item.forecast[${i}].low-32)/1.8 | number:1}}℃</font>&nbsp;&nbsp;&nbsp;<font color="red">▲최고기온 : {{(weather.item.forecast[${i}].high-32)/1.8 | number:1}}</font><br>
				{{convertConditionCode(weather.item.forecast[${i}].code)}}</td>
			</tr>
		</c:forEach>
	</table>
	</td></tr>
</table>

</section>