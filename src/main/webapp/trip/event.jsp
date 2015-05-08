<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf"%>

<div class="container">
	<h1>행사</h1>
	<div>
	
	<select data-ng-change="cityChange()"
	        data-ng-model="selectedCity">
		<option data-ng-repeat="city in citys" value="{{city.code}}" data-ng-selected="city.code==1">{{city.name}}</option>
	</select>
	
	<div>
		 <li class="list-group-item" data-ng-repeat="event in events" data-ng-click=click(type.code) style="text-align: center;">
		 		<h3>{{event.title}}</h3> <br>
		 		<img alt=""	src="{{event.firstimage}}"> <br>
				<h4>{{event.addr1}}</h4> <br>
				<h4>{{event.tel}}</h4>
		 			
		</li>	
	</div>
		
	</div>
</div>