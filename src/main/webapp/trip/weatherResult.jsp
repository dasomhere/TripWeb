<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>
<section class="container">

<h1>{{weather.cityName}}</h1>

<table style="border: 1px solid red; width: 100%">
	<tr>
		<td rowspan="4" align="center"><img src="http://l.yimg.com/a/i/us/we/52/{{weather.nowConditionCode}}.gif" style="width: 150px; height: 150px"></td>
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
	<table style="border: 1px solid red; width: 100%">
		<tr>
			<td align="center"><img src="http://l.yimg.com/a/i/us/we/52/{{weather.code[0]}}.gif"  style="width: 80px; height: 80px"></td>
			<td>오늘({{weather.day[0]}})</td>
			<td><font color="blue">▼최저기온 : {{weather.low[0]}}℃</font>&nbsp;&nbsp;&nbsp;<font color="red">▲최고기온 : {{weather.high[0]}}</font><br>
			{{weather.text[0]}}</td>
		</tr>
		<tr>
			<td align="center"><img src="http://l.yimg.com/a/i/us/we/52/{{weather.code[1]}}.gif"  style="width: 80px; height: 80px"></td>
			<td>{{weather.day[1]}}요일</td>
			<td><font color="blue">▼최저기온 : {{weather.low[1]}}℃</font>&nbsp;&nbsp;&nbsp;<font color="red">▲최고기온 : {{weather.high[1]}}</font><br>
			{{weather.text[1]}}</td>
		</tr>
		<tr>
			<td align="center"><img src="http://l.yimg.com/a/i/us/we/52/{{weather.code[2]}}.gif"  style="width: 80px; height: 80px"></td>
			<td>{{weather.day[2]}}요일</td>
			<td><font color="blue">▼최저기온 : {{weather.low[2]}}℃</font>&nbsp;&nbsp;&nbsp;<font color="red">▲최고기온 : {{weather.high[2]}}</font><br>
			{{weather.text[2]}}</td>
		</tr>
		<tr>
			<td align="center"><img src="http://l.yimg.com/a/i/us/we/52/{{weather.code[3]}}.gif"  style="width: 80px; height: 80px"></td>
			<td>{{weather.day[3]}}요일</td>
			<td><font color="blue">▼최저기온 : {{weather.low[3]}}℃</font>&nbsp;&nbsp;&nbsp;<font color="red">▲최고기온 : {{weather.high[3]}}</font><br>
			{{weather.text[3]}}</td>
		</tr>
		<tr>
			<td align="center"><img src="http://l.yimg.com/a/i/us/we/52/{{weather.code[4]}}.gif"  style="width: 80px; height: 80px"></td>
			<td>{{weather.day[4]}}요일</td>
			<td><font color="blue">▼최저기온 : {{weather.low[4]}}℃</font>&nbsp;&nbsp;&nbsp;<font color="red">▲최고기온 : {{weather.high[4]}}</font><br>
			{{weather.text[4]}}</td>
		</tr>
		
	</table>
	</td></tr>
</table>

</section>