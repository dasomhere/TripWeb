<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- local.jsp -->

<section class="container">
<hr>
<h3>지도검색 </h3>
<hr>
<form data-ng-submit="search()">
	
	<select id=city>
		<option data-ng-repeat="city in citys" value="{{city.code}}" data-ng-click="cityChange()" data-ng-selected="city.code==1">{{city.name}}</option>
	</select>
	
	<select id=sigunguCode>
		<option value="">전체</option>
		<option data-ng-repeat="sigunguCode in gus" value="{{sigunguCode.code}}">{{sigunguCode.name}}</option>
	</select>
	
	<select id=content>
		<option data-ng-repeat="content in contents" value="{{content.code}}">{{content.name}}</option>
	</select>
	
	<button class="btn btn-default" type="submit">조회</button>
</form>
	<hr>
	<div class="row">
		<div class="col-sm-3">
			<div>
				<ul class="list-group">
					<li class="list-group-item" data-ng-repeat="r in mapResult.items.item" ng-click="mapSearch(r.mapx, r.mapy)">
				 	{{r.title}}
					</li>
				</ul>	
			</div>
			
			<div align="center">
			<pagination total-items="mapResult.totalCount" 
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
		</div>
		<div class="col-sm-9">
			<map center="37.5, 127" zoom="14" style="height: 600px;">
				<div data-ng-repeat="r in mapResult.items.item">
					<marker position="{{r.mapy}}, {{r.mapx}}" title="{{r.title}}" on-click="showInfoWindow(event, 'info')"></marker>
					<info-window id="info" visible-on-marker="foo">
						<div>
			 			  	<h3>{{r.title}}</h3>
			 			  		<a href="#/searchDetail/{{r.contentid}}/{{r.contenttypeid}}">
					 			  	<img ng-src="{{r.firstimage}}" style="width: 250px; height: 200px"/>
					 			  	<img ng-src="http://placehold.it/150x100/808080/ffffff&text=No Image!" style="width: 250px; height: 200px" ng-hide="r.firstimage != null"/>
				 			 	</a>
			 			  	<p>주소 : {{r.addr1}} <br>
			 			  	전화번호 : {{r.tel}}</p>
						</div>
					</info-window>
				</div>
			</map>
		</div>
	</div>
</section>
