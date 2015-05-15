
myApp.controller('searchController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-load';
	
	$scope.currentPage = 1;
	$scope.itemsPerPage = 20;
	
	$scope.changePage = function() {
		console.log("page = " + $scope.currentPage);
		
		var keyword=$("#keyword").val();
		alert(keyword);
		if(keyword == '') {
			return false;
		}
		
		$http.get("/TripWeb/m/search/search?keyword=" + keyword + "&numOfRows=" + $scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(searchResult) {
			$scope.searchResult = searchResult.response.body.items.item;
			$scope.searchResult = searchResult.response;
		}).error(function() {
			alert("search error...");
		});
		
	};
	
	$scope.search = function() {
		var keyword=$("#keyword").val();
		alert(keyword);
		if(keyword == '') {
			return false;
		}
		$http.get("/TripWeb/m/search/search?keyword=" + keyword + "&numOfRows=" + $scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(searchResult) {
			$scope.searchResult = searchResult.response.body.items.item;
			$scope.searchResult = searchResult.response;
		}).error(function() {
			alert("search error...");
		});
		
	};
	
	$scope.detail = function() {
		location.href="#searchDetail";
	};
	
	
	
	
//	$http.get("/TripWeb/m/search/city").success(function(citys) {
//		$scope.convertAreacode = function(areacode, sigungucode) {
//			alert(areacode + " " + sigungucode);
//			$http.get("/TripWeb/m/search/sigungu?areaCode=" + areacode).success(function(sigungus) {
//				for(var i=0; i<citys.response.body.items.item.length; i++) {
//					if(areacode == citys.response.body.items.item[i].code)
//						return citys.response.body.items.item[i].name;
//				}
//				
//			});
//		}
//	});
});
