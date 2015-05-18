
myApp.controller('localDetailController', function($scope, $http, $routeParams) {
	$scope.$parent.pageClass = 'page-local';

	if($scope.$parent.contenttypeid==12){
		$http.get("/TripWeb/m/local/detailcommon?contentId="+$routeParams.contentid +"&contentTypeId="+$routeParams.contenttypeid).success(function(localCommonDetail){
			$scope.localCommonDetail = localCommonDetail.response.body.items.item;
		});
		$http.get("/TripWeb/m/local/imageIintro?contentId="+$routeParams.contentid +"&contentTypeId="+$routeParams.contenttypeid).success(function(imageInfoDetail){
			$scope.$parent.imageInfoDetail = imageInfoDetail.response.body.items.item;
		});
		
		$http.get("/TripWeb/m/local/detailintro?contentId="+$routeParams.contentid+"&contentTypeId="+$routeParams.contenttypeid).success(function(localIntroDetail){
			$scope.localIntroDetail = localIntroDetail.response.body.items.item;
		}).error(function() {
			alert("detailIntro  error...");
		});
	}
});




