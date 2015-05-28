
myApp.controller('loadController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-load'; $scope.$parent.nowPage = '코스';
	$http.get("/TripWeb/m/load/city").success(function(citys) {
		console.log(citys);
		$scope.citys = citys.response.body.items.item;
	}).error(function() {
		alert("load.city error...");
	});
	
	$http.get("/TripWeb/m/load/category").success(function(categorys) {
		console.log(categorys.item);
		$scope.categorys = categorys.response.body.items.item;
	}).error(function() {
		alert("load.category error...");
	});
	
	$scope.search = function() {
		var city = $("#city option:selected").val();
		var category = $("#category option:selected").val();
		alert(city + ", " + category);
		$http.get("/TripWeb/m/load/search?areaCode=" + city + "&cat2=" + category + "&contentTypeId=25").success(function(loadResult) {
			$scope.loadResult = loadResult.response.body.items.item;
		}).error(function() {
			alert("search error...");
		});
	};
	
	$scope.detail = function(contentid, title) {
		alert(contentid + " " +  title);
		$scope.$parent.loadTitle = title;
		$http.get("/TripWeb/m/load/detail?contentId=" + contentid + "&contentTypeId=25").success(function(loadDetail) {
			$scope.$parent.loadDetail = loadDetail.response.body.items.item;
			location.href="#loadDetail";
		}).error(function() {
			alert("LoadDetail error...");
		});
	}
	
});
