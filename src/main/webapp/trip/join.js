
myApp.controller('joinController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-join';
	$scope.dis = true;
	$scope.insertId = function() {
		var id=$("#id").val();
		var password=$("#password").val();
		var name=$("#name").val();
		var email=$("#email").val();
		
		$http.post("/TripWeb/m/join/join", {name : name, id : id, password : password, email : email}).success(function(joinResult) {
			alert("성공");
			location.href="#login";
		}).error(function() {
			alert("실패");
			location.href="#join";
		});
	};
	
	$scope.idCheck = function() {
		var id=$("#id").val();
//		alert(id);
		$http.post("/TripWeb/m/join/check", {id : id}).success(function(joinResult) {
//			alert("loginResult = " + JSON.stringify(loginResult));
//			$scope.loginResult = loginResult;
			if(joinResult.status == true) {
				$("#idcheck").html("아이디가 이미 존재 합니다.");
				$scope.dis = true;
			}
		}).error(function() {
			$("#idcheck").html("아이디를 사용하실 수 있습니다.");
			$scope.dis=false;
		});
	};
});

