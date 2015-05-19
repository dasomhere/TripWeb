<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>
<section class="container">

<h3>지역, 코스를 선택하세요</h3>
<form data-ng-submit="search()">
<select id=city>
	<option data-ng-repeat="city in citys" value="{{city.code}}">{{city.name}}</option>
</select>

<select id=category>
	<option value="">전체</option>
	<option data-ng-repeat="category in categorys" value="{{category.code}}">{{category.name}}</option>
</select>

<button type="submit" class="btn btn-default">조회</button>	
</form>
<hr>
<div>
	<ul class="list-group">
	 	<li class="list-group-item" data-ng-repeat="r in loadResult">
 			<table>
 			  <tr><td>
 			  	<a href="#/searchDetail/{{event.contentid}}/{{event.contenttypeid}}">
 			  	<img src="{{r.firstimage}}" style="width: 150px; height: 100px"/>
 			  	<img src="http://placehold.it/150x100/808080/ffffff&text=No Image!" style="width: 150px; height: 100px" data-ng-hide="r.firstimage != null"/>
 			  	</a>
 			  <td><tr>
 			  <tr><td>{{r.title}}</td></tr>
 			</table>
	 	</li>
	</ul>	
</div>
</section>