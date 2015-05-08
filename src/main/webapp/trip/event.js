
myApp.controller('eventController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-event';
//	alert("eventController xxx");
	
	$http.get("/TripWeb/m/local/city").success(function(citys) {
		console.log(citys);
		$scope.citys = citys;
	});
	
	$scope.cityChange = function() {
		$http.get("/TripWeb/m/event/festival?code=" + $scope.selectedCity).success(function(events) {
			console.log(events);
			$scope.events = events;
		}).error(function() {
			alert("server error...");
		});
	};
	
//	$http.get("/TripWeb/m/event/festival").success(function(events) {
//		console.log(events);
//		$scope.events=events;
//	});
	
});

