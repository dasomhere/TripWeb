
myApp.controller('searchDetailController', function($scope, $http, $routeParams) {
	$scope.$parent.pageClass = 'page-load';
	
	
	
	$http.get("/TripWeb/m/search/detailImage?contentId=" + $routeParams.contentid).success(function(searchDetailImage) {
		$scope.searchDetailImage = searchDetailImage.response.body.items.item;
	}).error(function() {
		alert("searchDetailImage error...");
	});
	
	$http.get("/TripWeb/m/search/detailCommon?contentId=" + $routeParams.contentid).success(function(searchDetailCommon) {
		$scope.searchDetailCommon = searchDetailCommon.response.body.items.item;
		
//		$scope.initialize(0, 0);
		
	}).error(function() {
		alert("searchDetailCommon error...");
	});
	
	$http.get("/TripWeb/m/search/detailIntro?contentId=" + $routeParams.contentid + "&contentTypeId=" + $routeParams.contenttypeid).success(function(searchDetailIntro) {
		$scope.searchDetailIntro = searchDetailIntro.response.body.items.item;
	}).error(function() {
		alert("searchDetailIntro error...");
	});
	
	$http.get("/TripWeb/m/search/detailInfo?contentId=" + $routeParams.contentid + "&contentTypeId=" + $routeParams.contenttypeid).success(function(searchDetailInfo) {
		$scope.searchDetailInfo = searchDetailInfo.response.body.items.item;
	}).error(function() {
		alert("searchDetailInfo error...");
	});
	
	var StreetViewPanorama = new function(){}

	var globalMap;
	var globalMarker;
	
	$scope.initialize = function(x, y) {
		
	     // 입력된 좌표가 없으면 기본좌표를 역삼동으로 설정.
	    if(x==0){ x=38.070021248208604; }
	    if(y==0){ y=127.32001695388293; }

	    globalGeocoder = new google.maps.Geocoder();

	    var latlng = new google.maps.LatLng(y, x);

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
	
	$scope.setCenter = function(x, y) {
	    var loc = new google.maps.LatLng(y, x);

	    globalMap.setCenter(loc);
	    globalMap.setZoom(16);
	}
	
});
