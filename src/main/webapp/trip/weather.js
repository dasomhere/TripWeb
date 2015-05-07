
myApp.controller('weatherController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-weather';
//	alert("weatherController");
	
	$http.get("weather.json")
	    .success(function(response) {$scope.names = response.records;});
	
	$scope.weather = function(woeid) {
		$http.post("/TripWeb/m/weather/weather", {woeid : woeid}).success(function(weather) {
			alert(JSON.stringify(weather));
		}).error(function() {
			alert("weather error...");
		});
		
	};
	
});

