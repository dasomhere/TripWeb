<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>
<!DOCTYPE html>
<html data-ng-app="tourApp">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1.0">

<c:url var="jquery" value="/node_modules/jquery/dist"/>
<c:url var="bootstrap" value="/node_modules/bootstrap/dist"/>
<c:url var="angular" value="/node_modules/angular"/>
<c:url var="angularSanitize" value="/node_modules/angular-sanitize"/>
<c:url var="angularAnimate" value="/node_modules/angular-animate"/>
<c:url var="angularRoute" value="/node_modules/angular-route"/>
<c:url var="angularBootstrap" value="/node_modules/angular-bootstrap/dist"/>

<c:url var="font" value="/css/font.css"/>

<link rel="stylesheet" href="${bootstrap}/css/bootstrap.min.css"/>

<script type="text/javascript" src="${jquery}/jquery.min.js"></script>
<script type="text/javascript" src="${bootstrap}/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${angular}/angular.min.js"></script>
<script type="text/javascript" src="${angularSanitize}/angular-sanitize.min.js"></script>
<script type="text/javascript" src="${angularAnimate}/angular-animate.min.js"></script>
<script type="text/javascript" src="${angularRoute}/angular-route.min.js"></script>
<script type="text/javascript" src="${angularBootstrap}/ui-bootstrap.min.js"></script>
<script type="text/javascript" src="${angularBootstrap}/ui-bootstrap-tpls.min.js"></script>
<script type="text/javascript"
    src="http://maps.google.com/maps/api/js?sensor=false&region=KR">
</script>
<link rel="stylesheet" type="text/css" href="${font}">

<script type="text/javascript">

var StreetViewPanorama = new function(){}

var globalMap;
var globalMarker;
var globalGeocoder;

// 맵 초기화
function initialize(x, y) {
     // 입력된 좌표가 없으면 기본좌표를 역삼동으로 설정.
    if(x==0){ x=38.070021248208604; }
    if(y==0){ y=127.32001695388293; }

    globalGeocoder = new google.maps.Geocoder();

    var latlng = new google.maps.LatLng(x, y);

    var myOptions = {
        zoom: 16,

        //disableDoubleClickZoom:false,
        center: latlng,
        
        navigationControl: false,    // 눈금자 형태로 스케일 조절하는 컨트롤 활성화 선택.
        navigationControlOptions: {
            position: google.maps.ControlPosition.TOP_RIGHT,
            style: google.maps.NavigationControlStyle.DEFAULT // ANDROID, DEFAULT, SMALL, ZOOM_PAN
        },
        
        streetViewControl: false,

        scaleControl: false,    // 지도 축적 보여줄 것인지.
        //scaleControlOptions: { position: google.maps.ControlPosition.TOP_RIGHT },
        
        mapTypeControl: false, // 지도,위성,하이브리드 등등 선택 컨트롤 보여줄 것인지
        mapTypeId: google.maps.MapTypeId.ROADMAP  // HYBRID, ROADMAP, SATELLITE, TERRAIN
    };

    globalMap = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

    var markerOptions = {
            position: globalMap.getCenter(),
            draggable: false,
            map: globalMap,
            visible: true
        };

    globalMarker = new google.maps.Marker(markerOptions);
}

// 특정좌표로 이동하기
function setMark(x, y){
    var loc = new google.maps.LatLng(38.070021248208604, 127.32001695388293);

    globalMap.setCenter(loc);
    
}



</script>

<style type="text/css">
  .navbar-brand-centered {
        position: absolute;
        left: 50%;
        display: block;
        width: 160px;
        text-align: center;
        background-color: #eee;
    }
    .navbar>.container .navbar-brand-centered, 
    .navbar>.container-fluid .navbar-brand-centered {
        margin-left: -80px;
    }
/*  html { height: 100% } */
/*   body { height: 100%; margin: 0px; padding: 0px; font-size: 9pt; } */

/*     div { float:left; } */

/*     #map_canvas { width: 800px; height: 500px } */

/*     #control {  } */

/*     input { font-size: 9pt; } */
</style>

<link rel="stylesheet" href="style.css"/>

<title>test.jsp</title>

</head>

<body class="container" onload="initialize(0,0)">
<!--   <div id="map_canvas"></div> -->

<!--     <div id="control"> -->
<!--         <dl> -->
<!--             <dd> -->
<!--                 <input type="button" value="맵 중앙에 마크찍기" onClick="setMark();"> -->
<!--                 </dd> -->
<!--                 </dl> -->
<!--     </div> -->
    
   <div class="row">
		<div class="col-xs-6">
			 <div id="map_canvas" style="width: 100%; height: 300px;"></div>
			 <div id="control">
		         <input type="button" value="맵 중앙에 마크찍기" onClick="setMark()">
			 </div>
		
		</div>
	
		<div class="col-xs-6">
			<ul>
				<li>우편번호 : </li>
				<li>전화명 :</li>
				<li>전화번호 :</li>
				<li>홈페이지 :</li>
				<li>주소 : </li>
			</ul>
		</div>
	</div>
</body> 
</html>