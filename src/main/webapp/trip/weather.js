
myApp.controller('weatherController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-weather'; $scope.$parent.nowPage = '날씨';
	
	$http.get("weather.json").success(function(response) {
		$scope.names = response.records;
	});
	
});

