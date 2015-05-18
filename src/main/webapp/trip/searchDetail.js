
myApp.controller('searchDetailController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-load';
	
	$http.get("/TripWeb/m/search/detailImage?contentId=" + $scope.$parent.contentId).success(function(searchDetailImage) {
		$scope.searchDetailImage = searchDetailImage.response.body.items.item;
	}).error(function() {
		alert("searchDetailImage error...");
	});
	
	$http.get("/TripWeb/m/search/detailCommon?contentId=" + $scope.$parent.contentId).success(function(searchDetailCommon) {
		$scope.searchDetailCommon = searchDetailCommon.response.body.items.item;
	}).error(function() {
		alert("searchDetailCommon error...");
	});
	
});
