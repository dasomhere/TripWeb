
myApp.controller('weatherController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-weather';
//	alert("weatherController");
	
	$http.get("weather.json").success(function(response) {
		$scope.names = response.records;
	});
	
	$scope.weatherSearch = function(woeid, cityName) {
//		$http.get("/TripWeb/m/weather/weather?woeid=" + woeid).success(function(weather) {
//				$scope.$parent.weather = weather.query.results.channel;
				$scope.$parent.woeid = woeid;
				$scope.$parent.cityName = cityName;
				location.href="#weatherResult";
//			}).error(function() {
//				alert("weather error...");
//			});
//		});
	};
	
});

