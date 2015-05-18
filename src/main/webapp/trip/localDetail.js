
myApp.controller('localDetailController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-local';
	
	console.log("contentid =" + $scope.$parent.contentid);
	console.log("contenttypeid =" + $scope.$parent.contenttypeid);
	
	if($scope.$parent.contenttypeid==12){
		$http.get("/TripWeb/m/local/detailcommon?contentId="+$scope.$parent.contentid +"&contentTypeId="+$scope.$parent.contenttypeid).success(function(localCommonDetail){
			$scope.localCommonDetail = localCommonDetail.response.body.items.item;
		});
		$http.get("/TripWeb/m/local/imageIintro?contentId="+$scope.$parent.contentid +"&contentTypeId="+$scope.$parent.contenttypeid).success(function(imageInfoDetail){
			$scope.$parent.imageInfoDetail = imageInfoDetail.response.body.items.item;
		});
		
		$http.get("/TripWeb/m/local/detailintro?contentId="+$scope.$parent.contentid+"&contentTypeId="+$scope.$parent.contenttypeid).success(function(localIntroDetail){
			$scope.localIntroDetail = localIntroDetail.response.body.items.item;
		}).error(function() {
			alert("detailIntro  error...");
		});
	}
});




