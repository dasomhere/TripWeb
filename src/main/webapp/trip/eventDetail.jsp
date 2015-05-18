<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container"> 
	<h3>{{eventTitle}}</h3>
	<hr>
		

	 	<ul class="list-group">
			
			<li class="list-group-item"
				data-ng-repeat="images in imageDetail">
				
					<img alt="" ng-src="{{images.originimgurl}}" style="width: 250px; height: 200px"> <br>
					<img src="http://placehold.it/150x100/808080/ffffff&text=No Image!" style="width: 200px; height: 250px" ng-hide="images.originimgurl != null"/>
				
			</li>
			
			<li class="list-group-item"
				data-ng-repeat="event in eventDetail"><b>장     소 :</b>
				{{event.eventplace}}</li>
				
			<li class="list-group-item"
				data-ng-repeat="event in eventDetail"
				data-ng-if="event.agelimit == null"><b>연       령 : </b> 모든 연령</li>		
			<li class="list-group-item"
				data-ng-repeat="event in eventDetail"
				data-ng-if="event.agelimit != null"><b>연      령 : </b>
				{{event.agelimit}}</li>
				
			<li class="list-group-item"
				data-ng-repeat="event in eventDetail"><b>기     간 : </b>
				{{event.eventstartdate}} - {{event.eventenddate}}</li>
				
			<li class="list-group-item"
				data-ng-repeat="event in eventDetail"><b>전 화 번 호 : </b>
				{{event.sponsor1tel}}</li>
				
			<li class="list-group-item"
				data-ng-repeat="event in eventDetail"
				data-ng-if="event.spendtimefestival == null"><b>행 사 시 간 : </b> 홈페이지를 참고해주세요</li>
			<li class="list-group-item"
				data-ng-repeat="event in eventDetail"
				data-ng-if="event.spendtimefestival != null"><b>행 사 시 간 : </b>
				{{event.spendtimefestival}}</li>
				
			<li class="list-group-item"
				data-ng-repeat="event in eventDetail"
				data-ng-if="event.eventhomepage == null"><b>홈 페 이 지 : </b> 없음</li>	
			<li class="list-group-item"
				data-ng-repeat="event in eventDetail"
				data-ng-if="event.eventhomepage != null"><b>홈 페 이 지 : </b>
				<a href="{{event.eventhomepage}}">{{event.eventhomepage}}</a></li>
				
			<li class="list-group-item"
				data-ng-repeat="event in eventDetail"
				data-ng-if="event.bookingplace == ''"><b>예      매 : </b> 없음</li>
			<li class="list-group-item"
				data-ng-repeat="event in eventDetail"
				data-ng-if="event.bookingplace != ''"><b>예      매 : </b> 
				<span data-ng-bind-html="event.bookingplace"></span></li>
				
			<li class="list-group-item"
				data-ng-repeat="event in eventDetail"
				data-ng-if="event.program == ''"><b>행사 프로그램 : </b> 홈페이지를 참조하세요</li>
			<li class="list-group-item"
				data-ng-repeat="event in eventDetail"
				data-ng-if="event.program != ''"><b>행사 프로그램 : </b> 
				{{event.program}}</li>
				
			<li class="list-group-item"
				data-ng-repeat="event in eventDetail"
				data-ng-if="event.placeinfo == ''"><b>오 시 는 길 : </b> 홈페이지 참조하세요</li>
			<li class="list-group-item"
				data-ng-repeat="event in eventDetail"
				data-ng-if="event.placeinfo != ''"><b>오 시 는 길 : </b> 
				<span data-ng-bind-html="event.placeinfo"></span>
			</li>
		</ul>

</div>