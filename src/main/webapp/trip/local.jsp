<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>

<section class="container">
	<h1>지역</h1>
	
	<div>
		<ul data-role="listview" >
			<li class="list-group-item" data-ng-repeat="local in locals track by $index" data-ng-click="click(local)">
				{{local}}
				{{local.title}}
				<img alt="" src="{{local.firstimage}}">
			</li>
		</ul>
	</div>
</section>