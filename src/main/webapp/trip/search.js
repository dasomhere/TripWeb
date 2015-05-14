
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
		
//		$http.post("/TripWeb/m/login/login", {id : id, password : password}).success(function(loginResult) {
//			alert("loginResult = " + JSON.stringify(loginResult));
//			$scope.loginResult = loginResult;
//			if(loginResult.loginStatus == false) {
//				$("#idcheck").html("아이디/비밀번호가 올바르지 않습니다.");
//			} else {
//				$scope.$parent.loginResult = loginResult;
//				location.href="#event";
//			}
//		}).error(function() {
//			alert("login error...");
//		});
	};
	
});
