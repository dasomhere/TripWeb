
myApp.controller('loginController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-login';
	$scope.loginResult={};
	
	$scope.login = function() {
		var id=$("#id").val();
		var password=$("#password").val();
		if(id == '') {
			$("#idcheck").html("아이디를 입력하세요.");
			return false;
		}
		if(password == '') {
			$("#idcheck").html("비밀번호를 입력하세요.");
			return false;
		}
		$http.post("/TripWeb/m/login/login", {id : id, password : password}).success(function(loginResult) {
			alert("loginResult = " + JSON.stringify(loginResult));
			$scope.loginResult = loginResult;
			if(loginResult.loginStatus == false) {
				$("#idcheck").html("아이디/비밀번호가 올바르지 않습니다.");
			} else {
				$scope.$parent.loginResult = loginResult;
				location.href="#event";
			}
		}).error(function() {
			alert("login error...");
		});
	};
	$scope.logincheck = function() {
		$http.get("/TripWeb/m/login/logincheck").success(function(loginResult) {
			alert("loginResult = " + JSON.stringify(loginResult));
			$scope.loginResult = loginResult;
			$scope.$parent.loginResult = loginResult;
		}).error(function() {
			alert("logincheck error...");
		});
	};
	
//	alert("loginController");
});

