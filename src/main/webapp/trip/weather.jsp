<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>
<section class="container">

<h3>지역을 선택하세요.</h3>

	<div class="list-group" style="text-align: center;">
		<a class="list-group-item" data-ng-repeat="x in names" href="#/weatherResult/{{x.woeid}}/{{x.city}}">{{x.city}}</a>
	</div>
	
</section>