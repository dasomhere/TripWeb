<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
select {
	height: 30px;
	width: 100%;
}
</style>

<section class="container">
<hr>
<form data-ng-submit="search()">
	<div class="row" style="text-align: center;">
		<div class="col-sm-2 col-sm-offset-3">
			<b>관광타입</b><br>
			<select id="content">
					<option data-ng-repeat="content in contents" value="{{content.code}}">{{content.name}}</option>
			</select>
		</div>
		<div class="col-sm-2">
			<b>거리</b><br>
			<select id="radius">
				<c:forEach var="i" begin="1" end="20">
					<option value="${i*1000}" ng-click="radiusChange()">${i}km</option>
				</c:forEach>
			</select>
		</div>
		<div class="col-sm-2" style="text-align:left; height: 50px; position: relative;">
			<button class="btn btn-default" type="submit" style="position: absolute; width: 50%; bottom:0px;">검색</button>
		</div>
	</div>
</form>

	<hr>
	<div class="row">
		<div class="col-sm-3">
			<div>
				<ul class="list-group">
					<li class="list-group-item" data-ng-repeat="r in mapResult.items.item" ng-click="mapSearch(r.mapx, r.mapy)">
				 	{{r.title}} <font color="blue">({{r.dist}}m)</font>
					</li>
				</ul>	
			</div>
			
			<div align="center" ng-show="mapResult.totalCount > 0">
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
			<div ng-show="mapResult.totalCount == 0">
				<h3>검색 결과가 없습니다.</h3>
			</div>
		</div>
		<div class="col-sm-9">
			<p><b>현재위치:</b> <span id="location"></span></p>
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
