
myApp.controller('stayDetailController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-local';
	
	$http.get("/TripWeb/m/local/detailcommon?contentId="+$scope.$parent.contentid +"&contentTypeId="+$scope.$parent.contenttypeid).success(function(stayCommonDetail){
		$scope.stayCommonDetail = stayCommonDetail.response.body.items.item;
	});
	
	console.log($scope.$parent.contentid+","+$scope.$parent.contenttypeid+","+$scope.$parent.city+","+$scope.$parent.sigunguCode+","+$scope.$parent.stay);
	$http.get("/TripWeb/m/local/hanokinfo?contentId="+$scope.$parent.contentid +"&contentTypeId="+$scope.$parent.contenttypeid+"&areaCode="+$scope.$parent.city +"&sigunguCode="+$scope.$parent.sigunguCode+"&hanOk="+$scope.$parent.stay).success(function(hanOkInfo){
		console.log(hanOkInfo);
		$scope.hanOkInfo = hanOkInfo.response.body.items.item;
	});
});




