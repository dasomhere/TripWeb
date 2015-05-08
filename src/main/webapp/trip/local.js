
myApp.controller('localController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-local';
	alert("localController");
	
	$http.get("/TripWeb/m/local/city").success(function(citys) {
		console.log(citys);
		$scope.citys = citys;
	});
	
	$scope.cityChange = function() {
		$http.get("/TripWeb/m/local/gus?cityCode=" + $scope.selectedCity).success(function(gus) {
			console.log(gus);
			$scope.gus = gus;
		}).error(function() {
			alert("server error...");
		});
	};
	
	$scope.type = function() {
//		alert("cityCode="+ $scope.selectedCity + "&sigunguCode="+ $scope.selectedCityGu + "&contentTypeId="+$scope.selectedType);
		$http.get("/TripWeb/m/local/type?cityCode="+ $scope.selectedCity +"&sigunguCode="+$scope.selectedCityGu+"&contentTypeId="+$scope.selectedType).success(function(types) {
//			alert(JSON.stringify(types));
			$scope.types = types;
			$scope.$parent.types = types;
		
		}).error(function() {
			alert("type error...");
		});
	};
	
	$scope.contentid = function(contentid) {
		alert(contentid);
		$http.post("/TripWeb/m/local/detail", {contentid : contentid}).success(function(contentid){
			alert(JSON.stringify(contentid));
			$scope.$parent.contentid = contentid;
			location.href="#localDetail";
		}).error(function(url) {
			alert("post error..."+ this.url);
		});
	};
	
});




