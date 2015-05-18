
myApp.controller('eventDetailController', function($scope, $http, $routeParams) {
	$scope.$parent.pageClass = 'page-load';
	
	console.log("contentid =" + $scope.$parent.contentid);
	console.log("contenttypeid =" + $scope.$parent.contenttypeid);
	
	if($scope.$parent.contenttypeid==15){
		$http.get("/TripWeb/m/event/detail?contentId="+$routeParams.contentid +"&contentTypeId="+$routeParams.contenttypeid).success(function(eventDetail){
			$scope.eventDetail = eventDetail.response.body.items.item;
			
			
		});
		$http.get("/TripWeb/m/event/detailImage?contentId="+$routeParams.contentid +"&contentTypeId="+$routeParams.contenttypeid).success(function(imageDetail){
			alert(imageDetail);
			$scope.imageDetail = imageDetail.response.body.items.item;
		}).error(function() {
			alert("detailIntro  error...");
		});
	}
});