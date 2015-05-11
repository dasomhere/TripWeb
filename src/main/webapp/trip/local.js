
myApp.controller('localController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-local';
	alert("localController");
	
	var city= null;
	$http.get("/TripWeb/m/local/city").success(function(citys) {
		console.log(citys);
		$scope.citys = citys;
	});
	
	$scope.cityChange = function() {
		var city = $scope.citys;
		$http.get("/TripWeb/m/local/gus?cityCode=" + $scope.selectedCity).success(function(gus) {
			$scope.gus = gus;
		}).error(function() {
			alert("server error...");
		});
	};
	
	$scope.type = function() {
		alert("cityCode="+ $scope.selectedCity + "&sigunguCode="+ $scope.selectedCityGu + "&contentTypeId="+$scope.selectedType);
		$http.get("/TripWeb/m/local/type?cityCode="+ $scope.selectedCity +"&sigunguCode="+$scope.selectedCityGu+"&contentTypeId="+$scope.selectedType).success(function(types) {
//			alert(JSON.stringify(types));
			$scope.types = types;
			$scope.$parent.types = types;
		
		}).error(function() {
			alert("type error...");
		});
	};
	
	$scope.select = function() {
		$http.post("/TripWeb/m/local/search",{city : $scope.selectedCity, gus : $scope.selectedCityGu, contentid : $scope.selectedType}).success(function(localResult){
			$scope.localResult = localResult;
		}).error(function() {
			alert("serch error");
		});
	};
	
	$scope.contentid = function(contentid) {
		$http.post("/TripWeb/m/local/detail", {contentid : contentid}).success(function(localDetail){
			$scope.$parent.localDetail = localDetail;
			location.href="#localDetail";
		}).error(function(url) {
			alert("post error..."+ this.url);
		});
	};
	
});




