
myApp.controller('searchDetailController', function($scope, $http, $routeParams) {
	$scope.$parent.pageClass = 'page-searchDetail';
	
	
	
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
	
	$http.get("/TripWeb/m/search/detailIntro?contentId=" + $routeParams.contentid + "&contentTypeId=" + $routeParams.contenttypeid).success(function(searchDetailIntro) {
		$scope.searchDetailIntro = searchDetailIntro.response.body.items.item;
	}).error(function() {
		alert("searchDetailIntro error...");
	});
	
	$http.get("/TripWeb/m/search/detailInfo?contentId=" + $routeParams.contentid + "&contentTypeId=" + $routeParams.contenttypeid).success(function(searchDetailInfo) {
		$scope.searchDetailInfo = searchDetailInfo.response.body.items.item;
	}).error(function() {
		alert("searchDetailInfo error...");
	});
	
	$scope.$on('mapInitialized', function(event, map) { 
//		alert("mapInitialized...");
	});
	
});
