
myApp.controller('weatherController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-weather';
	
	$http.get("weather.json").success(function(response) {
		$scope.names = response.records;
	});
	
});

