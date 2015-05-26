<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>
<section class="container">

<h3>키워드를 입력하세요.</h3>

<div>
	<form data-ng-submit="search()">
		<div align="center">
		<table>
			<tr>
				<td style="padding-right: 10px;">
					<select id=content>
						<option data-ng-repeat="content in contents" value="{{content.code}}">{{content.name}}</option>
					</select>
				</td>
				<td><input type="text" name="keyword" id="keyword"/></td>
				<td style="padding-left: 10px;"><button type="submit" class="btn btn-default">검색</button></td>
			</tr>
		</table>
		</div>
	</form>
</div>
<hr>

<div class="row" data-ng-repeat="(idx, result) in searchResult.items.item" ng-if="idx % 3 == 0">
	<div class="col-md-4" data-ng-repeat="elIdx in [0, 1, 2]" ng-if="searchResult.items.item[idx + elIdx]" style="margin-bottom: 20px;">
		<a href="#/searchDetail/{{searchResult.items.item[idx + elIdx].contentid}}/{{searchResult.items.item[idx + elIdx].contenttypeid}}" class="thumbnail" style="text-align: center;">
		  	<img ng-src="{{searchResult.items.item[idx + elIdx].firstimage}}" style="width: 170px; height: 150px;" class="img-circle" ng-hide="searchResult.items.item[idx + elIdx].firstimage == null"/>
		  	<img ng-src="http://placehold.it/170x150/EAEAEA/808080&text=No Image!" class="img-circle" ng-hide="searchResult.items.item[idx + elIdx].firstimage != null"/>
		  	<b>{{searchResult.items.item[idx + elIdx].title}}</b><br>
		  	주소 : {{searchResult.items.item[idx + elIdx].addr1}}<br>
		  	전화번호 : {{searchResult.items.item[idx + elIdx].tel}}
	 	</a>
	</div>
</div>

<div align="center" ng-show="searchResult.totalCount > 0">
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
				ng-change="changePage()">
	</pagination>	
</div>
<div ng-show="searchResult.totalCount == 0">
	<h3>검색 결과가 없습니다.</h3>
</div>
</section>