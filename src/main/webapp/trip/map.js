
myApp.controller('mapController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-local';
	
	
	$http.get("/TripWeb/m/map/city").success(function(citys) {
		console.log(citys);
		$scope.citys = citys.response.body.items.item;
	}).error(function() {
		alert("map.city error...");
	});;
	
	$http.get("/TripWeb/m/map/gus?areaCode=1").success(function(gus) {
		$scope.gus = gus.response.body.items.item;
	}).error(function() {
		alert("server error...");
	});
	
	$scope.cityChange = function() {
		var city = $("#city option:selected").val();
		$http.get("/TripWeb/m/map/gus?areaCode="+city).success(function(gus) {
			$scope.gus = gus.response.body.items.item;
		}).error(function() {
			alert("server error...");
		});
	};
	
	$scope.contents = [
	                   {code: '',   name: '전체'},
	                   {code: '12', name: '관광지'},
	                   {code: '14', name: '문화시설'},
	                   {code: '15', name: '축제공연행사'},
	                   {code: '25', name: '여행코스'},
	                   {code: '28', name: '레포츠'},
	                   {code: '32', name: '숙박'},
	                   {code: '38', name: '쇼핑'},
	                   {code: '39', name: '음식점'}
	];
	
	$scope.currentPage = 1;
	$scope.itemsPerPage = 15;
	
	$scope.changePage = function() {
		var city = $("#city option:selected").val();
		var sigunguCode = $("#sigunguCode option:selected").val();
		var contentTypeId = $("#content option:selected").val();
		
		$http.get("/TripWeb/m/map/search?areaCode=" + city + "&sigunguCode=" + sigunguCode + "&contentTypeId="+contentTypeId+ "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(mapResult) {
			$scope.mapResult = mapResult.response.body;
			if(mapResult.response.body.totalCount > 0)
				var i = 0;
				while(mapResult.response.body.items.item[i].mapx == null) {
					i++;
				}
				$scope.mapSearch(mapResult.response.body.items.item[i].mapx, mapResult.response.body.items.item[i].mapy);
		}).error(function() {
			alert('error');
		});
	}
	
	$scope.search = function() {
		var city = $("#city option:selected").val();
		var sigunguCode = $("#sigunguCode option:selected").val();
		var contentTypeId = $("#content option:selected").val();
		
		$http.get("/TripWeb/m/map/search?areaCode=" + city + "&sigunguCode=" + sigunguCode + "&contentTypeId="+contentTypeId+ "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(mapResult) {
			
//			for(i=0; i<mapResult.response.body.items.item.length; i++) {
//				if(mapResult.response.body.items.item[i].mapx == null) {
//					var geocoder = new google.maps.Geocoder();
//					var address = mapResult.response.body.items.item[i].addr1;
//					geocoder.geocode( { "address": address }, function(results, status) {
//					     if (status == google.maps.GeocoderStatus.OK && results.length > 0) {
//					         var location = results[0].geometry.location;
//					         mapResult.response.body.items.item[i].splice({"mapx":"ddd"});
//					         console.log(mapResult.response.body.items.item[i]);
//					         mapResult.response.body.items.item[i].mapy = location.A;
//					         console.log(location);
//					     }
//					 });
//				}
//			}
			
			$scope.mapResult = mapResult.response.body;
			if(mapResult.response.body.totalCount > 0)
				var i = 0;
				while(mapResult.response.body.items.item[i].mapx == null) {
					i++;
				}
				$scope.mapSearch(mapResult.response.body.items.item[i].mapx, mapResult.response.body.items.item[i].mapy);
		}).error(function() {
			alert('error');
		});	
		
	};
	
	$scope.$on('mapInitialized', function(event, map) { 
//		alert("mapInitialized...");
		$scope.mapSearch = function(mapx, mapy) {
			map.panTo({lat:mapy, lng:mapx});
		}
		
		
//		var geocoder = new google.maps.Geocoder();
//		geocoder.geocode( { "address": "서울특별시 강서구 화곡4동 799-9번지" }, function(results, status) {
//		     if (status == google.maps.GeocoderStatus.OK && results.length > 0) {
//		         var location = results[0].geometry.location;
//		         alert(location.A);
//		         alert(location.F);
//		         console.log(location.A);
//		     }
//		 });
//		
	});
	
});