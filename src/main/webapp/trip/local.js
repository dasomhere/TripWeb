
myApp.controller('localController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-local';
//	alert("localController");
	
	$http.get("/TripWeb/m/local/city").success(function(city) {
		alert(city);
		$scope.locals = city;
	});
	
	$scope.click = function(locals) {
		if(locals=="서울"){
			$http.get("/TripWeb/m/local/seoul").success(function(seoul) {
				$scope.locals = seoul;
			});
				//  	강서구 클릭시 호출
			$scope.click= function(data) {
				if(data=="강서구"){
					alert("강서구");
					$http.get("/TripWeb/m/local/nature").success(function(kang) {
						alert(JSON.stringify(kang));
						$scope.locals= kang;
					});
				}
			}
		}
	}
	

});

