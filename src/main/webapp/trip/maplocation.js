
myApp.controller('maplocationController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-local';
	
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
		var contentTypeId = $("#content option:selected").val();
		var radius = $("#radius option:selected").val();
		console.log($scope.marker.position.A + "," + $scope.marker.position.F)
		$http.get("/TripWeb/m/maplocation/search?contentTypeId=" + contentTypeId + "&mapX=" + $scope.marker.position.F + "&mapY="+ $scope.marker.position.A + "&radius=" + radius + "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(mapResult) {
			$scope.mapResult = mapResult.response.body;
			
		}).error(function() {
			alert('error');
		});	
	};
	
	$scope.$on('mapInitialized', function(event, map) { 
//		alert("mapInitialized...");
		
		
		
		var marker = new google.maps.Marker({
	        map: map,
	        position: {lat: 37.5, lng:127},
	        draggable:true,
	      });
		navigator.geolocation.getCurrentPosition(function(position) {
			  console.log(position.coords.latitude, position.coords.longitude);
			  map.panTo({lat: position.coords.latitude, lng:position.coords.longitude});
			  marker.setPosition({lat: position.coords.latitude, lng:position.coords.longitude});
			  
			  $scope.getAddr(marker.getPosition());
		});
		console.log(marker);
		google.maps.event.addListener(marker, 'dragend', function() {
		    map.setCenter(marker.getPosition());
		    console.log(marker.getPosition());
		    
		    $scope.getAddr(marker.getPosition());
		});
		$scope.marker = marker;
		
		$scope.mapSearch = function(mapx, mapy) {
			map.panTo({lat:mapy, lng:mapx});
			map.setZoom(17);
		}
		
	});
	
	$scope.getAddr = function(latLng) {
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({'latLng': latLng}, function(results, status) {
	        if (status == google.maps.GeocoderStatus.OK) {
	          if (results[1]) {
	        	$("#location").text(results[1].formatted_address);
	          } else {
	            alert('No results found');
	          }
	        } else {
	          alert('Geocoder failed due to: ' + status);
	        }
	    });
	}
	
});