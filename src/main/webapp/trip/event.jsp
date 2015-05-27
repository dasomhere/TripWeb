<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
select {
	height: 30px;
	width: 100%;
}
</style>

<section class="container">
<hr>
<form data-ng-submit="search()">
	<div class="row" style="text-align: center;">
		<div class="col-sm-2 col-sm-offset-3">
			<b>도시</b><br>
			<select id = "city">
				<option data-ng-repeat="city in citys" value="{{city.code}}" data-ng-selected="city.code==1">{{city.name}}</option>
			</select>
		</div>
		<div class="col-sm-2">
			<b>월</b><br>
			<select id = "month">
				<c:forEach var = "i" begin="1" end="12">
					<option value="${i}">${i}월</option>
				</c:forEach>
			</select>
		</div>
		<div class="col-sm-2" style="text-align:left; height: 50px; position: relative;">
			<button class="btn btn-default" type="submit" style="position: absolute; width: 50%; bottom:0px;">검색</button>
		</div>
	</div>
</form>	
<hr>
<div class="row" data-ng-repeat="(idx, result) in events.items.item" ng-if="idx % 3 == 0">
	<div class="col-md-4" data-ng-repeat="elIdx in [0, 1, 2]" ng-if="events.items.item[idx + elIdx]" style="margin-bottom: 20px;">
		<a href="#/searchDetail/{{events.items.item[idx + elIdx].contentid}}/{{events.items.item[idx + elIdx].contenttypeid}}" class="thumbnail" style="text-align: center;">
		  	<img ng-src="{{events.items.item[idx + elIdx].firstimage}}" style="width: 170px; height: 150px;" class="img-circle" ng-hide="events.items.item[idx + elIdx].firstimage == null"/>
		  	<img ng-src="http://placehold.it/170x150/EAEAEA/808080&text=No Image!" class="img-circle" ng-hide="events.items.item[idx + elIdx].firstimage != null"/>
		  	<b>{{events.items.item[idx + elIdx].title}}</b><br>
		  	행사기간 : {{events.items.item[idx + elIdx].eventstartdate}} ~ {{events.items.item[idx + elIdx].eventenddate}}<br>
		  	주소 : {{events.items.item[idx + elIdx].addr1}}<br>
		  	전화번호 : {{events.items.item[idx + elIdx].tel}}
	 	</a>
	</div>
</div>
	
<div align="center" ng-show="events.totalCount > 0">
	<pagination total-items="events.totalCount" 
				ng-model="currentPage"
				items-per-page="itemsPerPage"
				max-size="10" 
				class="pagination-sm" 
				first-text="&laquo;"
				last-text="&raquo;"
				boundary-links="true" 
				direction-links="false"
				rotate="false" num-pages="numPages"
				ng-change="changePage()">
	</pagination>	
</div>
<div ng-show="events.totalCount == 0">
	<h3>검색 결과가 없습니다.</h3>
</div>
</section>