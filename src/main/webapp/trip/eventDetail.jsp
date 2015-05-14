<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container"> 
	<h1>상세정보</h1>
<hr>
	<ul class="list-group">
	 	<li class="list-group-item" data-ng-repeat="event in eventDetail">
	 		<table>
	 			  <tr><td><b>장소 : </b>{{event.eventplace}}</td></tr>
	 			  <tr><td><b>연령 : </b>{{event.agelimit}}<td><tr>
	 			  <tr><td><b>기간 : </b>{{event.eventstartdate}} - {{event.eventenddate}}</td></tr>
	 			  <tr><td><b>전화번호 : </b>{{event.sponsor1tel}}</td></tr>
	 			  <tr><td><b>행사 시간 : </b>{{event.spendtimefestival}}</td></tr>
	 			  <tr><td><b>홈페이지 : </b><a href="{{event.eventhomepage}}">{{event.eventhomepage}}</a></td></tr>
	 			  <tr><td data-ng-if="event.bookingplace == null"><b>예매 : 없다 </b></td></tr>
	 			  <tr><td data-ng-if="event.bookingplace != null"><b>{{event.bookingplace}}</b></td></tr> 
	 			  <tr><td><b>이용요금 : </b>{{event.usetimefestival}}</td></tr>
	 			  <tr><td><b>행사 프로그램 : </b>{{event.program}}</td></tr>
	 			  <tr><td><b>오시는길 : </b>{{event.placeinfo}}</td></tr>
	 			</table>
	 			
	 	</li>
	</ul>	
</div>