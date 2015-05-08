
myApp.controller('eventController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-event';
//	alert("eventController xxx");
	
	$http.get("/TripWeb/m/event/festival").success(function(events) {
		console.log(events);
		$scope.events=events;
	});
	
});

