<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf"%>

<section class="container">

	<h3>{{searchDetailCommon[0].title}}</h3>
	<hr>
	<div align="center">
		<carousel> <slide> <img
			ng-src="{{searchDetailCommon[0].firstimage}}"
			style="margin: auto; width: auto; min-height: 200px; max-height: 400px;">
		</slide> <slide data-ng-repeat="s in searchDetailImage"> <img
			ng-src="{{s.originimgurl}}"
			style="margin: auto; width: auto; min-height: 200px; max-height: 400px;">
		</slide> </carousel>
	</div>
	<hr>
	<tabset justified="true"> <tab heading="개요"> <span
		data-ng-bind-html="searchDetailCommon[0].overview"></span></tab> <tab
		heading="기본정보"
		ng-click="initialize(searchDetailCommon[0].mapx, searchDetailCommon[0].mapy)">
	<div class="row">
		<div class="col-xs-6">
			<div id="map_canvas" style="width: 100%; height: 300px;"></div>
			<div id="control">
				<input type="button" value="초기화면으로"
					ng-click="setCenter(searchDetailCommon[0].mapx, searchDetailCommon[0].mapy)">
			</div>
		</div>
		<div class="col-xs-6">
			<ul>
				<li>우편번호 : {{searchDetailCommon[0].zipcode}}</li>
				<li>전화명 : {{searchDetailCommon[0].telname}}</li>
				<li>전화번호 : {{searchDetailCommon[0].tel}}</li>
				<li>홈페이지 : <span
					data-ng-bind-html="searchDetailCommon[0].homepage"></span></li>
				<li>주소 : {{searchDetailCommon[0].addr1}}</li>
			</ul>
		</div>
	</div>
	</tab> <tab heading="이용안내">
	<ul data-ng-if="searchDetailIntro[0].contenttypeid == 12 "
		data-ng-repeat="intro in searchDetailIntro">
		<li>유 모 차 사 용 여 부: {{intro.chkbabycarriage}}</li>
		<li>체크카드 사용 여 부: {{intro.chkcreditcard}}</li>
		<li>애완동물 출입가능여부: {{intro.chkpet}}</li>
		<li data-ng-if="intro.infocenter == null">문의 및 안내 : 홈페이지를 참고하세요</li>
		<li data-ng-if="intro.infocenter != null">문의 및 안내 :
			{{intro.infocenter}}</li>
		<li data-ng-if="intro.parking == null">주 차 장 : 없음</li>

		<li data-ng-if="intro.parking != null">주 차 장 : {{intro.parking}}</li>

		<li data-ng-if="intro.restdate == null">쉬 는 날 : 홈페이지 참조하세요</li>
		<li data-ng-if="intro.restdate != null">쉬 는 날 :
			{{intro.restdate}}</li>
		<li data-ng-if="intro.usetime == null">이 용 시 간 : 24시간</li>
		<li data-ng-if="intro.usetime!= null">이 용 시 간 : {{intro.usetime}}</li>
		<li data-ng-if="common.homepagee == null">홈 페 이 지 : 없습니다.</li>

		<li data-ng-if="common.homepage != null">홈 페 이 지 :
			{{common.homepage}}</li>
	</ul>
	<ul data-ng-if="searchDetailIntro[0].contenttypeid == 15"
		data-ng-repeat="event in searchDetailIntro">
		<li data-ng-repeat="event in searchDetailIntro"><b>장 소 :</b>
			{{event.eventplace}}</li>

		<li data-ng-if="event.agelimit == null"><b>연 령 : </b> 모든 연령</li>
		<li data-ng-if="event.agelimit != null"><b>연 령 : </b>
			{{event.agelimit}}</li>

		<li><b>기 간 : </b> {{event.eventstartdate}} -
			{{event.eventenddate}}</li>

		<li><b>전 화 번 호 : </b> {{event.sponsor1tel}}</li>

		<li data-ng-if="event.spendtimefestival == null"><b>행 사 시 간 :
		</b> 홈페이지를 참고해주세요</li>
		<li data-ng-if="event.spendtimefestival != null"><b>행 사 시 간 :
		</b> {{event.spendtimefestival}}</li>

		<li data-ng-if="event.eventhomepage == null"><b>홈 페 이 지 : </b> 없음</li>
		<li data-ng-if="event.eventhomepage != null"><b>홈 페 이 지 : </b> <a
			href="{{event.eventhomepage}}">{{event.eventhomepage}}</a></li>

		<li data-ng-if="event.bookingplace == ''"><b>예 매 : </b> 없음</li>
		<li data-ng-if="event.bookingplace != ''"><b>예 매 : </b> <span
			data-ng-bind-html="event.bookingplace"></span></li>

		<li data-ng-if="event.program == ''"><b>행사 프로그램 : </b> 홈페이지를
			참조하세요</li>
		<li data-ng-if="event.program != ''"><b>행사 프로그램 : </b>
			{{event.program}}</li>

		<li data-ng-if="event.placeinfo == ''"><b>오 시 는 길 : </b> 홈페이지
			참조하세요</li>
		<li data-ng-if="event.placeinfo != ''"><b>오 시 는 길 : </b> <span
			data-ng-bind-html="event.placeinfo"></span></li>
	</ul>
	<ul data-ng-if="searchDetailIntro[0].contenttypeid == 32 ">
		<li></li>
	</ul>
	</tab> <tab heading="상세정보">
	<ul data-ng-if="searchDetailIntro[0].contenttypeid == 12 ">
		<li></li>
	</ul>
	<ul data-ng-if="searchDetailIntro[0].contenttypeid == 15 "
		data-ng-repeat="event in searchDetailInfo">
		<li>
			<h4>{{event.infoname}}</h4>
		</li>
		<li style="list-style: none;" data-ng-bind-html="event.infotext">{{event.infotext}} <br>
		</li>
		

	</ul>
	<ul data-ng-if="searchDetailIntro[0].contenttypeid == 32 ">
		<li></li>
	</ul>
	</tab> </tabset>



</section>