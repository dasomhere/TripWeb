
myApp.controller('searchController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-load';
	
	$scope.currentPage = 1;
	$scope.itemsPerPage = 10;
	
	$scope.changePage = function() {
		console.log("page = " + $scope.currentPage);
		
		var keyword=$("#keyword").val();
		if(keyword == '') {
			return false;
		}
		
		$http.get("/TripWeb/m/search/search?keyword=" + keyword + "&numOfRows=" + $scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(searchResult) {
			$scope.searchResult = searchResult.response.body;
		}).error(function() {
			alert("search error...");
		});
		
	};
	
	$scope.search = function() {
		var keyword=$("#keyword").val();
		if(keyword == '') {
			return false;
		}
		$http.get("/TripWeb/m/search/search?keyword=" + keyword + "&numOfRows=" + $scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(searchResult) {
			$scope.searchResult = searchResult.response.body;
			console.log($scope.searchResult.items.item);
		}).error(function() {
			alert("search error...");
		});
		
	};
	
	$scope.alphabet = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 
	                   'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
	console.log($scope.alphabet);
	
});
