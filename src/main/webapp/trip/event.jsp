<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf"%>
<div class="container">
	<h1>행사</h1>
	<div>
	
	<form data-ng-submit="search()">
	
	<select id = "city">
		<option data-ng-repeat="city in citys" value="{{city.code}}" data-ng-selected="city.code==1">{{city.name}}</option>
	</select>
	
	<select id = "month">
		<c:forEach var = i; begin=1; end=12;>
			<c:if test="${i < 10}">
				<option value="0i">i월</option>
			</c:if>
			<option value="i">i월</option>
		</c:forEach>
	</select>
	
<button type="submit" class="btn btn-default">조회</button>	
</form>	
	<div>
		 <li class="list-group-item" data-ng-repeat="event in events.items.item"  style="text-align: center;">
		 		<a href="#/searchDetail/{{event.contentid}}/{{event.contenttypeid}}">
		 		<img alt=""	data-ng-src="{{event.firstimage}}" style="width: 200px; height: 250px"/> <br>
		 		<img src="http://placehold.it/150x100/808080/ffffff&text=No Image!" style="width: 200px; height: 250px" data-ng-hide="event.firstimage != null"/>
				<h4>{{event.title}}</h4> <br>
				</a>
		 			
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