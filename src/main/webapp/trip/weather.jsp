<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>
<section class="container">

<h3>지역을 선택하세요.</h3>

	<li class="list-group-item" data-ng-repeat="x in names" data-ng-click="weatherSearch(x.woeid, x.city)" style="text-align: center;">
		{{x.city}}
	</li>

</section>