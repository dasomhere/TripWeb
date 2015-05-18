
myApp.controller('localController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-local';
	
	
	var city = $("#city option:selected").val();
	var sigunguCode = $("#sigunguCode option:selected").val();
	var contentTypeId = $("#contentTypeId option:selected").val();
	
	$http.get("/TripWeb/m/local/city").success(function(citys) {
		console.log(citys);
		$scope.citys = citys.response.body.items.item;
	}).error(function() {
		alert("local.city error...");
	});;
	
	$http.get("/TripWeb/m/local/gus?areaCode=1").success(function(gus) {
		$scope.gus = gus.response.body.items.item;
	}).error(function() {
		alert("server error...");
	});
	
	$scope.cityChange = function() {
		var city = $("#city option:selected").val();
		$http.get("/TripWeb/m/local/gus?areaCode=" + city).success(function(gus) {
			$scope.gus = gus.response.body;
		}).error(function() {
			alert("server error...");
		});
	};

	$scope.stay = function() {
		var stay = $("#contentTypeId option:selected").val();
		if(stay==32){
			$('#select').html("<option value='hanOk'>한옥</option>");
			$('#select').append("<option value='goodStay'>굿스테이</option>");
			$('#select').append("<option value='benikia'>베니키아</option>");
		}else{
			$('#select').html("<option value='#'>선택사항 없음</option>");
		}
	};
	
	$scope.search = function() {
		var city = $("#city option:selected").val();
		var sigunguCode = $("#sigunguCode option:selected").val();
		var contentTypeId = $("#contentTypeId option:selected").val();
		var stay = $("#select option:selected").val();
		console.log(city + ", "+ sigunguCode +", "+ contentTypeId + ", "+stay);
		
		if(stay=='#'){
			$http.get("/TripWeb/m/load/search?areaCode=" + city + "&sigunguCode=" + sigunguCode + "&contentTypeId="+contentTypeId).success(function(localResult) {
					$scope.localResult = localResult.response.body;
			}).error(function() {
				alert('city error');
			});	
		} else if(stay=="hanOk"){
			$http.get("/TripWeb/m/local/searchhanok?areaCode=" + city + "&sigungucode=" + sigunguCode + "&contentTypeId="+contentTypeId+"&"+stay+"=1").success(function(hanokResult) {
				$scope.localResult = hanokResult.response.body;
			}).error(function() {
				alert('hanOk error');
			});
		}else if(stay="goodStay"){
			alert("굿스테이");
		}else
			alert("베니키아");
	};
});