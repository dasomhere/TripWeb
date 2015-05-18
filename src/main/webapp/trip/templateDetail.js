
myApp.controller('templateDetailController', function($scope, $http, $routeParams) {
	$scope.$parent.pageClass = 'page-load';
	
	
	$http.get("/TripWeb/m/search/detailImage?contentId=" + $routeParams.contentid).success(function(searchDetailImage) {
		$scope.searchDetailImage = searchDetailImage.response.body.items.item;
	}).error(function() {
		alert("searchDetailImage error...");
	});
	
	$http.get("/TripWeb/m/search/detailCommon?contentId=" + $routeParams.contentid).success(function(searchDetailCommon) {
		$scope.searchDetailCommon = searchDetailCommon.response.body.items.item;
	}).error(function() {
		alert("searchDetailCommon error...");
	});
	
});
