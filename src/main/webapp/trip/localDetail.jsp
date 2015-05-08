<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
<hr>
<h1>지역 상세 정보 </h1>
<hr>
	<div>
	<ul class="list-group">
	 	<li class="list-group-item" data-ng-repeat="l in loclDetail">
			{{l.title}}	 			
	 	</li>
	</ul>	
</div>
</div>
