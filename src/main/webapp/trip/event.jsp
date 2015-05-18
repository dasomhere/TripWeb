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
		 <li class="list-group-item" data-ng-repeat="event in events.items.item" data-ng-click = "detail(event.contentid, event.title, event.contenttypeid)" style="text-align: center;">
		 		<img alt=""	ng-src="{{event.firstimage}}" style="width: 200px; height: 250px"/> <br>
		 		<img src="http://placehold.it/150x100/808080/ffffff&text=No Image!" style="width: 200px; height: 250px" ng-hide="event.firstimage != null"/>
				<h4>{{event.title}}</h4> <br>
		 			
		</li>	
	</div>
		
	</div>
	
	<div align="center">
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
				ng-change="changePage()"
				
				></pagination>	
	</div>
</div>