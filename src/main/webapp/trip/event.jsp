<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf"%>

<div class="container">
	<h1>행사</h1>
	<div>
	
	<select id = "city">
		<option data-ng-repeat="city in citys" value="{{city.code}}" data-ng-selected="city.code==1">{{city.name}}</option>
	</select>

	<select id = "month">
		<option value="01">1월</option>
		<option value="02">2월</option>
		<option value="03">3월</option>
		<option value="04">4월</option>
		<option value="05">5월</option>
		<option value="06">6월</option>
		<option value="07">7월</option>
		<option value="08">8월</option>
		<option value="09">9월</option>
		<option value="10">10월</option>
		<option value="11">11월</option>
		<option value="12">12월</option>
	</select>
		
<button data-ng-click="search()">검색</button>	
	<div>
		 <li class="list-group-item" data-ng-repeat="event in events" data-ng-click=detail(event.contentid) style="text-align: center;">
		 		<h3>{{event.title}}</h3> <br>
		 		<img alt=""	src="{{event.firstimage}}" style="width: 200px; height: 250px"/> <br>
		 		<img src="http://placehold.it/150x100/808080/ffffff&text=No Image!" style="width: 150px; height: 100px" ng-hide="event.firstimage != null"/>
				<h4>{{event.addr1}}</h4> <br>
		 			
		</li>	
	</div>
		
	</div>
</div>