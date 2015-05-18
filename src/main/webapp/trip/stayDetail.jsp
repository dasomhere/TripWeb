<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<style>
/* 	#image { */
/*       margin-left: 150px; */
/*   	} */
</style>
<div class="container">
	<h1>숙박</h1>

		<ul class="list-group">
			<li class="list-group-item" data-ng-repeat="hanOk in hanOkInfo">
				{{hanOk.addr1}}
			</li>
		</ul>
	</div>

