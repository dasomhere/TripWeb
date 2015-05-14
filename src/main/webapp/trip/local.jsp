<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- local.jsp -->

<div class="container">
<hr>
<h1>관광정보 </h1>
<hr>

	<select id=city>
		<option data-ng-repeat="city in citys" value="{{city.code}}" data-ng-click="cityChange()" data-ng-selected="city.code==1">{{city.name}}</option>
	</select>
	
	<select id=sigunguCode>
		<option data-ng-repeat="sigunguCode in gus" value="{{sigunguCode.code}}">{{sigunguCode.name}}</option>
	</select>
	
	<select id=contentTypeId>
		<option value="12">관광지</option>
		<option value="32">숙박</option>
		<option value="39">음식점</option>
	</select>
	
	<select data-ng-switch="contentTypeId">
		<option data-ng-switch-when="32">한옥</option>
		<option data-ng-switch-when="32">베니키아</option>
		<option data-ng-switch-when="32">굿스테이</option>
		<option data-ng-switch-default>선택사항 없음</option>
	</select>
	
	<button data-ng-click="search()" class="btn btn-default" type="button">조회</button>

	<hr>

	<div>
		<ul class="list-group">
		 	<li class="list-group-item" data-ng-repeat="type in localResult" data-ng-click=contentid(type.contentid,type.contenttypeid)>
		 			<table>
		 			  <tr><td><img alt="" src="{{type.firstimage}}" style="width: 200px" height="150px"/>
		 			  	<img src="http://placehold.it/150x100/808080/ffffff&text=No Image!" style="width: 150px; height: 100px" data-ng-hide="type.firstimage != null"/>
		 			  <td><tr>
		 			  <tr><td>{{type.title}}</td></tr>
		 			</table>
		 	</li>
		</ul>	
	</div>
</div>
