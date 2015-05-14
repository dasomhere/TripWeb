
myApp.controller('weatherResultController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-event';
	
	$http.get("weatherLanguageChange.json").success(function(response) {
		$scope.convertConditionCode = function(code) {
			return response.conditions[code].text;
		}
		
		$scope.convertDay = function(day) {
			for(var i=0; i<response.days.length; i++) {
				if(day == response.days[i].day)
					return response.days[i].dayKR;
			}
		}
		
//		$http.get("weatherLanguageChange.json").success(function(response) {
		
//		$scope.days = response.days;
//		$scope.conditions = response.conditions;
//		
//		for(var i=0; i<weather.day.length; i++) {
//			for(var j=0; j<$scope.days.length; j++) {
//				if(weather.day[i] == $scope.days[j].day)
//					weather.day[i] = $scope.days[j].dayKR;
//			}
//		}
//		
//		for(var i=0; i<weather.code.length; i++) {
//			weather.text[i] = $scope.conditions[weather.code[i]].text;
//		}
		
//		weather.nowConditionText = $scope.conditions[weather.nowConditionCode].text;
		
//		alert(JSON.stringify(weather));
		
	});
});

