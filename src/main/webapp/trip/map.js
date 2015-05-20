
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
	
//	$scope.checkboxModel = {
//        value1 : false,
//        value2 : false
//	};

	$scope.contents = [
	                   {code: '12', name: '관광지', enabled: false},
	                   {code: '14', name: '문화시설', enabled: false},
	                   {code: '15', name: '축제공연행사', enabled: false},
	                   {code: '25', name: '여행코스', enabled: false},
	                   {code: '28', name: '레포츠', enabled: false},
	                   {code: '32', name: '숙박', enabled: false},
	                   {code: '38', name: '쇼핑', enabled: false},
	                   {code: '39', name: '음식점', enabled: false}
	];
	
	$scope.currentPage = 1;
	$scope.itemsPerPage = 50;
	
	$scope.data = [];
	
	$scope.search = function() {
		alert(JSON.stringify($scope.contents));
		
		var city = $("#city option:selected").val();
		var sigunguCode = $("#sigunguCode option:selected").val();
		
		for(var i=0; i<$scope.contents.length; i++) {
			if($scope.contents[i].enabled) {
				var contentTypeId = $scope.contents[i].code;
				
				$http.get("/TripWeb/m/map/search?areaCode=" + city + "&sigunguCode=" + sigunguCode + "&contentTypeId="+contentTypeId+ "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(mapResult) {
					$scope.data.push(mapResult.response.body);
				}).error(function() {
					alert('error');
				});	
			}
		}
		console.log($scope.data);
	};
});