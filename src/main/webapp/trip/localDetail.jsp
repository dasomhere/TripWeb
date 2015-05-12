<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<h1>{{localDetail[0].title}} </h1>
	<div class="container">
  	<br>
	  <div id="myCarousel" class="carousel slide" data-ride="carousel">
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	      <li data-target="#myCarousel" data-slide-to="2"></li>
	    </ol>
<!-- 		data-ng-repeat="image in localDetailImage" -->
	    <!-- Wrapper for slides -->
	    <div class="carousel-inner" role="listbox">
	      <div class="item active">
	        <img src="{{localDetailImage[0].originimgurl}}"  width="700" height="345">
	      </div>
	
	      <div class="item">
	        <img src="{{localDetailImage[1].originimgurl}}" width="700" height="345">
	      </div>
	
	      <div class="item">
	        <img src="{{localDetailImage[2].originimgurl}}" width="700" height="345">
	      </div>
	      
	    </div>
	  </div>
  	
  		<li class="list-group-item" data-ng-repeat="local in localDetail">
			유 모 차 사 용 여 부: {{local.chkbabycarriage}}
		</li>
		<li class="list-group-item" data-ng-repeat="local in localDetail">
			체크카드 사용 여 부: {{local.chkcreditcard}}
		</li>
		<li class="list-group-item" data-ng-repeat="local in localDetail">
			애완동물 출입가능여부: {{local.chkpet}}
		</li>
		<li class="list-group-item" data-ng-repeat="local in localDetail">
			 문의 및 안내 : {{local.infocenter}}
		</li>
		<li class="list-group-item" data-ng-repeat="local in localDetail">
			주 차 장 : {{local.parking}}
		</li>
		<li class="list-group-item" data-ng-repeat="local in localDetail">
			쉬 는 날 : {{local.restdate}}
		</li>
		<li class="list-group-item" data-ng-repeat="local in localDetail">
			이 용 시 간 : {{local.usetime}}
		</li>
</div>
	

<!-- 	<div class="container"> -->
<!-- 	  <br> -->
<!-- 	  <div id="myCarousel" class="carousel slide" data-ride="carousel"> -->

<!-- 	    <div class="carousel-inner" role="listbox"> -->
	
<!-- 	      <div class="item" data-ng-repeat="image in localDetailImage"> -->
<!-- 	        <img src="{{image.originimgurl}}" width="460" height="345"> -->
<!-- 	      </div> -->
<!-- 	      </div> -->
<!--   	</div> -->
<!--     </div> -->


<!-- 	<div class="container"> -->
<!-- 	  <br> -->
<!-- 	 <div class="carousel-inner" role="listbox"> -->
<!-- 	 	<div class="item" data-ng-repeat="image in localDetailImage"> -->
<!-- 			<img alt="" src="{{image.originimgurl}}" style="width: 150px; height: 100px"> -->
<!-- 	  	</div> -->
<!-- 	  </div> -->
	  
<!-- 	  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> -->
<!-- 		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> -->
<!-- 		    <span class="sr-only">Previous</span> -->
<!-- 	  </a> -->
<!-- 	  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> -->
<!-- 		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> -->
<!-- 		    <span class="sr-only">Next</span> -->
<!-- 	  </a> -->
<!-- 	 </div> -->
<!-- ---------------------------------- -->
	 
</div>
