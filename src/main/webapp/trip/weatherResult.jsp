<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>
<section class="container">

<h1>{{weather.cityName}}</h1>

<table style="width: 100%;">
	<tr>
		<td rowspan="4" align="center"><img src="http://l.yimg.com/a/i/us/we/52/{{weather.nowConditionCode}}.gif" style="width: 130px; height: 130px"></td>
		<td>온도 : {{weather.nowTemp}}℃</td>
	</tr>
	<tr>
		<td>습도 : {{weather.nowHumidity}}%</td>
	</tr>
	<tr>
		<td>현재 : {{weather.nowConditionText}}</td>
	</tr>
	<tr>
		<td>바람 : {{weather.nowWindSpeed}}km/h</td>
	</tr>
	
	<tr><td colspan="2" style="padding-top: 10px">
	<table style="width: 100%;">
		<tr>
			<td align="center"><img src="http://l.yimg.com/a/i/us/we/52/{{weather.code[0]}}.gif"  style="width: 80px; height: 80px"></td>
			<td>오늘({{weather.day[0]}})</td>
			<td><font color="blue">▼최저기온 : {{weather.low[0]}}℃</font>&nbsp;&nbsp;&nbsp;<font color="red">▲최고기온 : {{weather.high[0]}}</font><br>
			{{weather.text[0]}}</td>
		</tr>
		<c:forEach var="i" begin="1" end="4">
			<tr>
				<td align="center"><img src="http://l.yimg.com/a/i/us/we/52/{{weather.code[${i}]}}.gif"  style="width: 80px; height: 80px"></td>
				<td>{{weather.day[${i}]}}요일</td>
				<td><font color="blue">▼최저기온 : {{weather.low[${i}]}}℃</font>&nbsp;&nbsp;&nbsp;<font color="red">▲최고기온 : {{weather.high[${i}]}}</font><br>
				{{weather.text[${i}]}}</td>
			</tr>
		</c:forEach>
	</table>
	</td></tr>
</table>

</section>