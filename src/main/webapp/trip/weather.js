
myApp.controller('weatherController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-weather';
//	alert("weatherController");
	
	$http.get("weather.json").success(function(response) {
		$scope.names = response.records;
//		alert($scope.names[0].city);
	});
	
	$scope.weather = function(woeid, city) {
		$http.post("/TripWeb/m/weather/weather", {woeid : woeid, cityName : city}).success(function(weather) {
			$http.get("weatherLanguageChange.json").success(function(response) {
				
				$scope.days = response.days;
				
//				alert($scope.days[0].day);
//				alert(weather.day[0]);
				
				for(var i=0; i<5; i++) {
					for(var j=0; j<7; j++) {
						if(weather.day[i] == $scope.days[j].day)
							weather.day[i] = $scope.days[j].dayKR;
					}
				}
				
				$scope.conditions = response.conditions;
				alert($scope.conditions[0].text);
				
				alert(JSON.stringify(weather));
				$scope.$parent.weather = weather;
				location.href="#weatherResult";
			}).error(function() {
				alert("weather error...");
			});
		});
	};
	
});

