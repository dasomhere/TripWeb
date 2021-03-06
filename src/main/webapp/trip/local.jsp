<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		<div class="col-sm-2 col-sm-offset-2">
			<b>도시</b><br>
			<select id="city" class="select">
				<option data-ng-repeat="city in citys" value="{{city.code}}" data-ng-click="cityChange()" data-ng-selected="city.code==1">{{city.name}}</option>
			</select>
		</div>
		<div class="col-sm-2">
			<b>시/군/구</b><br>
			<select id="sigunguCode" class="select">
				<option value="">전체</option>
				<option data-ng-repeat="sigunguCode in gus" value="{{sigunguCode.code}}">{{sigunguCode.name}}</option>
			</select>
		</div>
		<div class="col-sm-2">
			<b>관광타입</b><br>
			<select id="contentTypeId" class="select">
				<option data-ng-repeat="typeId in contents" value="{{typeId.code}}" data-ng-click="stays(typeId.code)">{{typeId.name}}</option>
			</select>
		</div>
		<div class="col-sm-2" data-ng-if="flags[0].flag">
			<b>숙박타입</b><br>
			<select id="select" data-ng-if="flags[0].flag">
				<option data-ng-repeat="stay in stayss" value="{{stay.value}}">{{stay.name}}</option>
			</select>
		</div>
		<div class="col-sm-2" style="text-align:left; height: 50px; position: relative;">
			<button class="btn btn-default" type="submit" style="position: absolute; width: 50%; bottom:0px;">검색</button>
		</div>
	</div>
</form>
<hr>
<div class="row" data-ng-repeat="(idx, result) in localResult.items.item" ng-if="idx % 3 == 0">
	<div class="col-md-4" data-ng-repeat="elIdx in [0, 1, 2]" ng-if="localResult.items.item[idx + elIdx]" style="margin-bottom: 20px;">
		<a href="#/searchDetail/{{localResult.items.item[idx + elIdx].contentid}}/{{localResult.items.item[idx + elIdx].contenttypeid}}" class="thumbnail" style="text-align: center;">
		  	<img ng-src="{{localResult.items.item[idx + elIdx].firstimage}}" style="width: 170px; height: 150px;" class="img-circle" ng-hide="localResult.items.item[idx + elIdx].firstimage == null"/>
		  	<img ng-src="http://placehold.it/170x150/EAEAEA/808080&text=No Image!" class="img-circle" ng-hide="localResult.items.item[idx + elIdx].firstimage != null"/>
		  	<b>{{localResult.items.item[idx + elIdx].title}}</b><br>
		  	주소 : {{localResult.items.item[idx + elIdx].addr1}}<br>
		  	전화번호 : <span data-ng-bind-html="localResult.items.item[idx + elIdx].tel"></span>
	 	</a>
	</div>
</div>

<div align="center" ng-show="localResult.totalCount > 0">
	<pagination total-items="localResult.totalCount" 
				ng-model="currentPage"
				items-per-page="itemsPerPage"
				max-size="5" 
				class="pagination-sm" 
				first-text="&laquo;"
				last-text="&raquo;"
				boundary-links="true" 
				direction-links="false"
				rotate="false" num-pages="numPages"
				ng-change="changePage()">
	</pagination>	
</div>
<div ng-show="localResult.totalCount == 0">
	<h3>검색 결과가 없습니다.</h3>
</div>
</section>
