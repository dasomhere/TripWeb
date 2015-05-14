<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<style>
	#image {
      margin-left: 150px;
  	}
</style>
<div class="container">
	<h1>{{localCommonDetail[0].title}}</h1>
<!-- imageInfoDetail -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="{{$index+1}}" data-ng-repeat="img in imageInfoDetail">
			</li>
		
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active" data-ng-repeat="common in localCommonDetail" id="image">
				<img src="{{common.firstimage2}}" width="460" height="345">
			</div>
			<div class="item" data-ng-repeat="img in imageInfoDetail" id="image">
				<img src="{{img.originimgurl}}" width="460" height="345">
			</div>
		</div>
		
		 <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  
		  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		 </a>
		 
	</div>	
		
		<ul class="list-group">
			<li class="list-group-item"
				data-ng-repeat="common in localCommonDetail">
				<table>
					<tr><th>개요</th></tr>
					<tr><td>{{common.overview}}</td></tr>
				</table>
			</li>
			<h3>기본정보</h3>
			<li class="list-group-item"
				data-ng-repeat="intro in localIntroDetail">유 모 차 사 용 여 부:
				{{intro.chkbabycarriage}}</li>
			<li class="list-group-item"
				data-ng-repeat="intro in localIntroDetail">체크카드 사용 여 부:
				{{intro.chkcreditcard}}</li>
			<li class="list-group-item"
				data-ng-repeat="intro in localIntroDetail">애완동물 출입가능여부:
				{{intro.chkpet}}</li>
			<li class="list-group-item"
				data-ng-repeat="intro in localIntroDetail"
				data-ng-if="intro.infocenter == null">문의 및 안내 : 홈페이지를 참고하세요</li>
			<li class="list-group-item"
				data-ng-repeat="intro in localIntroDetail"
				data-ng-if="intro.infocenter != null">문의 및 안내 :
				{{intro.infocenter}}</li>
			<li class="list-group-item"
				data-ng-repeat="intro in localIntroDetail"
				data-ng-if="intro.parking == null">주 차 장 : 없음</li>

			<li class="list-group-item"
				data-ng-repeat="intro in localIntroDetail"
				data-ng-if="intro.parking != null">주 차 장 : {{intro.parking}}</li>

			<li class="list-group-item"
				data-ng-repeat="intro in localIntroDetail"
				data-ng-if="intro.restdate == null">쉬 는 날 : 홈페이지 참조하세요</li>
			<li class="list-group-item"
				data-ng-repeat="intro in localIntroDetail"
				data-ng-if="intro.restdate != null">쉬 는 날 : {{intro.restdate}}
			</li>
			<li class="list-group-item"
				data-ng-repeat="intro in localIntroDetail"
				data-ng-if="intro.usetime == null">이 용 시 간 : 24시간</li>
			<li class="list-group-item"
				data-ng-repeat="intro in localIntroDetail"
				data-ng-if="intro.usetime!= null">이 용 시 간 : {{intro.usetime}}</li>
			<li class="list-group-item"
				data-ng-repeat="common in localCommonDetail"
				data-ng-if="common.homepagee == null">홈 페 이 지 : 없습니다.</li>
			<li class="list-group-item"
				data-ng-repeat="common in localCommonDetail"
				data-ng-if="common.homepage != null">홈 페 이 지 :
				{{common.homepage}}</li>
		</ul>
	</div>

