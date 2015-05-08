<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>

<h1>행사정보</h1>
<div>
	<li class="list-group-item" data-ng-repeat="event in events" style="text-align: center;">
		<h3>{{event.title}}</h3> <br>
		<img alt="" src="{{event.firstimage}}"> <br>
		<h4>{{event.addr1}}</h4> <br>
		<h4>{{event.tel}}</h4>
	</li>
</div>
