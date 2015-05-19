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
				<div class="col-sm-6">
					<map center="{{searchDetailCommon[0].mapy}}, {{searchDetailCommon[0].mapx}}" zoom="16">
						<marker position="{{searchDetailCommon[0].mapy}}, {{searchDetailCommon[0].mapx}}"></marker>
					</map>
				</div>
				<div class="col-sm-6">
					<ul>
						<li data-ng-hide="intro.zipcode == null"><b>우편번호 :</b> {{searchDetailCommon[0].zipcode}}</li>
						<li data-ng-hide="intro.telname == null"><b>전화명 : </b> {{searchDetailCommon[0].telname}}</li>
						<li data-ng-hide="intro.tel == null"><b>전화번호 : </b> {{searchDetailCommon[0].tel}}</li>
						<li data-ng-hide="intro.homepage == null"><b>홈페이지 :</b> <span data-ng-bind-html="searchDetailCommon[0].homepage"></span></li>
						<li data-ng-hide="intro.addr1 == null"><b>주소 : </b>{{searchDetailCommon[0].addr1}}</li>
					</ul>
				</div>
			</div>
		</tab>
		
		<tab heading="개요"> 
			<span data-ng-bind-html="searchDetailCommon[0].overview">
			</span>
		</tab>
		
		<tab heading="이용안내">
	
		<ul data-ng-if="searchDetailIntro[0].contenttypeid == 12 " data-ng-repeat="intro in searchDetailIntro">
			
			<li data-ng-hide="intro.infocenter == null"><b>문의 및 안내 :</b>	{{intro.infocenter}}</li>
				
			<li data-ng-hide="intro.parking == null"><b>주 차 장 :</b> {{intro.parking}}</li>
			
			<li data-ng-hide="intro.restdate == null"><b>쉬 는 날 : </b>{{intro.restdate}}</li>
				
			<li data-ng-hide="intro.usetime == null"><b>이 용 시 간 :</b> {{intro.usetime}}</li>
			
			<li data-ng-hide="intro.homepage == null"><b>홈 페 이 지 : </b>{{intro.homepage}}</li>
				
			<li><b>유 모 차 사 용 여 부:</b> {{intro.chkbabycarriage}}</li>
			
			<li><b>신용카드 사용 여 부:</b> {{intro.chkcreditcard}}</li>
			
			<li><b>애완동물 출입가능여부:</b> {{intro.chkpet}}</li>
		</ul>
		
		<ul data-ng-if="searchDetailIntro[0].contenttypeid == 14 " data-ng-repeat="culture in searchDetailIntro">
			
			<li data-ng-bind-html="culture.scale"><b>규 모 :</b> {{culture.scale}}</li>
			
			<li><b>수용 가능 인원 :</b> {{culture.accomcountculture}}</li>
			
			<li data-ng-hide="culture.infocenterculture == null"><b>문의 및 안내 :</b>{{culture.infocenterculture}}</li>
				
			<li data-ng-hide="culture.spendtime == null"><b>관람 소요시간 :</b> {{culture.spendtime}}</li>	
			
			<li data-ng-hide="culture.usefee == ''"><b>이 용 요 금 :</b> {{culture.usefee}}</li>
				
			<li data-ng-hide="culture.usetimeculture == null" data-ng-bind-html="culture.usetimeculture"><b>이 용 시 간 :</b> {{culture.usetimeculture}}</li>
			
			<li data-ng-hide="culture.discountinfo == null"><b>할 인 정 보 :</b> {{culture.discountinfo}}</li>	
				
			<li data-ng-hide="culture.parking == null"><b>주 차 장 :</b> {{culture.parking}}</li>
			
			<li data-ng-hide="culture.parkingfee == ''"><b>주 차 요 금 :</b> {{culture.parkingfee}}</li>
			
			<li data-ng-hide="culture.restdateculture == null"><b>쉬 는 날 : </b> {{culture.restdateculture}}</li>
				
			<li><b>유 모 차 사 용 여 부:</b> {{culture.chkbabycarriage}}</li>
			
			<li><b>신용카드 사용 여 부:</b> {{culture.chkcreditcard}}</li>
			
			<li><b>애완동물 출입가능여부:</b> {{culture.chkpet}}</li>
			
		</ul>
		
		<ul data-ng-if="searchDetailIntro[0].contenttypeid == 15" data-ng-repeat="event in searchDetailIntro">
			<li><b>장 소 :</b> {{event.eventplace}}</li>
	
			<li data-ng-hide="event.agelimit == null"><b>연 령 : </b> {{event.agelimit}}</li>
	
			<li><b>기 간 : </b> {{event.eventstartdate}} -  {{event.eventenddate}}</li>
	
			<li><b>전 화 번 호 : </b> {{event.sponsor1tel}}</li>
	
			<li data-ng-hide="event.spendtimefestival == null"><b>행 사 시 간 : </b> {{event.spendtimefestival}}</li>
	
			<li data-ng-hide="event.eventhomepage == null"><b>홈 페 이 지 : </b> <a href="{{event.eventhomepage}}">{{event.eventhomepage}}</a></li>
	
			<li data-ng-hide="event.bookingplace == ''"><b>예 매 : </b> <span data-ng-bind-html="event.bookingplace"></span></li>
	
			<li data-ng-hide="event.program == ''"><b>행사 프로그램 : </b>{{event.program}}</li>
	
			<li data-ng-hide="event.placeinfo == ''"><b>오 시 는 길 : </b> <span	data-ng-bind-html="event.placeinfo"></span></li>
		</ul>
		
		<ul data-ng-if="searchDetailIntro[0].contenttypeid == 25" data-ng-repeat="course in searchDetailIntro">
			<li><b>코 스 총 거 리 :</b> {{course.distance}}</li>
			
			<li><b>코스 총 소요시간 :</b> {{course.taketime}}</li>
			
			<li data-ng-hide="course.schedule == null"><b>코 스 일 정 : </b> {{course.schedule}}</li>
			
			<li data-ng-hide="course.theme == null"><b>코 스 테 마 : </b> {{course.theme}}</li>
			
			<li data-ng-hide="course.infocentertourcourse == null"><b>문 의 및 안 내 : </b> {{course.infocentertourcourse}}</li>
			
		</ul>	
		
		<ul data-ng-if="searchDetailIntro[0].contenttypeid == 28" data-ng-repeat="leports in searchDetailIntro">
			
			<li data-ng-hide="leports.scaleleports == null"><b>규 모 : </b> {{leports.scaleleports}}</li>
			
			<li data-ng-hide="leports.accomcountleports == null"><b>수 용 인 원 : </b> {{leports.theme}}</li>
			
			<li data-ng-hide="leports.openperiod == null"><b>개 장 기 간 : </b> {{leports.openperiod}}</li>
			
			<li data-ng-hide="leports.usetimeleports == null"><b>이 용 시 간 : </b> {{leports.usetimeleports}}</li>
			
			<li data-ng-hide="leports.usefeeleports == null"><b>입 장 료 : </b> {{leports.usefeeleports}}</li> 
			
			<li data-ng-hide="leports.restdateleports == null"><b>쉬 는 날 : </b> {{leports.restdateleports}}</li>
			
			<li data-ng-hide="leports.reservation == null"><b>예 약 안 내 : </b> {{leports.reservation}}</li>
			
			<li data-ng-hide="leports.infocenterleports == null"><b>문의 및 안내 : </b> {{leports.infocenterleports}}</li>
			
			<li data-ng-hide="leports.parkingleports == null"><b>주 차 장 : </b> {{leports.parkingleports}}</li>
			
			<li data-ng-hide="leports.parkingfeeleports == null"><b>주 차 요 금 : </b> {{leports.parkingfeeleports}}</li>
			
			<li data-ng-hide="leport.expagerangeleports == null"><b>체험 가능 연령 : </b> {{leports.expagerangeleports}}</li>
			
			<li data-ng-hide="leports.chkcreditcard == null"><b>신용카드 가능 여부 : </b> {{leports.chkcreditcard}}</li>
			
			<li data-ng-hide="leports.chkpet == null"><b>애완동물 가능 여부 : </b> {{leports.chkpet}}</li>
			
			<li data-ng-hide="leports.chkbabycarriage == null"><b>유모차 대여 여부 : </b> {{leports.chkbabycarriage}}</li>
			
		</ul>
		
		<ul data-ng-if="searchDetailIntro[0].contenttypeid == 32 " data-ng-repeat="stay in searchDetailIntro">
			
			<li data-ng-hide="stay.scalelodging == null"><b>규 모 :</b> {{stay.scalelodging}}</li>
			
			<li data-ng-hide="stay.accomcountlodging == null"><b>수용 가능 인원 :</b> {{stay.accomcountlodging}}</li>
			
			<li data-ng-hide="stay.checkintime == null"><b>입 실 시 간 :</b> {{stay.checkintime}}</li>
			
			<li data-ng-hide="stay.checkouttime == null"><b>퇴 실 시 간 :</b> {{stay.checkouttime}}</li>
			
			<li data-ng-hide="stay.infocenterlodging == null"><b>문의 및 안내 :</b> {{stay.infocenterlodging}}</li>
			
			<li data-ng-hide="stay.parkinglodging == null"><b>주 차 시 설 :</b> {{stay.parkinglodging}}</li>
			
			<li data-ng-hide="stay.pickup == null"><b>픽 업 서 비 스 :</b> {{stay.pickup}}</li>
			
			<li data-ng-hide="stay.reservationlodging == null"><b>예 약 안 내 :</b> {{stay.reservationlodging}}</li>
			
			<li data-ng-hide="stay.reservationurl == null"><b>예약 안내 홈페이지 :</b> {{stay.reservationurl}}</li>
			
			<li data-ng-hide="stay.roomcount == null"><b>객 실 수 :</b> {{stay.roomcount}}</li>
			
			<li data-ng-hide="stay.chkcooking == null"><b>취 사 여 부 :</b> {{stay.chkcooking}}</li>
			
			<li data-ng-hide="stay.foodplace == ''"><b>식 당 유 무 :</b> {{stay.foodplace}}</li>
			
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
		
		<ul data-ng-if="searchDetailIntro[0].contenttypeid == 38 " data-ng-repeat="shopping in searchDetailIntro">
			
			<li data-ng-hide="shopping.scaleshopping == null"><b>규 모 : </b> {{shopping.scaleshopping}}</li>
			
			<li data-ng-hide="shopping.opendateshopping == null"><b>개 장 일 : </b> {{shopping.opendateshopping}}</li>
			
			<li data-ng-hide="shopping.opentime == null"><b>영 업 시 간 : </b> {{shopping.opentime}}</li>
			 
			<li data-ng-hide="shopping.restdateshopping == null"><b>쉬 는 날 : </b> {{shopping.restdateshopping}}</li> 
			
			<li data-ng-hide="shopping.parkingshopping == null"><b>주 차 시 설 : </b> {{shopping.parkingshopping}}</li>
			
			<li data-ng-hide="shopping.restroom == null"><b>화 장 실 : </b> {{shopping.restroom}}</li>
			
			<li data-ng-hide="shopping.saleitem == null"><b>판 매 품 목 : </b> {{shopping.saleitem}}</li>
			
			<li data-ng-hide="shopping.saleitemcost == ''"><b>판 매 가 격 : </b> {{shopping.saleitemcost}}</li>
			
			<li data-ng-hide="shopping.culturecenter == null"><b>문화센터 바로가기 : </b> {{shopping.culturecenter}}</li>
			
			<li data-ng-hide="shopping.fairday == null"><b>장서는 날 : </b> {{shopping.fairday}}</li>
			
			<li data-ng-hide="shopping.infocentershpping == null"><b>문의 및 안내 : </b> {{shopping.infocenterleports}}</li>
			
			<li data-ng-hide="shopping.shopguide == ''"><b>매 장 안 내 : </b> {{shopping.shopguide}}</li> 
							
			<li data-ng-hide="shopping.chkcreditcard == null"><b>신용카드 가능 여부 : </b> {{shopping.chkcreditcard}}</li>
			
			<li data-ng-hide="shopping.chkbabycarriage == null"><b>유모차 대여 여부 : </b> {{shopping.chkbabycarriage}}</li>
			
			<li data-ng-hide="shopping.chkpet == null"><b>애완동물 가능 여부 : </b> {{shopping.chkpet}}</li>
			
		</ul>	
		
		<ul data-ng-if="searchDetailIntro[0].contenttypeid == 39 " data-ng-repeat="food in searchDetailIntro">
			
			<li data-ng-hide="food.firstmenu == null"><b>대 표 매 뉴 : </b> {{food.firstmenu}}</li>
			
			<li data-ng-hide="food.opentimefood == null"><b>영 업 시 간 : </b> {{food.opentimefood}}</li>
			
			<li data-ng-hide="food.scalefood == null"><b>규 모 : </b> {{food.scalefood}}</li>
			
			<li data-ng-hide="food.seat == null"><b>좌 석 : </b> {{food.seat}}</li>
			
			<li data-ng-hide="food.infocenterfood == null"><b>문의 및 안내 : </b> {{food.infocenterfood}}</li>
			
			<li data-ng-hide="food.restdatefood == null"><b>쉬 는 날 : </b> {{food.restdatefood}}</li>
			
			<li data-ng-hide="food.reservationfood == null"><b>예 약 안 내 : </b> {{food.reservationfood}}</li>
			
			<li data-ng-hide="food.treatmenu == null"><b>취 급 메 뉴 : </b> {{food.treatmenu}}</li>
			
			<li data-ng-hide="food.parkingfood == null"><b>주 차 장 : </b> {{food.parkingfood}}</li>
			
			<li data-ng-hide="food.packing == null"><b>포장 가능 여부 : </b> {{food.packing}}</li>
			
			<li data-ng-hide="food.chkcreditcard == null"><b>신용카드 가능 여부 : </b> {{food.chkcreditcard}}</li>
			
			<li data-ng-hide="food.discountinfofood == null"><b>할 인 정 보 : </b> {{food.discountinfofood}}</li>
			
			<li data-ng-hide="food.smoking == null"><b>흡 연 여 부 : </b> {{food.smoking}}</li>
			
			<li data-ng-hide="food.kidsfacility == 0"><b>어린이 놀이방 : </b> 있음</li>
			
		</ul>	
		
		</tab>
		
		<tab heading="상세정보"> 
		<ul data-ng-if="searchDetailInfo[0].contenttypeid == 12 " data-ng-repeat="info in searchDetailInfo">
			
			<li> <h4>{{info.infoname}}</h4> </li>
			<li style="list-style: none;" data-ng-bind-html="info.infotext">{{info.infotext}} <br>
			</li>
		</ul>
		
		<ul data-ng-if="searchDetailInfo[0].contenttypeid == 14 " data-ng-repeat="culture in searchDetailInfo">
			
			<li> <h4>{{culture.infoname}}</h4> </li>
			<li style="list-style: none;" data-ng-bind-html="culture.infotext">{{culture.infotext}} <br>
			</li>
		</ul>
		
		<ul data-ng-if="searchDetailInfo[0].contenttypeid == 15 " data-ng-repeat="event in searchDetailInfo">
			
			<li> <h4>{{event.infoname}}</h4> </li>
			<li style="list-style: none;" data-ng-bind-html="event.infotext">{{event.infotext}} <br>
			</li>
			
		</ul>
		
		<ul data-ng-if="searchDetailInfo[0].contenttypeid == 25 " data-ng-repeat="course in searchDetailInfo">
		
	 			 <li>{{course.subnum}}.코스 : {{course.subname}}</li>
	 			 <li style="list-style: none;" data-ng-hide="course.subdetailimg == null"><img src="{{course.subdetailimg}}" style="width: 150px; height: 100px"/></li>
	 			 <li style="list-style: none;">{{course.subdetailoverview}}</li>
	
		</ul>
		
		<ul data-ng-if="searchDetailInfo[0].contenttypeid == 28 " data-ng-repeat="leports in searchDetailInfo">
			
			<li> <h4>{{leports.infoname}}</h4> </li>
			<li style="list-style: none;" data-ng-bind-html="leports.infotext">{{leports.infotext}} <br>
			</li>
			
		</ul>
		
		<ul data-ng-if="searchDetailInfo[0].contenttypeid == 32 " data-ng-repeat="stay in searchDetailInfo">
		
			<li style="list-style: none;" data-ng-hide="stay.roomtitle == null"><h4><b>◆ 객 실 명 칭 : </b> {{stay.roomtitle}}</h4></li>
			
			<li style="list-style: none;" data-ng-hide="stay.roomimg1 == null"><img alt="" data-ng-src="{{stay.roomimg1}}"> </li>
			
			<li style="list-style: none;" data-ng-hide="stay.roomimg2 == null"><img alt="" data-ng-src="{{stay.roomimg2}}"> </li>
			
			<li style="list-style: none;" data-ng-hide="stay.roomimg3 == null"><img alt="" data-ng-src="{{stay.roomimg3}}"> </li>
			
			<li style="list-style: none;" data-ng-hide="stay.roomimg4 == null"><img alt="" data-ng-src="{{stay.roomimg4}}"> </li>
			
			<li style="list-style: none;" data-ng-hide="stay.roomimg5 == null"><img alt="" data-ng-src="{{stay.roomimg5}}"> </li>
			
			<li data-ng-hide="stay.roomcount == null"><b>객 실 수 : </b> {{stay.roomcount}}</li>
			
			<li data-ng-hide="stay.roomsize1 == null"><b>객 실 크 기(평) : </b> {{stay.roomsize1}}</li>
			
