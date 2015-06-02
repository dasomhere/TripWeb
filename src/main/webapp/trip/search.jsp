<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>

<style>
select, input {
	height: 30px;
	width: 100%;
}
</style>

<section class="container">
<hr>
<form data-ng-submit="search()">
	<div class="row" style="text-align: center;">
		<div class="col-sm-2 col-sm-offset-2">
			<b>관광타입</b><br>
			<select id=content>
				<option data-ng-repeat="content in contents" value="{{content.code}}">{{content.name}}</option>
			</select>
		</div>
		<div class="col-sm-4">
			<b>키워드</b><br>
			<input type="text" name="keyword" id="keyword" placeholder="키워드를 입력하세요"/>
		</div>
		<div class="col-sm-2" style="text-align:left; height: 50px; position: relative;">
			<button class="btn btn-default" type="submit" style="position: absolute; width: 50%; bottom:0px;">검색</button>
		</div>
	</div>
</form>
<hr>

<div class="row" data-ng-repeat="(idx, result) in searchResult.items.item" ng-if="idx % 3 == 0">
	<div class="col-md-4" data-ng-repeat="elIdx in [0, 1, 2]" ng-if="searchResult.items.item[idx + elIdx]" style="margin-bottom: 20px;">
		<a href="#/searchDetail/{{searchResult.items.item[idx + elIdx].contentid}}/{{searchResult.items.item[idx + elIdx].contenttypeid}}" class="thumbnail" style="text-align: center;">
		  	<img ng-src="{{searchResult.items.item[idx + elIdx].firstimage}}" style="width: 170px; height: 150px;" class="img-circle" ng-hide="searchResult.items.item[idx + elIdx].firstimage == null"/>
		  	<img ng-src="http://placehold.it/170x150/EAEAEA/808080&text=No Image!" class="img-circle" ng-hide="searchResult.items.item[idx + elIdx].firstimage != null"/>
		  	<b>{{searchResult.items.item[idx + elIdx].title}}</b><br>
		  	주소 : {{searchResult.items.item[idx + elIdx].addr1}}<br>
		  	전화번호 : <span data-ng-bind-html="searchResult.items.item[idx + elIdx].tel"></span>
	 	</a>
	</div>
</div>

<div align="center" ng-show="searchResult.totalCount > 0">
	<pagination total-items="searchResult.totalCount" 
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
<div ng-show="searchResult.totalCount == 0">
	<h3>검색 결과가 없습니다.</h3>
</div>
</section>