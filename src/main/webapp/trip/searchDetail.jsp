<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf"%>

<section class="container">

	<h3>{{searchDetailCommon[0].title}}</h3>
	<hr>
	<div align="center">
		<carousel> 
			<slide> 
				<img ng-src="{{searchDetailCommon[0].firstimage}}" style="margin: auto; width: auto; min-height: 200px; max-height: 400px;">
			</slide> 
			<slide data-ng-repeat="s in searchDetailImage">
				<img ng-src="{{s.originimgurl}}" style="margin: auto; width: auto; min-height: 200px; max-height: 400px;">
			</slide>
		</carousel>
	</div>
	<hr>
	<tabset justified="true"> 
		 
		<tab heading="기본정보">
			<div class="row">
				<div class="col-xs-6">
					
				</div>
				<div class="col-xs-6">
					<ul>
						<li>우편번호 : {{searchDetailCommon[0].zipcode}}</li>
						<li>전화명 : {{searchDetailCommon[0].telname}}</li>
						<li>전화번호 : {{searchDetailCommon[0].tel}}</li>
						<li data-ng-hide="intro.homepage == null">홈페이지 : <span
							data-ng-bind-html="searchDetailCommon[0].homepage"></span></li>
						<li>주소 : {{searchDetailCommon[0].addr1}}</li>
					</ul>
				</div>
			</div>
	
		</tab>
		
		<tab heading="개요"> 
			<span data-ng-bind-html="searchDetailCommon[0].overview">
			</span>
		</tab>
		
		<tab heading="이용안내">
	
		<ul data-ng-if="searchDetailIntro[0].contenttypeid == 12 "
			data-ng-repeat="intro in searchDetailIntro">
			
			<li data-ng-hide="intro.infocenter == null"><b>문의 및 안내 :</b>
				{{intro.infocenter}}</li>
				
			<li data-ng-hide="intro.parking == null"><b>주 차 장 :</b> {{intro.parking}}</li>
			
			<li data-ng-hide="intro.restdate == null"><b>쉬 는 날 : </b>
				{{intro.restdate}}</li>
				
			<li data-ng-hide="intro.usetime == null"><b>이 용 시 간 :</b> {{intro.usetime}}</li>
			
			<li data-ng-hide="intro.homepage == null"><b>홈 페 이 지 : </b>
				{{intro.homepage}}</li>
				
			<li><b>유 모 차 사 용 여 부:</b> {{intro.chkbabycarriage}}</li>
			
			<li><b>신용카드 사용 여 부:</b> {{intro.chkcreditcard}}</li>
			
			<li><b>애완동물 출입가능여부:</b> {{intro.chkpet}}</li>
		</ul>
		
		<ul data-ng-if="searchDetailIntro[0].contenttypeid == 14 "
			data-ng-repeat="culture in searchDetailIntro">
			
			<li data-ng-bind-html="culture.scale"><b>규 모 :</b> {{culture.scale}}</li>
			
			<li><b>수용 가능 인원 :</b> {{culture.accomcountculture}}</li>
			
			<li data-ng-hide="culture.infocenterculture == null"><b>문의 및 안내 :</b>
				{{culture.infocenterculture}}</li>
				
			<li data-ng-hide="culture.spendtime == null"><b>관람 소요시간 :</b> {{culture.spendtime}}</li>	
			
			<li data-ng-hide="culture.usefee == ''"><b>이 용 요 금 :</b> {{culture.usefee}}</li>
				
			<li data-ng-hide="culture.usetimeculture == null"
				data-ng-bind-html="culture.usetimeculture"><b>이 용 시 간 :</b> {{culture.usetimeculture}}</li>
			
			<li data-ng-hide="culture.discountinfo == null"><b>할 인 정 보 :</b> {{culture.discountinfo}}</li>	
				
			<li data-ng-hide="culture.parking == null"><b>주 차 장 :</b> {{culture.parking}}</li>
			
			<li data-ng-hide="culture.parkingfee == ''"><b>주 차 요 금 :</b> {{culture.parkingfee}}</li>
			
			<li data-ng-hide="culture.restdateculture == null"><b>쉬 는 날 : </b>
				{{culture.restdateculture}}</li>
				
			<li><b>유 모 차 사 용 여 부:</b> {{culture.chkbabycarriage}}</li>
			
			<li><b>신용카드 사용 여 부:</b> {{culture.chkcreditcard}}</li>
			
			<li><b>애완동물 출입가능여부:</b> {{culture.chkpet}}</li>
			
		</ul>
		
		<ul data-ng-if="searchDetailIntro[0].contenttypeid == 15"
			data-ng-repeat="event in searchDetailIntro">
			<li><b>장 소 :</b> {{event.eventplace}}</li>
	
			<li data-ng-hide="event.agelimit == null"><b>연 령 : </b>
				{{event.agelimit}}</li>
	
			<li><b>기 간 : </b> {{event.eventstartdate}} -
				{{event.eventenddate}}</li>
	
			<li><b>전 화 번 호 : </b> {{event.sponsor1tel}}</li>
	
			<li data-ng-hide="event.spendtimefestival == null"><b>행 사 시 간 :
			</b> {{event.spendtimefestival}}</li>
	
			<li data-ng-hide="event.eventhomepage == null"><b>홈 페 이 지 : </b> <a
				href="{{event.eventhomepage}}">{{event.eventhomepage}}</a></li>
	
			<li data-ng-hide="event.bookingplace == ''"><b>예 매 : </b> <span
				data-ng-bind-html="event.bookingplace"></span></li>
	
			<li data-ng-hide="event.program == ''"><b>행사 프로그램 : </b>
				{{event.program}}</li>
	
			<li data-ng-hide="event.placeinfo == ''"><b>오 시 는 길 : </b> <span
				data-ng-bind-html="event.placeinfo"></span></li>
		</ul>
		
		<ul data-ng-if="searchDetailIntro[0].contenttypeid == 25"
			data-ng-repeat="course in searchDetailIntro">
			<li><b>코 스 총 거 리 :</b> {{course.distance}}</li>
			
			<li><b>코스 총 소요시간 :</b> {{course.taketime}}</li>
			
			<li data-ng-hide="course.schedule == null"><b>코 스 일 정 :
			</b> {{course.schedule}}</li>
			
			<li data-ng-hide="course.theme == null"><b>코 스 테 마 :
			</b> {{course.theme}}</li>
			
			<li data-ng-hide="course.infocentertourcourse == null"><b>문 의 및 안 내 :
			</b> {{course.infocentertourcourse}}</li>
			
		</ul>	
		
		<ul data-ng-if="searchDetailIntro[0].contenttypeid == 28"
			data-ng-repeat="leports in searchDetailIntro">
			
			<li data-ng-hide="leports.scaleleports == null"><b>규 모 :
			</b> {{leports.scaleleports}}</li>
			
			<li data-ng-hide="leports.accomcountleports == null"><b>수 용 인 원 :
			</b> {{leports.theme}}</li>
			
			<li data-ng-hide="leports.openperiod == null"><b>개 장 기 간 :
			</b> {{leports.openperiod}}</li>
			
			<li data-ng-hide="leports.usetimeleports == null"><b>이 용 시 간 :
			</b> {{leports.usetimeleports}}</li>
			
			<li data-ng-hide="leports.usefeeleports == null"><b>입 장 료 :
			</b> {{leports.usefeeleports}}</li>
			
			<li data-ng-hide="leports.restdateleports == null"><b>쉬 는 날 :
			</b> {{leports.restdateleports}}</li>
			
			<li data-ng-hide="leports.reservation == null"><b>예 약 안 내 :
			</b> {{leports.reservation}}</li>
			
			<li data-ng-hide="leports.infocenterleports == null"><b>문의 및 안내 :
			</b> {{leports.infocenterleports}}</li>
			
			<li data-ng-hide="leports.parkingleports == null"><b>주 차 장 :
			</b> {{leports.parkingleports}}</li>
			
			<li data-ng-hide="leports.parkingfeeleports == null"><b>주 차 요 금 :
			</b> {{leports.parkingfeeleports}}</li>
			
			<li data-ng-hide="leport.expagerangeleports == null"><b>체험 가능 연령 :
			</b> {{leports.expagerangeleports}}</li>
			
			<li data-ng-hide="leports.chkcreditcard == null"><b>신용카드 가능 여부 :
			</b> {{leports.chkcreditcard}}</li>
			
			<li data-ng-hide="leports.chkpet == null"><b>애완동물 가능 여부 :
			</b> {{leports.chkpet}}</li>
			
			<li data-ng-hide="leports.chkbabycarriage == null"><b>유모차 대여 여부 :
			</b> {{leports.chkbabycarriage}}</li>
			
		</ul>
		
		<ul data-ng-if="searchDetailIntro[0].contenttypeid == 32 "
			data-ng-repeat="stay in searchDetailIntro">
			
			<li><b>규 모 :</b> {{stay.scalelodging}}</li>
			
			<li><b>수용 가능 인원 :</b> {{stay.accomcountlodging}}</li>
			
			<li><b>입 실 시 간 :</b> {{stay.checkintime}}</li>
			
			<li><b>퇴 실 시 간 :</b> {{stay.checkouttime}}</li>
			
			<li data-ng-hide="stay.infocenterlodging == null"><b>문의 및 안내 :</b> {{stay.infocenterlodging}}</li>
			
			<li><b>주 차 시 설 :</b> {{stay.parkinglodging}}</li>
			
			<li><b>픽 업 서 비 스 :</b> {{stay.pickup}}</li>
			
			<li><b>예 약 안 내 :</b> {{stay.reservationlodging}}</li>
			
			<li><b>예약 안내 홈페이지 :</b> {{stay.reservationurl}}</li>
			
			<li><b>객 실 수 :</b> {{stay.roomcount}}</li>
			
			<li><b>취 사 여 부 :</b> {{stay.chkcooking}}</li>
			
			<li data-ng-hide="stay.subfacility == ''"><b>식 당 유 무 :</b> {{stay.foodplace}}</li>
			
			<li data-ng-hide="stay.subfacility == 0"><b>부 대 시 설 :</b> 있음</li>
			
			<li data-ng-hide="stay.barbecue == 0"><b>베 메 큐 장 :</b> 있음</li>
			
			<li data-ng-hide="stay.bicycle == 0"><b>자 전 거 대 여 :</b> 있음</li>
			
			<li data-ng-hide="stay.campfire == 0"><b>캠 프 파 이 어 :</b> 있음</li>
			
			<li data-ng-hide="stay.fitness == 0"><b>휘 트 니 스 센 터 :</b> 있음</li>
			
			<li data-ng-hide="stay.karaoke == 0"><b>노 래 방 :</b> 있음</li>
			
			<li data-ng-hide="stay.publicbath == 0"><b>공용 샤워실 :</b> 있음</li>
			
			<li data-ng-hide="stay.publicpc == 0"><b>공용 pc실 :</b> 있음</li>
			
			<li data-ng-hide="stay.sauna == 0"><b>사 우 나 :</b> 있음</li>
			
			<li data-ng-hide="stay.seminar == 0"><b>세 미 나 실 :</b> 있음</li>
			
			<li data-ng-hide="stay.sports == 0"><b>스 포 츠 시 설 :</b> 있음</li>
			
		</ul>
		
		<ul data-ng-if="searchDetailIntro[0].contenttypeid == 38 "
			data-ng-repeat="shopping in searchDetailIntro">
			
			<li data-ng-hide="leports.scaleleports == null"><b>규 모 :
			</b> {{leports.scaleleports}}</li>
			
			<li data-ng-hide="leports.infocenterleports == null"><b>문의 및 안내 :
			</b> {{leports.infocenterleports}}</li>
			
			<li data-ng-hide="leports.parkingleports == null"><b>주 차 장 :
			</b> {{leports.parkingleports}}</li>
							
			<li data-ng-hide="leports.chkcreditcard == null"><b>신용카드 가능 여부 :
			</b> {{leports.chkcreditcard}}</li>
			
			<li data-ng-hide="leports.chkpet == null"><b>애완동물 가능 여부 :
			</b> {{leports.chkpet}}</li>
			
		</ul>	
		
		<ul data-ng-if="searchDetailIntro[0].contenttypeid == 39 "
			data-ng-repeat="food in searchDetailIntro">
			
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