<<<<<<< HEAD
			<li data-ng-hide="stay.roomsize2 == null"><b>객 실 크 기(미터) : </b> {{stay.roomsize2}}</li>
=======
			<li data-ng-hide="stay.roomsize2 == null"><b>객 실 크 기(미터) : </b> {{stay.roomsize12}}</li>
>>>>>>> c34799d9082e1854c01ce00b4f014e049a781cbe
			
			<li data-ng-hide="stay.roombasecount == null"><b>기 준 인 원 : </b> {{stay.roombasecount}}</li>
			
			<li data-ng-hide="stay.roommaxcount == null"><b>최 대 인 원 : </b> {{stay.roommaxcount}}</li>
			
			<li data-ng-hide="stay.roomoffseasonminfee1 == null"><b>비수기 주중최소 : </b> {{stay.roomoffseasonminfee1}}</li>
			
			<li data-ng-hide="stay.roomoffseasonminfee2 == null"><b>비수기 주말최소 : </b> {{stay.roomoffseasonminfee2}}</li>
			
			<li data-ng-hide="stay.roompeakseasonminfee1 == null"><b>성수기 주중최소 : </b> {{stay.roompeakseasonminfee1}}</li>
			
			<li data-ng-hide="stay.roompeakseasonminfee2 == null"><b>성수기 주말최소 : </b> {{stay.roompeakseasonminfee2}}</li>
			
			<li data-ng-hide="stay.roomintro == null"><b>객 실 소 개 : </b> {{stay.roomintro}}</li>
			
			<li data-ng-hide="stay.roombathfacility == null"><b>목 욕 시 설 : </b> {{stay.roombathfacility}}</li>
			
			<li data-ng-hide="stay.roombath == null"><b>욕 조 유 무 : </b> {{stay.roombath}}</li>
			
			<li data-ng-hide="stay.roomhometheater == null"><b>홈 시 어 터 유 무 : </b> {{stay.roomhometheater}}</li>
			
			<li data-ng-hide="stay.roomaircondition == null"><b>에 어 컨 유 무 : </b> {{stay.roomaircondition}}</li>
			
			<li data-ng-hide="stay.roomtv == null"><b>T V 유 무 : </b> {{stay.roomtv}}</li>
			
			<li data-ng-hide="stay.roompc == null"><b>P C 유 무 : </b> {{stay.roompc}}</li>
			
			<li data-ng-hide="stay.roomcable == null"><b>케 이 블 설 치 : </b> {{stay.roomcable}}</li>
			
			<li data-ng-hide="stay.roominternet == null"><b>인 터 넷 : </b> {{stay.roominternet}}</li>
			
			<li data-ng-hide="stay.roomrefrigerator == null"><b>냉 장 고 유 무 : </b> {{stay.roomrefrigerator}}</li>
			
			<li data-ng-hide="stay.roomtoiletries == null"><b>세 면 도 구 : </b> {{stay.roomtoiletries}}</li>
			
			<li data-ng-hide="stay.roomsofa == null"><b>소 파 유 무 : </b> {{stay.roomsofa}}</li>
			
			<li data-ng-hide="stay.roomcook == null"><b>취 사 용 품 : </b> {{stay.roomcook}}</li>
			
			<li data-ng-hide="stay.roomTable == null"><b>테 이 블 유 무 : </b> {{stay.roomTable}}</li>
			
			<li data-ng-hide="stay.roomhairdryer == null"><b>드 라 이 기 : </b> {{stay.roomhairdryer}}</li>
			
			<hr>
			
		</ul>
		
		<ul data-ng-if="searchDetailInfo[0].contenttypeid == 39 " data-ng-repeat="food in searchDetailInfo">
			
			<li> <h4>{{food.infoname}}</h4> </li>
			<li style="list-style: none;" data-ng-bind-html="food.infotext">{{food.infotext}} <br>
			</li>
			
		</ul>
	
	</tab>
	
	</tabset>

</section>