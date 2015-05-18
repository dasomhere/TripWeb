
myApp.controller('stayDetailController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-local';
	
	console.log($scope.$parent.contentid+","+$scope.$parent.contenttypeid+","+$scope.$parent.city+","+$scope.$parent.sigunguCode+","+$scope.$parent.stay);
	$http.get("/TripWeb/m/local/hanokinfo?contentId="+$scope.$parent.contentid +"&contentTypeId="+$scope.$parent.contenttypeid+"&areaCode="+$scope.$parent.city +"&sigunguCode="+$scope.$parent.sigunguCode+"&hanOk="+$scope.$parent.stay).success(function(hanOkInfo){
		console.log(hanOkInfo);
	});
});




