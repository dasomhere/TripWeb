<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>
<section class="container">

<h1>weather</h1>


	<li class="list-group-item" data-ng-repeat="x in names" data-ng-click="weather(x.woeid)" style="text-align: center;">
		{{x.city}}
	</li>

	

</section>