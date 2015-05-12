
myApp.controller('loadController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-load';
	$http.get("/TripWeb/m/load/city").success(function(citys) {
		alert(citys);
		console.log(citys);
		$scope.citys = citys;
	}).error(function() {
		alert("load.city error...");
	});
	
	$http.get("/TripWeb/m/load/category").success(function(categorys) {
		console.log(categorys);
		$scope.categorys = categorys;
	}).error(function() {
		alert("load.category error...");
	});
	
	$scope.search = function() {
		var city = $("#city option:selected").val();
		var category = $("#category option:selected").val();
		alert(city + ", " + category);
		$http.post("/TripWeb/m/load/search", {city : city, category : category}).success(function(loadResult) {
			$scope.loadResult = loadResult;
		}).error(function() {
			alert("search error...");
		});
	};
	
	$scope.detail = function(contentid, title) {
		alert(contentid);
		$http.post("/TripWeb/m/load/detail", {contentid : contentid, title : title}).success(function(loadDetail) {
			$scope.$parent.loadDetail = loadDetail;
			location.href="#loadDetail";
		}).error(function() {
			alert("LoadDetail error...");
		});
	}
	
});
