
myApp.controller('maplocationController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-maplocation'; $scope.$parent.nowPage = '주변검색';
	
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
		var contentTypeId = $("#content option:selected").val();
		var radius = $("#radius option:selected").val();
		console.log($scope.marker.position.A + "," + $scope.marker.position.F)
		$http.get("/TripWeb/m/maplocation/search?contentTypeId=" + contentTypeId + "&mapX=" + $scope.marker.position.F + "&mapY="+ $scope.marker.position.A + "&radius=" + radius + "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(mapResult) {
			$scope.mapResult = mapResult.response.body;
			
		}).error(function() {
			alert('error');
		});	
	}
	
	$scope.search = function() {
		$scope.currentPage = 1;
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
		
		
		var image = {
			url: 'Icon/marker.png',
		}
		var marker = new google.maps.Marker({
	        map: map,
	        position: {lat: 37.5, lng:127},
	        draggable:true,
	        icon: image
	    });
		var infowindow = new google.maps.InfoWindow({
		      content: '현재위치'
		});
		infowindow.open(map, marker);
		
		$scope.getAddr(marker.getPosition());
		navigator.geolocation.getCurrentPosition(function(position) {
			  console.log(position.coords.latitude, position.coords.longitude);
			  map.panTo({lat: position.coords.latitude, lng:position.coords.longitude});
			  marker.setPosition({lat: position.coords.latitude, lng:position.coords.longitude});
			  
			  $scope.getAddr(marker.getPosition());
		});
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