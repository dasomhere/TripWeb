<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- local.jsp -->

<section class="container">
<hr>
<h1>관광정보 </h1>
<hr>
<form data-ng-submit="search()">
	<div class="btn-group">
    <button type="button" class="form-control btn btn-default dropdown-toggle" data-toggle="dropdown">
        Select Business type <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu">
        <li><a href="#">small</a></li>
        <li><a href="#">medium</a></li>
        <li><a href="#">large</a></li>
    </ul>
	</div>
	
	<select id=city>
		<option data-ng-repeat="city in citys" value="{{city.code}}" data-ng-click="cityChange()" data-ng-selected="city.code==1">{{city.name}}</option>
	</select>
	
	<select id=sigunguCode>
		<option data-ng-repeat="sigunguCode in gus" value="{{sigunguCode.code}}">{{sigunguCode.name}}</option>
	</select>
	
	<select id="contentTypeId" data-ng-click="stay()">
		<option value="12">관광지</option>
		<option value="32">숙박</option>
		<option value="39">음식점</option>
		<option value="28">레포츠</option>
		<option value="38">쇼핑</option>
	</select>
	
	<select id="select">
		<option value="#">선택사항 없음</option>
	</select>
	
	<button class="btn btn-default" type="submit">조회</button>
</form>
	<hr>

	<div>
		<ul class="list-group">
		 	<li class="list-group-item" data-ng-repeat="type in localResult.items.item">
		 			<table>
		 			  <tr><td>
		 			  	<a href="#/searchDetail/{{type.contentid}}/{{type.contenttypeid}}">
          	 			<img data-ng-src="{{type.firstimage}}" style="width: 200px" height="150px"/>
		 			  	<img data-ng-src="http://placehold.it/150x100/808080/ffffff&text=No Image!" style="width: 150px; height: 100px" data-ng-hide="type.firstimage != null"/>
		 			  	</a>
		 			  <td><tr>
		 			  <tr><td>{{type.title}}</td></tr>
		 			</table>
		 	</li>
		</ul>	
	</div>
	<div align="center">
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
				ng-change="changePage()"
				
				></pagination>	
	</div>
</section>
