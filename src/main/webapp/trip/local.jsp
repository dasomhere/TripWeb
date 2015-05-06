<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>

<section class="container">
	<h1>local</h1>
	<input type="button" data-ng-click="click()" value="클릭" />
	<div>
		<ul data-role="listview" >
			<li data-ng-repeat="local in locals">
				{{local}}
			</li>
		</ul>
	</div>
</section>