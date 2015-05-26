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

<!-- <div> -->
<!-- 	<ul class="list-group"> -->
<!-- 	 	<li class="list-group-item" data-ng-repeat="r in searchResult.items.item"> -->
<!--  			<table> -->
<!--  			  <tr> -->
<!--  			  	<td>{{r.title}}</td> -->
<!--  			  </tr> -->
<!--  			  <tr> -->
<!--  			  	<td> -->
<!--  			  		<a href="#/searchDetail/{{r.contentid}}/{{r.contenttypeid}}"> -->
<!-- 	 			  	<img ng-src="{{r.firstimage}}" style="width: 150px; height: 100px"/> -->
<!-- 	 			  	<img ng-src="http://placehold.it/150x100/808080/ffffff&text=No Image!" style="width: 150px; height: 100px" ng-hide="r.firstimage != null"/> -->
<!-- 	 			 	</a> -->
<!--  			  	</td> -->
<!--  			  </tr> -->
 			 
<!--  			</table> -->
<!-- 	 	</li> -->
<!-- 	</ul> -->
<!-- </div> -->

<div class="row" data-ng-repeat="(idx, result) in searchResult.items.item" ng-if="idx % 4 == 0">
	<div class="col-xs-6 col-sm-3" data-ng-repeat="elIdx in [0, 1, 2, 3]" ng-if="searchResult.items.item[idx + elIdx]">
		<a href="#/searchDetail/{{searchResult.items.item[idx + elIdx].contentid}}/{{searchResult.items.item[idx + elIdx].contenttypeid}}">
		  	<img ng-src="{{searchResult.items.item[idx + elIdx].firstimage}}" style="width: 180px; height: 150px;"/>
		  	<img ng-src="http://placehold.it/200x150/808080/ffffff&text=No Image!" ng-hide="searchResult.items.item[idx + elIdx].firstimage != null"/>
	 	</a>
	</div>
</div>
<!-- 		<img ng-src="http://tong.visitkorea.or.kr/cms/resource/22/1744722_image2_1.jpg" style="width: 100%; padding-bottom: 56.26%;"/> -->

<div class="row">
	<div class="col-xs-6 col-sm-3" style="position:relative; height:3em; padding-bottom:60%">
		<div style="border: 1px solid red; position:absolute; width:100%; height:100%;"></div>
	</div>
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