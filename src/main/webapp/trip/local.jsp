<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- local.jsp -->
<style>

</style>

<section class="container">
<hr>
<h1>관광정보 </h1>
<hr>
<form data-ng-submit="search()">
		<select id="city" class="select">
			<option data-ng-repeat="city in citys" value="{{city.code}}" data-ng-click="cityChange()" data-ng-selected="city.code==1">{{city.name}}</option>
		</select>
		
		<select id="sigunguCode" class="select">
			<option data-ng-repeat="sigunguCode in gus" value="{{sigunguCode.code}}">{{sigunguCode.name}}</option>
		</select>
		
		<select id="contentTypeId" class="select">
			<option data-ng-repeat="typeId in contents" value="{{typeId.code}}" data-ng-click="stays(typeId.code)">{{typeId.name}}</option>
		</select>
		
		<select id="select" data-ng-if="flags[0].flag">
			<option data-ng-repeat="stay in stayss" value="{{stay.value}}">{{stay.name}}</option>
		</select>
		
	<button class="btn btn-default" type="submit">조회</button>
</form>
	<hr>

	<div>
		<ul class="list-group" data-ng-repeat="type in localResult.items.item">
		 	<li class="list-group-item" >
		 			<div class="row">
		 				<div class="col-sm-4">
		 						{{type.title}}<br>
		 						<a href="#/searchDetail/{{type.contentid}}/{{type.contenttypeid}}">
          	 						<img data-ng-src="{{type.firstimage}}" style="width: 200px" height="150px"/>
		 			  				<img data-ng-src="http://placehold.it/150x100/808080/ffffff&text=No Image!" style="width: 150px; height: 100px" data-ng-hide="type.firstimage != null"/>
		 			  			</a>
		 				</div>
		 			</div>
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
