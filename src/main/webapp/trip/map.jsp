<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- local.jsp -->

<section class="container">
<hr>
<h3>지도검색 </h3>
<hr>
<form data-ng-submit="search()">
	
<!-- 	<div> -->
<!-- 	<label><input type="checkbox" ng-true-value="12" ng-model="checkboxModel.value12">관광지</label> -->
<!-- 	<label><input type="checkbox" ng-true-value="14" ng-model="checkboxModel.value24">문화시설</label> -->
<!-- 	<label><input type="checkbox" ng-true-value="15" ng-model="checkboxModel.value15">축제공연행사</label> -->
<!-- 	<label><input type="checkbox" ng-true-value="25" ng-model="checkboxModel.value25">여행코스</label> -->
<!-- 	<label><input type="checkbox" ng-true-value="28" ng-model="checkboxModel.value28">레포츠</label> -->
<!-- 	<label><input type="checkbox" ng-true-value="32" ng-model="checkboxModel.value32">숙박</label> -->
<!-- 	<label><input type="checkbox" ng-true-value="38" ng-model="checkboxModel.value38">쇼핑</label> -->
<!-- 	<label><input type="checkbox" ng-true-value="39" ng-model="checkboxModel.value39">음식점</label> -->
<!-- 	</div> -->
	<div>
		<label ng-repeat="c in contents" style="padding-right: 10px;">
		  <input type="checkbox" checklist-model="selectedContents" checklist-value="c">{{c.name}}
		</label>
	</div>
	
	<select id=city>
		<option data-ng-repeat="city in citys" value="{{city.code}}" data-ng-click="cityChange()" data-ng-selected="city.code==1">{{city.name}}</option>
	</select>
	
	<select id=sigunguCode>
		<option data-ng-repeat="sigunguCode in gus" value="{{sigunguCode.code}}">{{sigunguCode.name}}</option>
	</select>
	
	<button class="btn btn-default" type="submit">조회</button>
</form>
	<hr>

<!-- 	<div> -->
<!-- 		<ul class="list-group"> -->
<!-- 		 	<li class="list-group-item" data-ng-repeat="type in localResult.items.item"> -->
<!-- 		 			<table> -->
<!-- 		 			  <tr><td> -->
<!-- 		 			  	<a href="#/searchDetail/{{type.contentid}}/{{type.contenttypeid}}"> -->
<!--           	 			<img data-ng-src="{{type.firstimage}}" style="width: 200px" height="150px"/> -->
<!-- 		 			  	<img data-ng-src="http://placehold.it/150x100/808080/ffffff&text=No Image!" style="width: 150px; height: 100px" data-ng-hide="type.firstimage != null"/> -->
<!-- 		 			  	</a> -->
<!-- 		 			  <td><tr> -->
<!-- 		 			  <tr><td>{{type.title}}</td></tr> -->
<!-- 		 			</table> -->
<!-- 		 	</li> -->
<!-- 		</ul>	 -->
<!-- 	</div> -->
<!-- 	<div align="center"> -->
<!-- 	<pagination total-items="localResult.totalCount"  -->
<!-- 				ng-model="currentPage" -->
<!-- 				items-per-page="itemsPerPage" -->
<!-- 				max-size="5"  -->
<!-- 				class="pagination-sm"  -->
<!-- 				first-text="&laquo;" -->
<!-- 				last-text="&raquo;" -->
<!-- 				boundary-links="true"  -->
<!-- 				direction-links="false" -->
<!-- 				rotate="false" num-pages="numPages" -->
<!-- 				ng-change="changePage()" -->
				
<!-- 				></pagination>	 -->
<!-- 	</div> -->
</section>
