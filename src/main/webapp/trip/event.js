
myApp.controller('eventController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-event';
//	alert("eventController xxx");
	
	$http.get("/TripWeb/m/local/city").success(function(citys) {
		console.log(citys);
		$scope.citys = citys;
	});
	
	$scope.search = function() {
		var city = $("#city option:selected").val();
		var month = $("#month option:selected").val();		
		$http.post("/TripWeb/m/event/festival", {citys : city, month : month}).success(function(events) {
			console.log(events);
			$scope.events = events;
		}).error(function() {
		});
	};
	

	
});

