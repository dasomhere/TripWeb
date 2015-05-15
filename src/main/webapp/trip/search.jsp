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
<hr>
<div>
currentPage = {{currentPage}}<br>
itemsPerPage ={{itemsPerPage}}<br>
</div>
<pagination total-items="searchResult.body.totalCount" 
			ng-model="currentPage"
			items-per-page="itemsPerPage"
			max-size="10" 
			class="pagination-sm" 
			boundary-links="true" 
			rotate="false" num-pages="numPages"
			ng-change="changePage()"
			
			></pagination>	
<hr>
	<ul class="list-group">
	 	<li class="list-group-item" data-ng-repeat="r in searchResult.body.items.item" data-ng-click="detail()">
 			<table>
 			  <tr>
 			  	<td>{{r.title}}</td>
 			  </tr>
 			  <tr>
 			  	<td>
	 			  	<img src="{{r.firstimage}}" style="width: 150px; height: 100px"/>
	 			  	<img src="http://placehold.it/150x100/808080/ffffff&text=No Image!" style="width: 150px; height: 100px" ng-hide="r.firstimage != null"/>
 			  	</td>
 			  </tr>
 			 
 			</table>
	 	</li>
	</ul>
</div>

</section>