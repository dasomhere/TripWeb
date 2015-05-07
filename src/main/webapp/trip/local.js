
myApp.controller('localController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-local';
	alert("localController");
	
	$http.get("/TripWeb/m/local/city").success(function(citys) {
		alert(JSON.stringify(citys));
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
});




