<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>
<section class="container">

<h1>load</h1>

<select id=city>
	<option data-ng-repeat="city in citys" value="{{city.code}}">{{city.name}}</option>
</select>

<select id=category>
	<option value="">전체</option>
	<option data-ng-repeat="category in categorys" value="{{category.code}}">{{category.name}}</option>
</select>

<button data-ng-click="search()">검색</button>
<hr>
<div>
	<ul class="list-group">
	 	<li class="list-group-item" data-ng-repeat="r in loadResult" data-ng-click="detail(r.contentid, r.title)">
	 			<table>
	 			  <tr><td><img src="{{r.firstimage}}" style="width: 150px; height: 100px"/><td><tr>
	 			  <tr><td>{{r.title}}</td></tr>
	 			</table>
	 			
	 	</li>
	</ul>	
</div>
</section>