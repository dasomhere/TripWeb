
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
			for(var i=0; i<$scope.mapResult.items.item.length; i++) {
				if($scope.mapResult.items.item[i].mapx == null) {
					var address = $scope.mapResult.items.item[i].addr1;
					$scope.setLocation(address, i);
				}
			}
			
			if($scope.mapResult.totalCount > 0) {
				$scope.citySearch($("#city option:selected").text());
			}
		}).error(function() {
			alert('error');
		});	
	}
	
	$scope.search = function() {
		var city = $("#city option:selected").val();
		var sigunguCode = $("#sigunguCode option:selected").val();
		var contentTypeId = $("#content option:selected").val();
		$http.get("/TripWeb/m/map/search?areaCode=" + city + "&sigunguCode=" + sigunguCode + "&contentTypeId="+contentTypeId+ "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(mapResult) {
			$scope.mapResult = mapResult.response.body;
			for(var i=0; i<$scope.mapResult.items.item.length; i++) {
				if($scope.mapResult.items.item[i].mapx == null) {
					var address = $scope.mapResult.items.item[i].addr1;
					$scope.setLocation(address, i);
				}
			}
			
			if($scope.mapResult.totalCount > 0) {
				$scope.citySearch($("#city option:selected").text());
			}
		}).error(function() {
			alert('error');
		});	
	};
	
	$scope.$on('mapInitialized', function(event, map) { 
//		alert("mapInitialized...");
		
		$scope.citySearch = function(address) {
			
			if($("#sigunguCode option:selected").text() != "전체") {
				address += $(" #sigunguCode option:selected").text();
				
				var geocoder = new google.maps.Geocoder();
				geocoder.geocode( { "address": address }, function(results, status) {
				     if (status == google.maps.GeocoderStatus.OK && results.length > 0) {
				    	 var location = results[0].geometry.location;
				    	 map.panTo({lat:location.A, lng:location.F});
				    	 map.setZoom(13);
				     }
				 });
			}else {
				var geocoder = new google.maps.Geocoder();
				geocoder.geocode( { "address": address }, function(results, status) {
				     if (status == google.maps.GeocoderStatus.OK && results.length > 0) {
				    	 var location = results[0].geometry.location;
				    	 map.panTo({lat:location.A, lng:location.F});
				    	 map.setZoom(11);
				     }
				 });
			}
		}
		
		navigator.geolocation.getCurrentPosition(function(position) {
			  console.log(position.coords.latitude, position.coords.longitude);
			  map.panTo({lat: position.coords.latitude, lng:position.coords.longitude});
			  $scope.marker = new google.maps.Marker({
			        map: map,
			        position: {lat: position.coords.latitude, lng:position.coords.longitude},
			        draggable:true,
			      });

		});
		
		$scope.xxx = function() {
			console.log($scope.marker.position.A);
		}
		
		$scope.mapSearch = function(mapx, mapy) {
			map.panTo({lat:mapy, lng:mapx});
			map.setZoom(17);
		}
		
	});
	
	$scope.setLocation = function(address, index) {
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode( { "address": address }, function(results, status) {
		     if (status == google.maps.GeocoderStatus.OK && results.length > 0) {
		    	 var location = results[0].geometry.location;
		         $scope.mapResult.items.item[index].mapx = location.F;
		         $scope.mapResult.items.item[index].mapy = location.A;
		     }
		 });
	};
	
});