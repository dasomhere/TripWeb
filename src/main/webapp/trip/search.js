
myApp.controller('searchController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-search'; $scope.$parent.nowPage = '키워드검색';
	
	$scope.currentPage = 1;
	$scope.itemsPerPage = 12;
	
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
		$scope.currentPage = 1;
		var keyword=$("#keyword").val();
		var contentTypeId = $("#content option:selected").val();
		if(keyword == '') {
			return false;
		}
		$http.get("/TripWeb/m/search/search?keyword=" + keyword + "&contentTypeId=" + contentTypeId + "&numOfRows=" + $scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(searchResult) {
			$scope.searchResult = searchResult.response.body;
			console.log($scope.searchResult.items.item);
		}).error(function() {
			alert("search error...");
		});
		
	};
	
	$scope.contents = [
	                   {code: '',   name: '전체'},
	                   {code: '12', name: '관광지'},
	                   {code: '14', name: '문화시설'},
	                   {code: '15', name: '축제공연행사'},
	                   {code: '25', name: '여행코스'},
	                   {code: '28', name: '레포츠'},
	                   {code: '32', name: '숙박'},
	                   {code: '38', name: '쇼핑'},
	                   {code: '39', name: '음식점'}
	];
	
});
