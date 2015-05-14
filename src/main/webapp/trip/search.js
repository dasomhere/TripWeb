
myApp.controller('searchController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-load';
	
	$scope.search = function() {
		var keyword=$("#keyword").val();
		alert(keyword);
		if(keyword == '') {
			return false;
		}
		$http.get("/TripWeb/m/search/search?keyword=" + keyword).success(function(searchResult) {
			$scope.searchResult = searchResult.response.body.items.item;
		}).error(function() {
			alert("search error...");
		});
		
		
		
	};
	$http.get("/TripWeb/m/search/city").success(function(citys) {
		$scope.convertAreacode = function(areacode, sigungucode) {
			alert(areacode + " " + sigungucode);
//			$http.get("/TripWeb/m/search/sigungu?areaCode=" + areacode).success(function(sigungus) {
//				for(var i=0; i<citys.response.body.items.item.length; i++) {
//					if(areacode == citys.response.body.items.item[i].code)
//						return citys.response.body.items.item[i].name;
//				}
//				
//			});
		}
	});
});
