
myApp.controller('searchController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-load';
	
	$scope.search = function() {
		var keyword=$("#keyword").val();
		if(keyword == '') {
			return false;
		}
		alert(keyword);
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
