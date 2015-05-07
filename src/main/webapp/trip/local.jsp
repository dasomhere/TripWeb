<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- local.jsp -->

<div class="container">
<hr>
<h1>관광정보 </h1>
<hr>

	<select data-ng-change="cityChange()"
	        data-ng-model="selectedCity">
		<option data-ng-repeat="city in citys" value="{{city.code}}" data-ng-selected="city.code==1">{{city.name}}</option>
	</select>
	
	<select data-ng-change=""
	        data-ng-model="selectedCityGu">
		<option data-ng-repeat="gu in gus" value="{{gu.code}}" data-ng-selected="gu.code==1">{{gu.name}}</option>
	</select>
	
	<select data-ng-change="type()"
			data-ng-model="selectedType">
		<option value="12">관광지</option>
	</select>

<!-- <input type="button" data-ng-click="click(city)" data-ng-model="result" value="클릭"/> -->
<!-- 	<div> -->
<!-- 		<ul class="list-group"> -->
<!-- 		 	<li class="list-group-item" data-ng-repeat="type in types" data-ng-click="click(city)" data-ng-model="result"> -->
<!-- 		 		{{type}} -->
<!-- 		 	</li> -->
<!-- 		</ul>	 -->
<!-- 	</div> -->
</div>
