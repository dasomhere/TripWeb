
myApp.controller('localController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-local';
	alert("localController");
	
	$http.get("/TripWeb/m/local/city").success(function(citys) {
		console.log(citys);
		$scope.citys = citys;
	});
	
	$scope.cityChange = function() {
		alert("cityCahnage.... = " + $scope.selectedCity);
		$http.get("/TripWeb/m/local/gus?cityCode=" + $scope.selectedCity).success(function(gus) {
			console.log(gus);
			$scope.gus = gus;
		}).error(function() {
			alert("server error...");
		});
	};
	
	$scope.type = function() {
		alert("cityCode="+ $scope.selectedCity + "&sigunguCode="+ $scope.selectedCityGu + "&contentTypeid="+$scope.selectedType);
		$http.get("/TripWeb/m/local/type?cityCode="+ $scope.selectedCity +"&sigunguCode=1"+ "&contentTypeId="+$scope.selectedType).success(function(types) {
			alert(JSON.stringify(types));
			console.log(type);
//			$scope.types = types;
			
		}).error(function() {
			alert("type error...");
		});
	};
});




