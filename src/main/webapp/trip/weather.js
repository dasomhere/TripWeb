
myApp.controller('weatherController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-weather';
//	alert("weatherController");
	
	$http.get("weather.json").success(function(response) {
		$scope.names = response.records;
	});
	
	$scope.weather = function(woeid, city) {
		$http.post("/TripWeb/m/weather/weather", {woeid : woeid, cityName : city}).success(function(weather) {
//			$http.get("weatherLanguageChange.json").success(function(response) {
//				
//				$scope.days = response.days;
//				$scope.conditions = response.conditions;
//				
//				for(var i=0; i<weather.day.length; i++) {
//					for(var j=0; j<$scope.days.length; j++) {
//						if(weather.day[i] == $scope.days[j].day)
//							weather.day[i] = $scope.days[j].dayKR;
//					}
//				}
//				
//				for(var i=0; i<weather.code.length; i++) {
//					weather.text[i] = $scope.conditions[weather.code[i]].text;
//				}
//				
//				weather.nowConditionText = $scope.conditions[weather.nowConditionCode].text;
//				
////				alert(JSON.stringify(weather));
//				$scope.$parent.weather = weather;
//				location.href="#weatherResult";
//			}).error(function() {
//				alert("weather error...");
//			});
//		});
		});
	};
	
});

