
myApp.controller('localDetailController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-local';
	alert("localDetailController");
	
	$http.get("/TripWeb/m/local/detail").success(function(data) {
		alert(data);
		$scope.details = data;
	});
});




