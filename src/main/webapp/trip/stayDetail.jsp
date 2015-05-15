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
<!-- imageInfoDetail -->
<!-- 	<div id="myCarousel" class="carousel slide" data-ride="carousel"> -->
<!-- 		<!-- Indicators -->
<!-- 		<ol class="carousel-indicators"> -->
<!-- 			<li data-target="#myCarousel" data-slide-to="0" class="active"></li> -->
<!-- 			<li data-target="#myCarousel" data-slide-to="{{$index+1}}" data-ng-repeat="img in imageInfoDetail"> -->
<!-- 			</li> -->
		
<!-- 		</ol> -->

<!-- 		<!-- Wrapper for slides --> -->
<!-- 		<div class="carousel-inner" role="listbox"> -->
<!-- 			<div class="item active" data-ng-repeat="common in localCommonDetail" id="image"> -->
<!-- 				<img src="{{common.firstimage2}}" width="460" height="345"> -->
<!-- 			</div> -->
<!-- 			<div class="item" data-ng-repeat="img in imageInfoDetail" id="image"> -->
<!-- 				<img src="{{img.originimgurl}}" width="460" height="345"> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
<!-- 		 <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> -->
<!-- 		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> -->
<!-- 		    <span class="sr-only">Previous</span> -->
<!-- 		  </a> -->
		  
<!-- 		  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> -->
<!-- 		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> -->
<!-- 		    <span class="sr-only">Next</span> -->
<!-- 		 </a> -->
		 
<!-- 	</div>	 -->
		<ul class="list-group">
			<li class="list-group-item" data-ng-repeat="han in hanOkInfo">
				{{han.}}
			</li>
		</ul>
	</div>

