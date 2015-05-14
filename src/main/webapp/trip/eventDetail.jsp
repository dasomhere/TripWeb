<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container"> 
	<h1>상세정보</h1>
<hr>
	<ul class="list-group">
	 	<li class="list-group-item" data-ng-repeat="event in eventDetail">
	 		<table>
	 			  <tr><td>장소 : {{event.eventplace}}</td></tr>
	 			  <tr><td>연령 : {{event.agelimit}}<td><tr>
	 			  <tr><td>기간 : {{event.eventstartdate}} - {{event.eventenddate}}</td></tr>
	 			  <tr><td>전화번호  : {{event.sponsor1tel}}</td></tr>
	 			  <tr><td>행사 시간 : {{event.spendtimefestival}}</td></tr>
	 			  <tr><td>홈페이지 : <a href="{{event.eventhomepage}}">{{event.eventhomepage}}</a></td></tr>
	 			  <tr><td>예매 : {{event.bookingplace}}</td></tr>
	 			  <tr><td>이용요금  : {{event.usetimefestival}}</td></tr>
	 			  <tr><td>행사 프로그램 : {{event.program}}</td></tr>
	 			  <tr><td>오시는 길 : {{event.placeinfo}}</td></tr>
	 			</table>
	 			
	 	</li>
	</ul>	
</div>