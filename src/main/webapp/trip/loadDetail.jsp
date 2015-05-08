<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>
<section class="container">

<h1>{{loadDetail[0].title}}</h1>
<div>
	<ul class="list-group">
	 	<li class="list-group-item" data-ng-repeat="l in loadDetail">
	 			<table>
	 			  <tr><td>{{l.subnum}}.코스 : {{l.subname}}</td></tr>
	 			  <tr><td><img src="{{l.subdetailimg}}" style="width: 150px; height: 100px"/><td><tr>
	 			  <tr><td>{{l.subdetailoverview}}</td></tr>
	 			</table>
	 			
	 	</li>
	</ul>	
</div>

</section>