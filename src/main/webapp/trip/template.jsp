<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>
<section class="container">

<h3>키워드 검색</h3>

<div>
	<form data-ng-submit="search()">
		<div align="center">
		<table>
			<tr>
				<td><input type="text" name="keyword" id="keyword"/></td><td style="padding-left: 10px;"><button type="submit" class="btn btn-default">검색</button></td>
			</tr>
		</table>
		</div>
	</form>
</div>
<hr>

<div>
	<ul class="list-group">
	 	<li class="list-group-item" data-ng-repeat="r in searchResult.items.item">
 			<table>
 			  <tr>
 			  	<td>{{r.title}}</td>
 			  </tr>
 			  <tr>
 			  	<td>
 			  		<a href="#/searchDetail/{{r.contentid}}">
	 			  	<img ng-src="{{r.firstimage}}" style="width: 150px; height: 100px"/>
	 			  	<img ng-src="http://placehold.it/150x100/808080/ffffff&text=No Image!" style="width: 150px; height: 100px" ng-hide="r.firstimage != null"/>
	 			 	</a>
 			  	</td>
 			  </tr>
 			 
 			</table>
	 	</li>
	</ul>
</div>

<div align="center">
	<pagination total-items="searchResult.totalCount" 
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